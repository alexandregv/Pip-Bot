module PipBot

  # Module for permissions
  module Permissions

    def self.set!
      # Roles
      BOT.set_role_permission(371270771097600002, 100) # Superviseur => 100
      
      # Users
      BOT.set_user_permission(131218864234168321, 100) # TriiNoxYs => 100
    end
  end
end

