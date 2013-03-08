###################################################################################################
# Opening block
###################################################################################################

Before do
   step "the SFDC instance at \"na7.salesforce.com\""  
   step "an admin with username \"acouch@cucumber.com\" and password \"testpass0\""
   step "a regular user with username \"ben.chel@cucumber.com\" and password \"testpass1\""
   step "an object named \"product\" with code \"a00\""
   step "a field named \"description\" with id \"00NA0000008NKMd\""
   step "a field named \"price\" with id \"00NA0000008NKU8\""
   step "a field named \"quantity\" with id \"00NA0000008NKUI\""
   step "an object named \"invoice\" with code \"a01\""
   step "a field named \"status\" with id \"00NA0000008NKTB\""
   step "a button named \"new line item\" with code \"new00NA0000008NKVQ\""
   step "an object named \"line item\" with code \"a02\""
   step "a field named \"item number\" with id \"Name\""
   step "a field named \"units sold\" with id \"00NA0000008NKVB\""
   step "a field named \"product\" with id \"CF00NA0000008NKVL\""
   step "an error named \"not in stock\" with message \"We simply don't have that many lying around.\""
end

###################################################################################################
# Domain-specific steps
###################################################################################################

Given /^we have (\d+) (\w+)s? in stock$/ do |num,what|
   step "a product named #{what}"
   step "I edit the product #{what}"
   step "I type \"#{num}\" into quantity"
   step "I click the save button"
end

Given /^the price of (\w+) is (\d+)$/ do |what,price|
   step "a product named #{what}"
   step "I edit the product #{what}"
   step "I type \"#{price}\" into price"
   step "I click the save button"
end

When /^I order (\d+) (\w+)s?$/ do |num,what|
   step "a product named #{what}"
   step "I create a new invoice with status \"Open\""
   step "I add a line item for #{num} #{what}"
end

###################################################################################################
# Support steps
###################################################################################################

When /^I create a new product named \"([^"]+)\"$/ do |object_name|
   step "I click on the product tab"
   step "I click the new button"
   step "I type \"#{object_name}\" into name"
   step "I type \"test description\" into description"
   step "I type \"0\" into price"
   step "I type \"0\" into quantity"
   step "I click save"
   step "I wait for the element with class bodyDiv to be visible"
   step "I will have created a new object"
end

When /^I create a new invoice with status \"([^"]+)\"$/ do |status|
   step "I click on the invoice tab"
   step "I click the new button"
   step "I click save"
# pending # - edit the status
   step "I will have created a new object"
end

When /^I add a line item for (\d+) (.+)$/ do |num, what|
   step "I click the new line item button" 
   step "I type \"1\" into item number"
   step "I type \"#{num}\" into units sold"
   step "I type \"#{what}\" into product"
   step "I click save"
end

