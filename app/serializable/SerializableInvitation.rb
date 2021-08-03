class SerializableInvitation < JSONAPI::Serializable::Resource
  type 'invitations'
  attributes :id, :token, :status, :email
end