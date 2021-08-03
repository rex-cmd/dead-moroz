class SerializableGift < JSONAPI::Serializable::Resource
  type 'gifts'
  has_many :images
  attributes :title, :description, :images_attributes
end
