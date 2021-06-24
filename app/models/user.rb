class User < ApplicationRecord
        
  enum role: {kid: 0, elf: 1, santa: 2 }

  has_many :gifts,       class_name: 'Gift', foreign_key: 'recipient_id', dependent: :destroy, inverse_of: :recipient
  has_many :gifts_added, class_name: 'Gift', foreign_key: 'added_by_id',  dependent: :nullify, inverse_of: :added_by

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name,  presence: true, length: { maximum: 25 }
  validates :last_name,   presence: true, length: { maximum: 25 }    
  validates :address,     presence: true, length: { maximum: 100 }  
  validates :role,        presence: true
  validates :behavior,    length: { maximum: 400 }
  
  mount_uploader :avatar, AvatarUploader
end
