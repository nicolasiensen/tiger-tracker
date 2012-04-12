# coding: utf-8

Given /^I am at the homepage$/ do
  visit "/"
end

When /^I click Connect with Facebook$/ do
  click_link "Connect with Facebook"
end

Then /^I should be on the homepage$/ do
  page.current_path == "/"
end

Then /^I should see Welcome Nícolas! Who are we going out today\?$/ do
  page.should have_content("Welcome Nícolas! Who are we going out today")
end

Then /^I should not see Connect with Facebook$/ do
  page.should_not have_content("Connect with Facebook")
end
