json.(@field_template, :title, :id)

json.attributes @field_template.field_template_attributes do |attribute|
	json.array! attribute
end