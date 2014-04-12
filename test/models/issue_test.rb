require 'test_helper'

class IssueTest < ActiveSupport::TestCase

  test "should find distance" do
    issue = create(:issue) # creates issue in Mumbai
    assert_in_delta 721, issue.distance(28.6139, 77.2069), 1 # Delhi co-ordinates
  end

  test "should add image from base 64 string" do
    file = Base64.encode64(File.open(Rails.root.join("app/assets/images/test.png")).read)

    @issue = Issue.new(:issue_type => "drainage",
                       :latitude => "32.234232",
                       :longitude => "12.323223",
                       :description => "jkhsladkjfhasldkjh",
                       :status => "asdsa"
                      )

    @issue.add_image file
    assert @issue.save
  end
end
