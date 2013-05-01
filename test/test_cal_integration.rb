require 'test/unit'

class TestCalIntegration < Test::Unit::TestCase

  # def test_01_output_with_no_arguments
  #   assert_equal(`cal`, `ruby RubyCal.rb`)
  # end

  def output_with_only_year_argument
    assert_equal(`cal 2013`, `ruby RubyCal.rb 2013`)
  end

  def output_with_only_leap_year_argument
    assert_equal(`cal 2012`, `ruby RubyCal.rb 2012`)
  end

  def output_with_only_exception_year_argument
    assert_equal(`cal 2100`, `ruby RubyCal.rb 2100`)
  end

  def output_of_31_day_month_non_leap_year
    assert_equal(`cal 1 2013`, `ruby RubyCal.rb 1 2013`)
  end

  def output_of_February_on_non_leap_year
    assert_equal(`cal 2 2013`, `ruby RubyCal.rb 2 2013`)
  end

  def output_of_30_day_month_on_non_leap_year
    assert_equal(`cal 4 2013`, `ruby RubyCal.rb 4 2013`)
  end

  def output_of_31_day_month_on_4x_leap_year
    assert_equal(`cal 1 2012`, `ruby RubyCal.rb 1 2012`)
  end

  def output_of_February_on_4x_leap_year
    assert_equal(`cal 2 2012`, `ruby RubyCal.rb 2 2012`)
  end

  def output_of_30_day_month_on_4x_leap_year
    assert_equal(`cal 4 2012`, `ruby RubyCal.rb 4 2012`)
  end

  def output_of_31_day_month_on_100x_leap_year
    assert_equal(`cal 1 2200`, `ruby RubyCal.rb 1 2200`)
  end

  def output_of_February_on_100x_leap_year
    assert_equal(`cal 2 2200`, `ruby RubyCal.rb 2 2200`)
  end

  def output_of_30_day_month_on_100x_leap_year
    assert_equal(`cal 4 2200`, `ruby RubyCal.rb 4 2200`)
  end

  def output_of_31_day_month_on_400x_leap_year
    assert_equal(`cal 1 2000`, `ruby RubyCal.rb 1 2000`)
  end

  def output_of_February_on_400x_leap_year
    assert_equal(`cal 2 2000`, `ruby RubyCal.rb 2 2000`)
  end

  def output_of_30_day_month_on_400x_leap_year
    assert_equal(`cal 4 2000`, `ruby RubyCal.rb 4 2000`)
  end

  def output_of_31_day_month_on_exception_year
    assert_equal(`cal 1 2100`, `ruby RubyCal.rb 1 2100`)
  end

  def output_of_February_on_exception_year
    assert_equal(`cal 2 2100`, `ruby RubyCal.rb 2 2100`)
  end

  def output_of_30_day_month_on_exception_year
    assert_equal(`cal 4 2100`, `ruby RubyCal.rb 4 2100`)
  end

  def output_of_5_line_month
    assert_equal(`cal 3 2013`, `ruby RubyCal.rb 3 2013`)
  end

  def output_of_6_line_month
    assert_equal(`cal 4 2013`, `ruby RubyCal.rb 4 2013`)
  end
end