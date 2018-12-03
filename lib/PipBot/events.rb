module PipBot
  
  # Module for Pip-Bot events.
  module Events
    # Require files from directory
    Dir["#{File.dirname(__FILE__)}/events/*.rb"].each { |file| require file }

  @events = [
      Mention,
#      JoinMessage,
#      LeaveMessage,
#      BanMessage,
	    JailMove,
      BotReady,
      JoinPM,
      Charter,
	    RoleSelector
]

    def self.include!
      @events.each do |event|
        PipBot::BOT.include!(event)
      end
    end
  end
end
