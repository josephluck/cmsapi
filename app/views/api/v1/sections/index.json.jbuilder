json.array! @sections do |section|
  json.(section, :id, :title, :order)
end