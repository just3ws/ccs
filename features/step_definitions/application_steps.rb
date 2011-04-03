When /^I login through the sidebar:?$/ do |table|
  within(".aside.authentication") do
    table.hashes.each do |field|
      fill_in "user_#{field[:id]}", :with => field[:value]
    end
    click_link_or_button 'login'
  end
end

When /^I fill in the (new|edit) (.*) form with:$/ do |action, model, table|
  with_scope(%("##{action}_#{model}")) do
    table.rows_hash.each do |name, value|
      selector = name.squish.gsub(/\s/, '_').underscore
      fill_in selector, :with => value
    end
  end
end

Given /^I have registered with "([^"]*)", "([^"]*)"$/ do |email, password|
  Factory.create(:user, :email => email, :password => password, :password_confirmation => password)
end

Given /^there is (.*) content$/ do |permalink|
  c = Content.find_or_initialize_by_permalink(permalink)
  c.update_attribute(:body, "Lorem ipsum")
  c.save!
end

