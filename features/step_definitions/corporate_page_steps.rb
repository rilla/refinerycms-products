Given /^I have no corporate_pages$/ do
  CorporatePage.delete_all
end

Given /^I (only )?have corporate_pages titled "?([^\"]*)"?$/ do |only, titles|
  CorporatePage.delete_all if only
  titles.split(', ').each do |title|
    CorporatePage.create(:title => title)
  end
end

Then /^I should have ([0-9]+) corporate_pages?$/ do |count|
  CorporatePage.count.should == count.to_i
end
