module PipBot
  module Events
    
    module LeaveMessage
      extend Discordrb::EventContainer
      member_leave do |event|
        unless event.server.bans.include? event.user
          event.server.text_channels.select{ |channel| channel.id == CONFIG.welcome_channel }[0].send_message("Oh, #{event.member.username}##{event.member.discriminator} nous a quittés <:porosad:371719545762742304>")
        end
      end
    end
  end
end