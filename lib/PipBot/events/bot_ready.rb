module PipBot
  module Events
    # Say welcome to new users
    module BotReady
      extend Discordrb::EventContainer
      
      ready do |event|
		BOT.game = "Fallout 76 | !help"
      end
    end
  end
end
