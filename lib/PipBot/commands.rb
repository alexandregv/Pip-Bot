module PipBot
  module Commands
    Dir["#{File.dirname(__FILE__)}/commands/*.rb"].each { |file| require file }

    @commands = [
      About,
      Purge,
      Poll,
      Jail,
	  #PollEvents,
    ]

    def self.include!
      @commands.each do |command|
        PipBot::BOT.include!(command)
      end
    end
  end
end
