json.array!(@availabilities) do |availability|
  json.extract! availability, :id, :provider_id, :start, :end
  json.url availability_url(availability, format: :json)
end
