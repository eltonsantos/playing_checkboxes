json.array!(@historic_refinancings) do |historic_refinancing|
  json.extract! historic_refinancing, :id, :authorization_origin_id, :refinancing_id, :authorization_new_id
  json.url historic_refinancing_url(historic_refinancing, format: :json)
end
