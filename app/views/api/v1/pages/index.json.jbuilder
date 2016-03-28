json.array! @pages do |page|
  json.(page, :id, :title)
end