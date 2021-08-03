# frozen_string_literal: true

class User < ApplicationRecord
  scope :with_decided_gifts,     -> { joins(:gifts).where(gifts: { selected: true }).uniq }
  scope :with_not_decided_gifts, -> { where.not(id: with_decided_gifts.pluck(:id)) }
  scope :with_selected_gifts,    -> { joins('JOIN gifts on users.id = added_by_id').where(gifts: { selected: true }).uniq }
  mount_uploader :avatar, AvatarUploader
  enum role: { kid: 0, elf: 1, santa: 2, admin: 3 }

  has_many :gifts,       class_name: 'Gift', foreign_key: 'recipient_id', dependent: :destroy, inverse_of: :recipient
  has_many :gifts_added, class_name: 'Gift', foreign_key: 'added_by_id',  dependent: :nullify, inverse_of: :added_by

  has_many :reviews_on,  class_name: 'Review', foreign_key: 'reviewee_id', dependent: :destroy, inverse_of: :reviewee
  has_many :reviews_by,  class_name: 'Review', foreign_key: 'reviewer_id', dependent: :nullify, inverse_of: :reviewer

  has_many :estimates_on,  class_name: 'Estimate', foreign_key: 'target_id', dependent: :destroy, inverse_of: :target
  has_many :estimates_by,  class_name: 'Estimate', foreign_key: 'author_id', dependent: :nullify, inverse_of: :author

  devise :database_authenticatable, 
         :registerable, 
         :confirmable,
         :recoverable, 
         :rememberable, 
         :validatable, 
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  validates :first_name,  length: { maximum: 25 }
  validates :last_name,   length: { maximum: 25 }
  validates :address,     length: { maximum: 100 }
  validates :role ,        length: { maximum: 100 }
  validates :behavior,    length: { maximum: 400 }
  validates :email,       uniqueness: true

  paginates_per 10
end
