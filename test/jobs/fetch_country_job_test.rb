require "test_helper"

class FetchCountryJobTest < ActiveJob::TestCase
  test "enqueue corretly" do
    assert_enqueue_jobs 0
    FetchCountryJob.perform_later('1', '0.0.0.0')
    assert_enqueue_jobs 1
  end
end
