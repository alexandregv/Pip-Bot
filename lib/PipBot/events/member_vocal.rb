module PipBot
	module Events
		module JailMove
			extend Discordrb::EventContainer
			voice_state_update do |event|
				member = event.server.member event.user
				if member.role? CONFIG.jail_role
					event.server.move(member, CONFIG.jail_channel) unless event.channel == CONFIG.jail_channel
				end
			end
		end
	end
end
