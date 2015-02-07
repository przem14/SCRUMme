json.array!(@boards) do |board|
  json.extract! board, :id, :team_id
  json.url board_url(board, format: :json)
end
