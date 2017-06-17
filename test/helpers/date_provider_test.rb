require 'test_helper'

class DateProviderTest < ActiveSupport::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @date_provider = DateProvider.new
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  test 'should_get_current_date' do
    given_current_date = @date_provider.get_current_date
    current_date = Time.now

    assert_equal current_date.day, given_current_date.day
    assert_equal current_date.month, given_current_date.month
    assert_equal current_date.year, given_current_date.year
  end

  test 'should_get_date_10_days_ago' do
    given_date = @date_provider.get_date_number_of_days_ago 10
    current_date = Time.now

    difference_seconds = current_date.days_ago(10).to_i - given_date.to_i

    assert_in_delta 0, difference_seconds, 5
  end

  test 'should_get_date_40_days_ago' do
    given_date = @date_provider.get_date_number_of_days_ago 40
    current_date = Time.now

    difference_seconds = current_date.days_ago(40).to_i - given_date.to_i

    assert_in_delta 0, difference_seconds, 5
  end
end