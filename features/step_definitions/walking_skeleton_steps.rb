# encoding: utf-8

Given /^items "(.*?)" and "(.*?)" in the database$/ do |item1, item2|
  FactoryGirl.create(:item, text: item1)
  FactoryGirl.create(:item, text: item2)
end

When /^I open "(.*?)" page$/ do |url|
  visit("/#{url}")
end

Then /^I should see "(.*?)" and "(.*?)" listed on the page\.$/ do |item1, item2|
  page.should have_content(item1)
  page.should have_content(item2)
end

When /^I enter "(.*?)"$/ do |itemText|
    @item_text = itemText
    within("form") do
        fill_in('item_text', :with => 'itemText')
    end
end

When /^click "(.*?)"$/ do |arg1|
    click_button("Save")
end

Then /^I should see the added new item on the page\.$/ do
    page.should have_content(@itemText)
end
