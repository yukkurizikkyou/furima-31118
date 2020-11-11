class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day


  with_options presence: true do
    validates :name            
    validates :explanation      
    validates :category_id,      exclusion: { in: [1], message: "Select"}
    validates :days_id ,         exclusion: { in: [1], message: "Select"}
    validates :condition_id ,    exclusion: { in: [1], message: "Select"}
    validates :delivery_fee_id,  exclusion: { in: [1], message: "Select"}
    validates :area_id,          exclusion: { in: [1], message: "Select"}
    validates :price,            numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }, inclusion: { in: 300..9_999_999, message: "Out of setting range"}
    validates :user            
    validates :image
  end
end

