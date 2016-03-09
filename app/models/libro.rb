class Libro < ActiveRecord::Base
    mount_uploader :portada, PortadaUploader
    
    def self.search(search)
      if search
        self.where('titulo LIKE ?', "%#{search}%")
      else
        self.all
      end
    end
end
