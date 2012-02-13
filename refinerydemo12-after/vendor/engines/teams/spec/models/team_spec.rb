require 'spec_helper'

describe Team do

  def reset_team(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @team.destroy! if @team
    @team = Team.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_team
  end

  context "validations" do
    
    it "rejects empty name" do
      Team.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_team
      Team.new(@valid_attributes).should_not be_valid
    end
    
  end

end