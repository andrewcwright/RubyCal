require 'test/unit'
require './RubyCal'

class TestCalUnit < Test::Unit::TestCase

  def test_01_header_returns_proper_month_and_year
    new_cal = Calendar.new
    head = new_cal.header("1", 2000)
    assert_equal("    January 2000\n", head)
  end

  def test_02_day_header_returns_string_of_days
    new_cal = Calendar.new
    day_head = new_cal.day_header
    assert_equal("Su Mo Tu We Th Fr Sa\n", day_head)
  end

  def test_03_zeller_returns_proper_day_for_non_leap_year
    new_cal = Calendar.new
    day = new_cal.zeller(1, 1999)
    assert_equal(6, day)
  end

  def test_04_zeller_returns_proper_day_for_leap_year
    new_cal = Calendar.new
    day = new_cal.zeller(2, 2004)
    assert_equal(1, day)
  end

  def test_05_zeller_returns_proper_day_for_exception_year
    new_cal = Calendar.new
    day = new_cal.zeller(2, 2100)
    assert_equal(2, day)
  end

end