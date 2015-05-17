json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :provider_id, :patient_id, :start, :end
  json.url appointment_url(appointment, format: :json)
end
