json.(@item, :title, :id)

json.fields @item.fields do |field|
	json.(field, :id)
	json.title field.field_template.title

	json.attributes field.field_attributes do |attribute|
		json.(attribute, :field_id, :value, :id, :field_template_attribute_id)
		json.kind attribute.field_template_attribute.kind
	end
end