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

  def test_06_month_length_returns_length_of_non_leap_feb
    new_cal = Calendar.new
    assert_equal(28, new_cal.month_length(2, 2013))
  end

  def test_07_month_length_returns_length_of_leap_feb
    new_cal = Calendar.new
    assert_equal(29, new_cal.month_length(2, 2012))
  end

  def test_08_month_length_returns_length_of_30_day_month
    new_cal = Calendar.new
    assert_equal(30, new_cal.month_length(4, 2013))
  end

  def test_09_month_length_returns_length_of_31_day_month
    new_cal = Calendar.new
    assert_equal(31, new_cal.month_length(5, 2013))
  end

  def test_10_format_week_returns_first_week
    new_cal = Calendar.new
    week_string = new_cal.format_week(1, 2013, 1)
    assert_equal("       1  2  3  4  5", week_string)
  end

  def test_11_format_week_returns_second_week
    new_cal = Calendar.new
    week_string = new_cal.format_week(1, 2013, 2)
    assert_equal(" 6  7  8  9 10 11 12", week_string)
  end

  def test_12_format_week_returns_sixth_week
    new_cal = Calendar.new
    week_string = new_cal.format_week(6, 2013, 6)
    assert_equal("30", week_string)
  end

  def test_13_format_week_returns_last_week_of_leap_feb
    new_cal = Calendar.new
    week_string = new_cal.format_week(2, 2012, 5)
    assert_equal("26 27 28 29", week_string)
  end

  def test_14_format_week_returns_last_week_of_non_leap_feb
    new_cal = Calendar.new
    week_string = new_cal.format_week(2, 2013, 5)
    assert_equal("24 25 26 27 28", week_string)
  end

end