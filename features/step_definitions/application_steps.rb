When /^I fill in the (new|edit) (.*) form with:$/ do |action, model, table|
  scope_selector = "##{action}_#{model}"
  with_scope(scope_selector) do
    table.rows_hash.each do |name, value| 
      selector = name.squish.gsub(/\s/, '_').underscore
      fill_in selector, :with => value
    end
  end
end

Then /^I should see "([^"]*)" within the message box$/ do |text|
  with_scope("#messages") do
    page.should have_content(text)
  end
end

Then /^I should see "([^"]*)" within the authentication box$/ do |text|
  with_scope(".aside.authentication") do
    page.should have_content(text)
  end
end

Given /^I am not authenticated$/ do
  visit '/users/sign_out'
end

When /^I login through the sidebar:?$/ do |table|
  within(".aside.authentication") do
    table.hashes.each do |field| 
      fill_in "user_#{field[:id]}", :with => field[:value]
    end
    click_link_or_button 'login'
  end
end


Given(/^#{capture_model} (?:has|have) registered with "(\S+)", "(.*)"$/) do |name, email, password|
  Given "#{name} exists with email: \"#{email}\", password: \"#{password}\", password_confirmation: \"#{password}\""
end

