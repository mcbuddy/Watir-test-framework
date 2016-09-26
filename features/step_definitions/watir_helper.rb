# ../watir_helper.rb
require 'selenium-webdriver'
require 'watir-webdriver'

module WatirHelper
  def self.browser
    browser = Watir::Browser.new ENV['BROWSER']
    browser.window.resize_to(1600, 1200)
    browser.driver.manage.timeouts.implicit_wait = 5
    return browser
  end

end
