json.array! @items do |item|
  json.(item, :title, :id)

  json.fields item.fields do |field|
  	json.array! field.content
  end
end