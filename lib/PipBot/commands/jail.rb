module PipBot
  module Commands
    module Jail
      extend Discordrb::Commands::CommandContainer
			command(:jail, description: 'En prison!', usage: '!jail <membre>', min_args: 1, max_args: 1, allowed_roles: CONFIG.admin_roles) do |event, *args|
				target = event.message.mentions[0].on event.server
				if target.role? CONFIG.jail_role
					#event.respond "#{taget.name} est deja prisonnier ! \n`#{CONFIG.prefix}unjail pour le libérer.`"
					event.respond "#{taget.name} est déjà prisonnier !`"
				else
					target.set_roles CONFIG.jail_role
					event.respond "#{target.name} a été envoyé en prison !"
				end	
				return
			end
		
=begin	
			command(:unjail, description: 'Libere un prisonnier.', usage: '!unjail <membre>', min_args: 1, max_args: 1, allowed_roles: CONFIG.admin_roles) do |event, *args|
				target = event.message.mentions[0].on event.server
				if target.role? CONFIG.jail_role
					target.remove_role CONFIG.jail_role
					event.respond "#{taget.name} a été libéré.`"
				else
					event.respond "#{target.name} n'est pas prisonnier !"
				end	
				return
			end
=end
    end
  end
end
