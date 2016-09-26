require_relative 'watir_helper'
include WatirHelper

Before do |scenario|
  @browser = WatirHelper.browser
end

After do |scenario|
  @browser.quit
end

Given(/^I at google search homepage$/) do
  @browser.goto(ENV['URI'])
  expect(@browser.url).to include(ENV['URI'])
end

When(/^I search for "([^"]*)" keyword$/) do |keyword|
  @browser.text_field(id: 'lst-ib').set(keyword)
  @browser.send_keys :enter
end

Then(/^I should see "([^"]*)" search result$/) do |keyword|
  @browser.element(id: 'resultStats').wait_until_present
  expect(@browser.element(id: 'resultStats').text.to include('results'))
  # puts @browser.element(id: 'rso').text
end

Then(/^I should see "([^"]*)" official homepage$/) do |keyword|
  @browser.element(xpath: '//*[@id="rso"]/div/div[1]/div/h3/a').click
  expect(@browser.title.to eql('Watir.com | Web Application Testing in Ruby'))
end
