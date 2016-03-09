json.array!(@libros) do |libro|
  json.extract! libro, :id, :titulo, :autor, :genero, :isbn, :portada, :fregistro
  json.url libro_url(libro, format: :json)
end
