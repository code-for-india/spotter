json.array!(@issues) do |issue|
  json.extract! issue, :id, :issue_type, :latitude, :longitude
  json.url issue_url(issue, format: :json)
end
