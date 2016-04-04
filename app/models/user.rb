class User < ActiveRecord::Base
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
end
