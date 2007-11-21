require File.dirname(__FILE__) + '/test_helper'

class HolidaysTests < Test::Unit::TestCase
  def test_easter_dates
    assert_equal '1800-04-13', Holidays.easter(1800).to_s
    assert_equal '1899-04-02', Holidays.easter(1899).to_s
    assert_equal '1900-04-15', Holidays.easter(1900).to_s
    assert_equal '1999-04-04', Holidays.easter(1999).to_s
    assert_equal '2000-04-23', Holidays.easter(2000).to_s
    assert_equal '2025-04-20', Holidays.easter(2025).to_s
    assert_equal '2035-03-25', Holidays.easter(2035).to_s
    assert_equal '2067-04-03', Holidays.easter(2067).to_s
    assert_equal '2099-04-12', Holidays.easter(2099).to_s
  end

  def test_easter_lambda
    [Date.civil(1800,4,13), Date.civil(1899,4,2), Date.civil(1900,4,15),
     Date.civil(2008,3,23), Date.civil(2035,3,25)].each do |date|
      assert_equal 'Easter Sunday', Holidays.by_day(date, :christian)[0][:name]
    end
  end

  def test_good_friday_lambda
    [Date.civil(1800,4,11), Date.civil(1899,3,31), Date.civil(1900,4,13),
     Date.civil(2008,3,21), Date.civil(2035,3,23)].each do |date|
      assert_equal 'Good Friday', Holidays.by_day(date, :christian)[0][:name]
    end
  end
end
