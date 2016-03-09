json.array!(@confirms) do |confirm|
  json.extract! confirm, :id
  json.url confirm_url(confirm, format: :json)
end
