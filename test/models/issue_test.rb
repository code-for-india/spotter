require 'test_helper'

class IssueTest < ActiveSupport::TestCase

  test "should find distance" do
    issue = Issue.new({
                          :image => 'file.jpg',
                          :issue_type => "drainage",
                          :description => "yada",
                          :latitude => 46.3625,
                          :longitude => 46.055556,
                          :status => '1'
                         })

#    p issue.distance 15.114444, 14.508333
  end
end
