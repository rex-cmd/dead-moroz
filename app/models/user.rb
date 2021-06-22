class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable

         validates :first_name,  presence: true, length: { maximum: 25 }
         validates :last_name,   presence: true, length: { maximum: 25 }    
         validates :address,     presence: true, length: { maximum: 100 }  
         
end
