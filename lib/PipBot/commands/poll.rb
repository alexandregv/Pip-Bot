module PipBot
  module Commands
    module Poll
      extend Discordrb::Commands::CommandContainer
  		emojis = ['0⃣', '1⃣', '2⃣', '3⃣', '4⃣', '5⃣', '6⃣', '7⃣', '8⃣', '9⃣']

      command(:sondagem, description: 'Outils de sondage a choix multiples.', usage: '!sondagem Question | réponse 1 | réponse 2 | autres réponses..', min_args: 3, allowed_roles: CONFIG.admin_roles) do |event, *args|
					event.message.delete

					args = args.join(' ').split('|')
					question = args[0]
					responses = args[1...args.size]

					if responses.size > 9
						event.respond('Merci de ne pas entrer plus de 9 réponses.')
						return
					end

					#channel = event.server.channels.select { |chan| chan.id == CONFIG.poll_channel}[0]
					chanell = event.channel
					message = channel.send_embed do |e|
						e.color = CONFIG.color
						desc = "🗳️ **#{question}**\n\n"
						responses.each_with_index do |response, index|
							index = index + 1 unless responses.size >= 9
							desc << "#{emojis[index]} #{response}\n"
						end
						e.description = desc
						#e.footer = { text: "Votez avec les réactions en dessous!" }
					end

					responses.each_with_index do |r, index|
						index = index + 1 unless responses.size >= 9
						message.react(emojis[index])
						sleep(0.3)
					end
					
					return
			end
							
			command(:sondage, description: 'Outils de sondage Oui/Non.', usage: '!sondage Question', min_args: 1, allowed_roles: CONFIG.admin_roles) do |event, *args|
				event.message.delete
				question = args.join(' ')

				#channel = event.server.channels.select { |chan| chan.id == CONFIG.poll_channel}[0]
				chanell = event.channel
				message = channel.send_embed do |e|
					e.color = CONFIG.color
					e.description = "🗳️ **#{question}**"
				end

				message.react("👍")
				sleep(0.3)
				message.react("👎")

				return
			end
    end
  end
end
