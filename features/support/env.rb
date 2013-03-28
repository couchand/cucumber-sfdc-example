require 'rubygems'
require 'selenium-webdriver'

$driver = Selenium::WebDriver.for :remote, :url => 'http://couchand:ba998d45-e4c9-496b-add9-b4670ceed1a1@ondemand.saucelabs.com:80/wd/hub'

at_exit do
  $driver.close
end
