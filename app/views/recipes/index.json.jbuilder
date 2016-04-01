json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :title, :description, :user_id, :image
  json.url recipe_url(recipe, format: :json)
end
