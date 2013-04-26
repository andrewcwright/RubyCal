require 'test/unit'
require 'RubyCal.rb'

class RubyCalTest < Test::Unit::TestCase

  def test_01_program_outputs_cal
    assert_equal(`cal 2 2013`, `ruby ../lib/RubyCal.rb 2 2013`)
  end

end