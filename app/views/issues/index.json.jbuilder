json.array!(@issues) do |issue|
  json.id issue.id
  json.issue_type issue.issue_type
  json.latitude issue.latitude
  json.longitude issue.longitude
  json.description issue.description
  json.image_url issue.image_thumb
  json.created_at issue.created_at
  json.url issue_url(issue, format: :json)
end
