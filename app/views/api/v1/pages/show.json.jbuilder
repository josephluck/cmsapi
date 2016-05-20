json.(@page, :title, :id, :order)

json.sections @sections do |section|
	json.(section, :id, :title, :order)
end