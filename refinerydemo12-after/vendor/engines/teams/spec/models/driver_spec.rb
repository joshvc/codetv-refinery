require 'spec_helper'

describe Driver do

  def reset_driver(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @driver.destroy! if @driver
    @driver = Driver.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_driver
  end

  context "validations" do
    
    it "rejects empty name" do
      Driver.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_driver
      Driver.new(@valid_attributes).should_not be_valid
    end
    
  end

end