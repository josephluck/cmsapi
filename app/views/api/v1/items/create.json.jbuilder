json.(@item, :title, :id)

json.fields @item.fields do |field|
	json.(field, :id, :field_template_id)
	json.title field.field_template.title

	json.attributes field.field_attributes do |attribute|
		json.(attribute, :field_id, :value, :id, :field_template_attribute_id)
		json.kind attribute.field_template_attribute.kind
		json.options attribute.field_template_attribute.options
	end
end