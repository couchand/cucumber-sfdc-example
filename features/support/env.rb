require 'rubygems'
require 'headless'
require 'selenium-webdriver'

headless = Headless.new
headless.start

$driver = Selenium::WebDriver.for :firefox
at_exit do
  $driver.close
  headless.destroy
end

