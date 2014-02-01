require 'test_helper'

class IssueTest < ActiveSupport::TestCase

  test "should find distance" do
    issue = create(:issue) # creates issue in Mumbai
    assert_in_delta 721, issue.distance(28.6139, 77.2069), 1 # Delhi co-ordinates
  end
end
