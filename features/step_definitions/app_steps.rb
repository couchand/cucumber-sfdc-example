###################################################################################################
# Opening block
###################################################################################################

Before do
   step "the SFDC instance at \"na15.salesforce.com\""
   step "an admin with username \"acouch@cucumber.com\" and password \"testpass0\""
   step "a regular user with username \"ben.chel@cucumber.com\" and password \"testpass1\""
end

Given "I'm on the new Lead page" do
   step "I click the Lead tab"
   step "I click the new button"
end

#When /^I create a new invoice with status \"([^"]+)\"$/ do |status|
#   step "I click on the invoice tab"
#   step "I click the new button"
#   step "I click save"
# pending # - edit the status
#   step "I will have created a new object"
#end

#When /^I add a line item for (\d+) (.+)$/ do |num, what|
#   step "I click the new line item button" 
#   step "I type \"1\" into item number"
#   step "I type \"#{num}\" into units sold"
#   step "I type \"#{what}\" into product"
#   step "I click save"
#end

