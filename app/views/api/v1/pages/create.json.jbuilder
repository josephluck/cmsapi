json.(@page, :title, :id, :order)

json.sections @page.sections do |section|
	json.(section, :id, :title)
end