json.array! @items do |item|
  json.(item, :title, :id)

  json.fields item.fields do |field|
  	json.id field.id

  	json.array! Hash[field.field_attributes.map{ |attribute|
  		[ attribute.field_template_attribute.name, attribute.value ]
  	}]
  end
end