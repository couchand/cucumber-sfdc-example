require 'rubygems'
require 'selenium-webdriver'

$capabilities = Selenium::WebDriver::Capabilities.new {
    :browser_name => ENV["SELENIUM_BROWSER"],
    :version      => ENV["SELENIUM_VERSION"],
    :platform     => ENV["SELENIUM_PLATFORM"],
    :name         => "#{ENV["JOB_NAME"]} ##{ENV["BUILD_NUMBER"]}",
    :build        => ENV["BUILD_TAG"],
    :tags         => [ ENV["JOB_NAME"], "r#{ENV["SVN_REVISION"]}" ]
}

$driver = Selenium::WebDriver.for :remote,
    :url => "http://#{ENV["SAUCE_USER_NAME"]}:#{ENV["SAUCE_API_KEY"]}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => $capabilities

at_exit do
  $driver.close
end
