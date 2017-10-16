require_relative 'watir_helper'
include WatirHelper

Before do |scenario|
  @browser = WatirHelper.browser
end

After do |scenario|
  @browser.quit
end


Given(/^I at inRhythm search homepage$/) do
  @browser.goto(ENV['URI'])
  expect(@browser.url).to include(ENV['URI'])
end

When(/^I click (\w+) on the top navigation$/) do |button|
  case button
    when 'About'
      xpath_bar = '//*[@id="bs-example-navbar-collapse-1"]/ul/li[1]/a'
    when 'Services'
      xpath_bar = '//*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/a'
    when 'Portfolio'
      xpath_bar = '//*[@id="bs-example-navbar-collapse-1"]/ul/li[3]/a'
    when 'Contact'
      xpath_bar = '//*[@id="bs-example-navbar-collapse-1"]/ul/li[4]/a'
  end
  @browser.element(xpath: xpath_bar).click
end

Then(/^I should go to (\w+) section page$/) do |button|
  case button
    when 'About'
      add_url = '/#about'
    when 'Services'
      add_url = '/#services'
    when 'Portfolio'
      add_url = '/#porfolio'
    when 'Contact'
      add_url = '/#contact'
  end
  expect(@browser.url).to eql(ENV['URI'] + add_url)
end


