class Comentario < ActiveRecord::Base
    belongs_to :libros
    has_one :user
end