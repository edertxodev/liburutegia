class Leido < ActiveRecord::Base
    has_many :libros
    has_many :users
end
