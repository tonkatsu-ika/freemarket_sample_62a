json.array! @category_children do |child|
  json.id child.id
  json.category_name  child.category_name
end