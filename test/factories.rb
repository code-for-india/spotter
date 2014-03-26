FactoryGirl.define do
  factory :issue do
    image File.new('test/fixtures/test.png')
    issue_type "Drainage"
    description "Severe drainage problem"
    latitude 18.9750
    longitude 72.8258
    status "1"
  end
end
