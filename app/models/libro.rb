class Libro < ActiveRecord::Base
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
                  :TERROR]
    
    # Para la búsqueda
    def self.search(search)
      if search
        self.where('titulo LIKE ?', "%#{search}%")
      else
        self.all
      end
    end
    
    # Validamos los datos antes de crear o modificar un libro
    
      # Titulo es obligatorio
      validates :titulo, presence: { message: "es obligatorio" }
      # Autor es obligatorio
      validates :autor, presence: { message: "es obligatorio" }
      # Género es obligatorio
      validates :genero, presence: { message: "es obligatorio" }
      # ISBN es obligatorio
      validates :isbn, presence: { message: "es obligatorio" }
      # La cantidad solo puede ser un número entero y no puede ser menor o igual a 0
      validates :cantidad, presence: { message: "es obligatoria" }, :numericality => { :greater_than => 0, only_integer: true, message: "debe ser mayor que 0" }
end
