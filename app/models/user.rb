class User < ActiveRecord::Base
  has_many :solicituds
  has_many :comentarios
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         #:recoverable, 
         :rememberable, :trackable, :validatable, :authentication_keys => [:username] # Utiliza username para accederç
  ROLES = %i[normal admin]
  
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  # Para la búsqueda
  def self.search(search)
    if search
      self.where('username LIKE ?', "%#{search}%")
    else
      self.all
    end
  end
  
  # Validamos los datos antes de crear un usuario
    
      # Username es obligatorio
      validates :username, :uniqueness => true, presence: true, :on => :create
      # Role es obligatorio
      validates :role, presence: { message: "es obligatorio" }, :on => :create
      # Password es obligatorio
      validates :password, presence: { message: "es obligatorio" }, :on => :create
  
end
