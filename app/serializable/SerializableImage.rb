class SerializableImage < JSONAPI::Serializable::Resource
  type 'images'
  belongs_to :gift
  attributes :id, :image, :gift_id
end