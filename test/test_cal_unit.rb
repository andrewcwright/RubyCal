require 'test/unit'
require './RubyCal'

class TestCalUnit < Test::Unit::TestCase

  def test_01_header_returns_proper_month_and_year
    new_cal = Calendar.new(1, 2000)
    head = new_cal.header("1", 2000)
    assert_equal("    January 2000", head)
  end

  def test_03_get_first_day_returns_proper_day_for_non_leap_year
    new_cal = Calendar.new(1, 1999)
    day = new_cal.get_first_day(1, 1999)
    assert_equal(5, day)
  end

  def test_04_get_first_day_returns_proper_day_for_leap_year
    new_cal = Calendar.new(2, 2004)
    day = new_cal.get_first_day(2, 2004)
    assert_equal(0, day)
  end

  def test_05_get_first_day_returns_proper_day_for_exception_year
    new_cal = Calendar.new(2, 2100)
    day = new_cal.get_first_day(2, 2100)
    assert_equal(1, day)
  end

  def test_06_month_length_returns_length_of_non_leap_feb
    new_cal = Calendar.new(2, 2013)
    assert_equal(28, new_cal.month_length(2, 2013))
  end

  def test_07_month_length_returns_length_of_leap_feb
    new_cal = Calendar.new(2, 2012)
    assert_equal(29, new_cal.month_length(2, 2012))
  end

  def test_08_month_length_returns_length_of_30_day_month
    new_cal = Calendar.new(4, 2013)
    assert_equal(30, new_cal.month_length(4, 2013))
  end

  def test_09_month_length_returns_length_of_31_day_month
    new_cal = Calendar.new(5, 2013)
    assert_equal(31, new_cal.month_length(5, 2013))
  end

  def test_10_format_week_returns_first_week
    new_cal = Calendar.new(1, 2013)
    week_string = new_cal.format_week(1, 2013, 1)
    assert_equal("       1  2  3  4  5", week_string)
  end

  def test_11_format_week_returns_second_week
    new_cal = Calendar.new(1, 2013)
    week_string = new_cal.format_week(1, 2013, 2)
    assert_equal(" 6  7  8  9 10 11 12", week_string)
  end

  def test_12_format_week_returns_sixth_week
    new_cal = Calendar.new(6, 2013)
    week_string = new_cal.format_week(6, 2013, 6)
    assert_equal("30", week_string)
  end

  def test_13_format_week_returns_last_week_of_leap_feb
    new_cal = Calendar.new(2, 2012)
    week_string = new_cal.format_week(2, 2012, 5)
    assert_equal("26 27 28 29", week_string)
  end

  def test_14_format_week_returns_last_week_of_non_leap_feb
    new_cal = Calendar.new(2, 2013)
    week_string = new_cal.format_week(2, 2013, 5)
    assert_equal("24 25 26 27 28", week_string)
  end

end