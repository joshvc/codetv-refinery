class DriversController < ApplicationController

  before_filter :find_all_drivers
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @driver in the line below:
    present(@page)
  end

  def show
    @driver = Driver.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @driver in the line below:
    present(@page)
  end

protected

  def find_all_drivers
    @drivers = Driver.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/drivers").first
  end

end
