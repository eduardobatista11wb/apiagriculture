class FarmSerializer < ActiveModel::Serializer
  attributes :id, :name, :country, :state, :city, :address, :zip_code, :seller_token
  belongs_to :user

  def seller_token
    object.user.name
  end

end
