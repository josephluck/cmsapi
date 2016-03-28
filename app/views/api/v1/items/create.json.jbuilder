json.(@item, :title, :id)

json.fields @item.fields do |field|
	json.array! field.content
end