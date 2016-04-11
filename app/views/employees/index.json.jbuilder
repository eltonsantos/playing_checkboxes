json.array!(@employees) do |employee|
  json.extract! employee, :id, :person_id, :register, :salary
  json.url employee_url(employee, format: :json)
end
