class Application < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true numericality: true
  has_many :pet_applications
  has_many :pets, through: :pet_applications        
end