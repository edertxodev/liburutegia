class Libro < ActiveRecord::Base
    mount_uploader :portada, PortadaUploader
end
