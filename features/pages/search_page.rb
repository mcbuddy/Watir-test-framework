
module SearchPage

  def self.search_bar(keyword)
    @browser.text_field(id: 'lst-ib').set(keyword)
    @browser.send_keys :enter
  end

  def self.wait_for_result
    @browser.element(id: 'resultStats').wait_until_present
    expect(@browser.element(id: 'resultStats').text.to include('results'))
  end

  def self.check_result

  end



end