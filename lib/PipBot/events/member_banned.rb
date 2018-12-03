module PipBot
  module Events
    # Say welcome to new users
    module BanMessage
      extend Discordrb::EventContainer
      user_ban do |event|
        event.server.text_channels.select{ |channel| channel.id == CONFIG.welcome_channel }[0].send_message("<@#{event.user.id}> a été bannis! <:poroshock:371719564658212875>")
      end
    end
  end
end