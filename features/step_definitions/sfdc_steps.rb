Before do
	@objects   = Hash.new
	@fields    = Hash.new
	@buttons   = Hash.new
	@errors    = Hash.new
	@test_data = Array.new
end

After do
	@test_data.each do|item|
	   step "I delete the object with id #{item}"
	   step "I wait for the element with class bodyDiv to be visible"
	end
end

Given /^an object named "([^"]+)" with code "([^"]{3})"$/ do |object_name, object_code|
	@objects[object_name] = object_code
end

Given /^a field named "([^"]+)" with id "([^"]+)"$/ do |field_name, field_id|
	@fields[field_name] = field_id
end

Given /^a button named "([^"]+)" with code "([^"]+)"$/ do |button_name,button_code|
	@buttons[button_name] = button_code
end

Given /^an error named "([^"]+)" with message "([^"]+)"$/ do |error_name,error_message|
	@errors[error_name] = error_message
end

Given /^an admin with username \"([^"]+)\" and password \"([^"]+)\"$/ do |username, password|
	@admin_user = username
	@admin_pass = password
end

Given /^a regular user with username \"([^"]+)\" and password \"([^"]+)\"$/ do |username, password|
	@user_user = username
	@user_pass = password
end

Before do
   step "a field named \"name\" with id \"Name\""
   step "a button named \"edit\" with code \"edit\""
   step "a button named \"new\" with code \"new\""
   step "a button named \"save\" with code \"save\""
   step "a button named \"delete\" with code \"del\""
end

Given /^the SFDC instance at "([^"]+)"$/ do |url|
	@base_url = url
end

Given /^I am on the detail page for (.+)$/ do |id|
   step "I navigate to https://#{@base_url}/#{id}"
   step "I wait for the element with class bodyDiv to be visible"
end

When /^I type "(.*)" into ([^"]+)$/ do |input,field|
   step "I type \"#{input}\" for #{@fields[field]}"
end

When /^I click the (.+) button$/ do |button_name|
   step "I click the button with name #{@buttons[button_name]}"
end

Then /^I will be logged in as an admin$/ do
end

Then /^I will be logged in as a regular user$/ do
end

Then /^I will have created a new object$/ do
	@test_data.push(/^.+\/([^\/]+)/.match($driver.current_url)[1])
end

Then /^I should see an? (.+) error$/ do |error_type|
   step "the page should contain the words \"#{@errors[error_type]}\""
end

Then /^I should not see an error$/ do
   step "I wait for the element with class bodyDiv to be visible"
   step "the page should not contain the words \"Error\""
end

When /^I click save$/ do
   step "I click the save button"
end

When /^I click delete$/ do
   step "I click the delete button"
end

When /^I click on the ([^"]+) tab$/ do |object_name|
   step "I navigate to https://#{@base_url}/#{@objects[object_name]}/o"
   step "I wait for the element with class bodyDiv to be visible"
end

When /^I edit the (\w+) (\w+)$/ do |object_type,object_name|
   step "I click on the #{object_type} tab"
   step "I click the link with text #{object_name}"
   step "I click the edit button"
end

When /^I delete the object with id (.+)$/ do |id|
   step "I am on the detail page for #{id}"
   step "I click delete"
   step "I accept"
end

Given /^I am logged in as an admin$/ do
begin
   step "I am on the page #{@base_url}"
   step "I type \"#{@admin_user}\" for username"
   step "I type \"#{@admin_pass}\" for password"
   step "I click submit"
   step "I wait for the element with class bodyDiv to be visible"
   step "I will be logged in as an admin"
rescue
   step "I wait 5s"
end
end

Given /^I am logged in as a regular user$/ do
begin
   step "I am on the page #{@base_url}"
   step "I type \"#{@user_user}\" for username"
   step "I type \"#{@user_pass}\" for password"
   step "I click submit"
   step "I wait for the element with class bodyDiv to be visible"
   step "I will be logged in as a regular user"
rescue
   step "I wait 5s"
end
end

Given /^a (\w+) named (\w+)$/ do |class_name,object_name|
   step "I am logged in as an admin"
   step "I click on the #{class_name} tab"
   step "I type \"#{object_name}\" for sbstr"
   step "I click submit"

    if (step "the page contains the words \"There are no matching\"") then
	   step "I create a new #{class_name} named \"#{object_name}\""
    end
end

