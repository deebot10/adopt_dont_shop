class Application < ApplicationRecord
  has_many :pets_applications
  has_many :pets, through: :pet_applications        
end