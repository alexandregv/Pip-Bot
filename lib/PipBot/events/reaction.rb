module PipBot
	module Events
		module Charter
			extend Discordrb::EventContainer	
			
			reaction_add do |event|
				if event.message.id == CONFIG.charter_msg_id && event.emoji.name == '👍'
					if not event.user.role? CONFIG.charter_role
						puts "#{event.user.name} a accepté la charte."	
						event.user.add_role CONFIG.charter_role, "#{event.user.name} a accepte la charte."
					end 
				end
			end

			reaction_remove do |event|
				if event.message.id == CONFIG.charter_msg_id && event.emoji.name == '👍'
					if event.user.role? CONFIG.charter_role
						puts "#{event.user.name} a refusé la charte."	
						event.user.remove_role CONFIG.charter_role, "#{event.user.name} a refuse la charte."
					end
				end
			end
		end
	
		module RoleSelector
			extend Discordrb::EventContainer
			levels_emojis = ['🥇', '🥈', '🥉']
			classes_emojis = ['🔫', '🔪', '🔎', '🔨', '📦']
			
			reaction_add do |event|
				next if event.user.current_bot?
				if event.message.id == CONFIG.roleselector_levels_msg_id
			  	#levels_emojis.each { |j| event.message.react j }
					CONFIG.roles_levels.each { |role| event.user.remove_role role if event.user.role? role }
					event.user.add_role CONFIG.roles_levels[levels_emojis.index(event.emoji.name)]
					levels_emojis.each { |emoji| event.message.delete_reaction event.user, emoji unless emoji == event.emoji.name}
				end

				if event.message.id == CONFIG.roleselector_classes_msg_id
			  	#classes_emojis.each { |j| event.message.react j }
					CONFIG.roles_classes.each { |role| event.user.remove_role role if event.user.role? role }
					event.user.add_role CONFIG.roles_classes[classes_emojis.index(event.emoji.name)]
					classes_emojis.each { |emoji| event.message.delete_reaction event.user, emoji unless emoji == event.emoji.name}
				end

			  #TODO: refactor 1 seul code juste changer vars
			end
		
#TODO; gerer remove_reac	
=begin	
			reaction_remove do |event|
				next if event.user.current_bot?
				if event.message.id == CONFIG.roleselector_levels_msg_id
					CONFIG.roles_levels.each { |role| event.user.remove_role role if event.user.role? role }
					levels_emojis.each { |emoji| event.message.delete_reaction event.user, emoji unless emoji == event.emoji.name}
				end

				if event.message.id == CONFIG.roleselector_classes_msg_id
					CONFIG.roles_classes.each { |role| event.user.remove_role role if event.user.role? role }
					classes_emojis.each { |emoji| event.message.delete_reaction event.user, emoji unless emoji == event.emoji.name}
				end
			end
=end
		end
	end
end
