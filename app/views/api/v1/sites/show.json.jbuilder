json.(@site, :title, :id, :order)

json.pages @site.pages do |page|
	json.(page, :id, :title)
end