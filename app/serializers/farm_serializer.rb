class FarmSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :state, :city, :address, :zip_code
  belongs_to :user
end
