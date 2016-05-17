class Libro < ActiveRecord::Base
    has_many :solicituds
    has_many :comentarios
    mount_uploader :portada, PortadaUploader
    
    # Para los idiomas
    enum idiomas: [:castellano, :euskera, :inglés, :francés, :otros]
                  
    enum generos: [:AUTOBIOGRAFIA,
                  :AVENTURAS,
                  :BELICO,
                  :FICCION,
                  :DETECTIVES,
                  :FANTASIA,
                  :HUMOR,
                  :HISTORIA,
                  :INFORMATICA,
                  :JUVENIL,
                  :NARRATIVA,
                  :POLICIACO,
                  :VIAJES,
                  :THRILLER,
                  :TERROR,
                  :COMIC]
    
    # Para la búsqueda
    def self.search(search)
      if search
        self.where('titulo LIKE ? OR autor LIKE ?', "%#{search}%", "%#{search}%")
      else
        self.all
      end
    end
    
    # Validamos los datos antes de crear o modificar un libro
    
      # Titulo es obligatorio
      validates :titulo, presence: true
      # Autor es obligatorio
      validates :autor, presence: true
      # Género es obligatorio
      validates :genero, presence: true
      # ISBN es obligatorio
      validates :isbn, presence: true
      # La cantidad solo puede ser un número entero y no puede ser menor o igual a 0
      validates :cantidad, presence: true, :numericality => { :greater_than => 0, only_integer: true }
end
