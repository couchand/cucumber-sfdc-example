#AfterStep do
#	When "I wait 4s"
#end


When /^I navigate to (.+)$/ do |url|
	$driver.navigate.to url
end

Given /^I am on the page (.*)$/ do |url|
  puts url
	$driver.navigate.to "http://"+url
end

Given /^a field with id (.+)$/ do |field_id|
	if !$driver.find_element(:id, field_id) then raise "Field with id #{field_id} not found" end
end

When /^I select the field with id (.+)$/ do |field_id|
	@element = $driver.find_element(:id, field_id)
end

When /^I type "(.*)"$/ do |query|
	@element.send_keys query
end

When /^I clear the field$/ do
	@element.clear
end

When /^I type "(.*)" in the field with id (.+)$/ do |query, field_id|
	step "I select the field with id #{field_id}"
	step "I clear the field"
	step "I type \"#{query}\""
end

When /^I type "(.*)" for (.+)$/ do |input, field_name|
   step "a field with id #{field_name}"
   step "I type \"#{input}\" in the field with id #{field_name}"
end

When /^I click submit$/ do
	@element.submit
end

When /^I accept$/ do
	$driver.switch_to.alert.accept
end

When /^I click the link with text (.+)$/ do |link_text|
	$driver.find_element(:link_text, link_text).click
end

When /^I click the button with name (.+)$/ do |button_name|
	waiter = Selenium::WebDriver::Wait.new
	waiter.until { $driver.find_element(:name, button_name).displayed? }
	$driver.find_element(:name, button_name).click
end

When /^I wait for the element with class (.+) to be visible$/ do |class_name|
	waiter = Selenium::WebDriver::Wait.new
	waiter.until { $driver.find_element(:class, class_name).displayed? }
end

When /^I wait for the element with id (.+) to be visible$/ do |id|
	waiter = Selenium::WebDriver::Wait.new
	waiter.until { $driver.find_element(:id, id).displayed? }
end

When /^the page contains the words "([^"]+)"$/ do |msg|
	$driver.page_source.match(msg)
end

Then /^the page should contain the words "([^"]+)"$/ do |msg|
	if (!$driver.page_source.match(msg)) then raise "Page does not contain the words \"#{msg}\"" end
end

Then /^the page should not contain the words "([^"]+)"$/ do |msg|
	begin
		error_div = $driver.find_element(:id, "errorDiv_ep")
	rescue
		return
	end
	if ("none" != error_div.style("display")) then raise "Page contains an error message" end
end

When /^I wait (.+)s$/ do |wait|
	sleep(wait.to_f)
end


