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

When(/^I click "([^"]*)" on the homepage$/) do |button|
  case button
    when 'Find Out More'
      loc_xpath = '//*[@id="page-top"]/header/div/div/a'
    when 'Get Started!'
      loc_xpath =  '//*[@id="about"]/div/div/div/a'
    when 'feedback@inrhythm.com'
      loc_xpath = '//*[@id="contact"]/div/div/div[2]/p/a'
  end
  @browser.element(xpath: loc_xpath).click
end

Then(/^I should go to "([^"]*)" section page$/) do |button|
  case button
    when 'Find Out More'
      add_url = '/#about'
    when 'Get Started!'
      add_url = '/#services'
  end
  expect(@browser.url).to eql(ENV['URI'] + add_url)
end

Then(/^I should be able to send the email to "([^"]*)"$/) do |email|
  expect(@browser.element(xpath: '//*[@id="contact"]/div/div/div[2]/p/a').attribute_value('href')).to eql("mailto:#{email}")
end


