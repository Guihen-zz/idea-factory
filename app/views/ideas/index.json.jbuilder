json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :description, :platform, :architecture, :tools, :hardware, :effort, :deadline
  json.url idea_url(idea, format: :json)
end
