json.array! @sites do |site|
  json.(site, :id, :order, :title)
end