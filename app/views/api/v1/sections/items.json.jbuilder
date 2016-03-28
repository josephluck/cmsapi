json.array! @items do |item|
  json.(item, :id, :title)
  json.fields item.fields do |json, field|
  	json.array! field.content
  end
end