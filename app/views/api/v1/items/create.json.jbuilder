json.(@item, :title, :id)

json.fields do
  @item.fields.each{  |field|
  	json.id field.id

  	json.attributes Hash[field.field_attributes.map{ |attribute|
  		[ attribute.field_template_attribute.name, attribute.value ]
  	}]
  }
end