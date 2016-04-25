json.array!(@references) do |reference|
  json.extract! reference, :id, :authors, :publishing_year, :title, :publisher, :place_of_publication, :thinker_id
  json.url reference_url(reference, format: :json)
end
