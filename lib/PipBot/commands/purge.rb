module PipBot

  module Commands

    # Prints most useful information about the bot.
    module Purge
      extend Discordrb::Commands::CommandContainer
      command([:purge], description: 'Efface les N derniers messages.', min_args: 1, max_args: 1, required_permissions: [:manage_messages]) do |event, n|
          if n.to_i.to_s == n then event.channel.prune(n.to_i + 1)
          else event.respond(":x: Merci d'entrer un nombre de messages à supprimer.") end
	  return
      end
    end
  end
end
