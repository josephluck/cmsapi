json.array! @field_templates do |field_template|
  json.(field_template, :title, :id, :content)

  json.attributes field_template.field_template_attributes do |attribute|
  	json.array! attribute
  end
end