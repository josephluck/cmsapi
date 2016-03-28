json.(@page, :title, :id)

json.sections @page.sections do |section|
	json.(section, :id, :title)
end