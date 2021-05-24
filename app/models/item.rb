class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :shipping
  belongs_to :status

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :area_id
    validates :day_id
  end

  validates :price, format: {with: /\A[0-9]+\z/ },numericality: {greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999 }
end
