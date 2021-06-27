class Gift < ApplicationRecord
    scope :selected, -> { where(selected: true) }

    belongs_to :recipient, class_name: 'User', inverse_of: :gifts
    belongs_to :added_by,  class_name: 'User', optional: true, inverse_of: :gifts_added
    has_many :images, dependent: :destroy
    
    
    accepts_nested_attributes_for :images, allow_destroy: true

    validates :title,       presence: true, length: { maximum: 50 }
    validates :description, length: { maximum: 100 }
    validates :images,      length: { maximum: 2}
end
