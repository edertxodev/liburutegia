class Solicituds < ActiveRecord::Base
    has_one :libros
    has_many :leidos
end
