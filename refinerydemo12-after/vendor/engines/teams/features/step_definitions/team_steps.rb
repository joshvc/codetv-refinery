Given /^I have no teams$/ do
  Team.delete_all
end

Given /^I (only )?have teams titled "?([^\"]*)"?$/ do |only, titles|
  Team.delete_all if only
  titles.split(', ').each do |title|
    Team.create(:name => title)
  end
end

Then /^I should have ([0-9]+) teams?$/ do |count|
  Team.count.should == count.to_i
end
