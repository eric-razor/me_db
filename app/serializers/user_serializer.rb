class SerializableUser < JSON::Serializable::Resource
    type 'users'

    attributes :username, :email, :password
end