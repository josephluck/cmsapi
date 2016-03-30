json.(@site, :title, :id)

json.pages @site.pages do |page|
	json.(page, :id, :title)
end