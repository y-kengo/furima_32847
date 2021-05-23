class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:postal_code,:area_id ,:city,:address ,:building,:phone_number,:order_id,:price,:number,:cvc,:exp_month,:exp_year,:token

    with_options presence: true do
      validates :postal_code, format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: ' Input correctly'}
      validates :area_id,numericality:{ other_than: 1, message: 'Select' }
      validates :phone_number, format:{ with: /\A[0-9]{11}\z/, message: 'Input only number'} 
      validates :city
      validates :address
      validates :token
      validates :user_id
      validates :item_id
    end

    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building,phone_number: phone_number,order_id:order.id)
    end
end


