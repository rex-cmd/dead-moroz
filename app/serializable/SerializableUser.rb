class SerializableUser < JSONAPI::Serializable::Resource
  type 'users'
  attributes :email, :role, :gifts
  link :self do
    "http://localhost:3001/users/#{@object.id}"
  end
end
