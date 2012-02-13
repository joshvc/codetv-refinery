Given /^I have no drivers$/ do
  Driver.delete_all
end

Given /^I (only )?have drivers titled "?([^\"]*)"?$/ do |only, titles|
  Driver.delete_all if only
  titles.split(', ').each do |title|
    Driver.create(:name => title)
  end
end

Then /^I should have ([0-9]+) drivers?$/ do |count|
  Driver.count.should == count.to_i
end
