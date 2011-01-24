When /^I fill in the (new|edit) (.*) form with:$/ do |action, model, table|
  scope_selector = "##{action}_#{model}"
  with_scope(scope_selector) do
    table.rows_hash.each do |name, value| 
      selector = "#{model}_#{name}".gsub(/\s/, '_')
      fill_in selector, :with => value
    end
  end
end

Then /^I should see "([^"]*)" within the message box$/ do |text|
  with_scope("#messages") do
    page.should have_content(text)
  end
end
