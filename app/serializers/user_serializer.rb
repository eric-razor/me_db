class SerializableUser < JSON::Serializable::Resource
    type 'users'

    attributes :email, :password
end