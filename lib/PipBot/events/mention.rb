module PipBot
  module Events
    module Mention
      extend Discordrb::EventContainer
      mention do |event|
        event.respond("Pip-Boy v#{VERSION} à votre service!  \n `#{CONFIG.prefix}help` pour la liste des commandes :desktop:")
      end
    end
  end
end
