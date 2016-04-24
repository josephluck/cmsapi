json.array! @field_template_attributes do |field_template_attribute|
  json.(field_template_attribute, :name, :id, :kind, :options)
end