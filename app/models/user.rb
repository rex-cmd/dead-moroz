class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  enum role: {kid: 0, elf: 1, santa: 2 }

  has_many :gifts,       class_name: 'Gift', foreign_key: 'recipient_id', dependent: :destroy, inverse_of: :recipient
  has_many :gifts_added, class_name: 'Gift', foreign_key: 'added_by_id',  dependent: :nullify, inverse_of: :added_by
  
  has_many :reviews_on,  class_name: 'Review', foreign_key: 'reviewee_id', dependent: :destroy, inverse_of: :reviewee
  has_many :reviews_by,  class_name: 'Review', foreign_key: 'reviewer_id', dependent: :nullify, inverse_of: :reviewer

  has_many :estimates_on,  class_name: 'Estimate', foreign_key: 'target_id', dependent: :destroy, inverse_of: :target
  has_many :estimates_by,  class_name: 'Estimate', foreign_key: 'author_id', dependent: :nullify, inverse_of: :author

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :first_name,  presence: true, length: { maximum: 25 }
  validates :last_name,   presence: true, length: { maximum: 25 }    
  validates :address,     presence: true, length: { maximum: 100 }  
  validates :role,        presence: true
  validates :behavior,    length: { maximum: 400 }
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  
end
