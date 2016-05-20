json.(@site, :title, :id, :order)

json.pages @pages do |page|
	json.(page, :id, :title, :order)
end