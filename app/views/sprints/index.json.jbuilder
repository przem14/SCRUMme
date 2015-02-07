json.array!(@sprints) do |sprint|
  json.extract! sprint, :id, :board_id
  json.url sprint_url(sprint, format: :json)
end
