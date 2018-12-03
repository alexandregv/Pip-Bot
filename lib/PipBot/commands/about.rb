module PipBot
  module Commands
    module About
      extend Discordrb::Commands::CommandContainer
      command(:about, description: 'Affiche les informations du bot.') do |event|
        event.channel.send_embed do |e|
          e.color = 5800090
          e.author = {
            icon_url: BOT.profile.avatar_url,
            name: 'Pip-Boy',
          }
          e.description = "Je suis **Pip-Boy**. Mon but est d'animer le serveur et de répondre à *tous* vos besoins!"
          e.add_field name: '__Infos:__', value: "**Développeur:** <@131218864234168321>  \n**Propriétaire de l'instance:** <@#{CONFIG.owner_id}>  \n**GitHub:** [github.com/triinoxys/PipBot](https://github.com/triinoxys/PipBot)  \n**Discord:** [discord.gg/PXedvd](https://discord.gg/PXedvd)  \n**Mail:** contact@triinoxys.fr", inline: true
          e.footer = { text: "Pip-Boy v#{VERSION} by triinoxss" }
        end
      end
    end
  end
end
