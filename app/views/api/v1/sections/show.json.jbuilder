json.(@section, :title, :id)

json.items @items do |item|
	json.(item, :id, :title, :order)
end