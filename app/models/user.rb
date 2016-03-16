class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         #:recoverable, 
         :rememberable, :trackable, :validatable, :authentication_keys => [:username] # Utiliza username para acceder
         
  def email_required?
    false
  end
  
  def email_changed?
    false
  end
end
