module Admin
  class DriversController < Admin::BaseController

    crudify :driver,
            :title_attribute => 'name', :xhr_paging => true

  end
end
