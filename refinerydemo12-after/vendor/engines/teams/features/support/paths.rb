module NavigationHelpers
  module Refinery
    module Teams
      def path_to(page_name)
        case page_name
        when /the list of teams/
          admin_teams_path

         when /the new team form/
          new_admin_team_path
        when /the list of drivers/
          admin_drivers_path

         when /the new driver form/
          new_admin_driver_path
        else
          nil
        end
      end
    end
  end
end
