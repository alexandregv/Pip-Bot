module PipBot
  module Events
    # Say welcome to new users
    module JoinMessage
      extend Discordrb::EventContainer
      member_join do |event|
        event.server.text_channels.select{ |channel| channel.id == CONFIG.welcome_channel }[0].send_message("Hop hop, on a un nouveau!  \nBienvenue à <@#{event.member.id}> <:poroblush:371719480146919425>")
      end
    end

    module JoinPM
      extend Discordrb::EventContainer
      
      member_join do |event|
        event.user.pm("Bienvenue sur la communauté discord dédiée à Fallout 76 ! ✌️\\n Si tu vois ce message, c'est que tu es conscient des règles évoquées dans la charte. \nN'hésite pas à aller voir le salon informations pour connaitre l'utilité de chaque salon :slight_smile:")
      end
    end

  end
end
