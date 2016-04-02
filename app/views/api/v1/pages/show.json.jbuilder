json.(@page, :title, :id)

json.sections @page.sections do |section|
	json.(section, :id, :title)

	json.items section.items do |item|
		json.(item, :id, :title)
		json.fields item.fields do |json, field|
			json.id field.id
			json.content field.content
		end
	end
end