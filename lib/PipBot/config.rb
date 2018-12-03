module PipBot
  
  # Holds PipeBot configuration.
  class Config
    require_relative 'store_data'
    include StoreData
  
    def initialize
      @file = "#{Dir.pwd}/data/config.yml"
      temp = load_file(@file)
      @config = temp if temp.is_a?(Hash) && !temp.empty?
      setup_config if @config.nil?
      create_methods
    end

    private

    def setup_config
      @config = {}

      puts 'Aucun fichier de configuration détecté. Création en cours...'
      puts 'Token: '
      @config[:token] = gets.chomp

      puts 'Client/Application ID: '
      @config[:client_id] = gets.chomp

      puts 'ID du propriétaire du bot (default = 131218864234168321)'
      @config[:owner_id] = gets.chomp
      @config[:owner_id] = 131218864234168321 if @config[:owner_id].empty?

      puts 'Prefix des commandes (default = "!")'
      @config[:prefix] = gets.chomp
      @config[:prefix] = '!' if @config[:prefix].empty?

      puts 'Code de permissions (default = 66321471)'
      @config[:permissions_code] = gets.chomp
      @config[:permissions_code] = 66321471 if @config[:permissions_code].empty?
      
      puts 'ID du salon pour les messages de bienvenue'
      @config[:welcome_channel] = gets.chomp
      
      save
    end

    def create_methods
      @config.keys.each do |key|
        self.class.send(:define_method, key) do
          @config[key]
        end
      end
    end

    def save
      save_to_file(@file, @config)
    end
  end
end
