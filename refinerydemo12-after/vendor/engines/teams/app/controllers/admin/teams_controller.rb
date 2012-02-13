module Admin
  class TeamsController < Admin::BaseController

    crudify :team,
            :title_attribute => 'name', :xhr_paging => true

  end
end
