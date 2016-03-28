json.array! @field_templates do |field_template|
  json.(field_template, :id, :title, :content)
end