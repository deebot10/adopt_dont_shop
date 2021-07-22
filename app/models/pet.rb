class Pet < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true

  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications

  def shelter_name
    shelter.name
  end

  def self.adoptable
    where(adoptable: true)
  end

  def self.find_pet(name)
    where('lower(name) LIKE lower(?)', "#{name}")
    # where("lower(name) LIKE lower(%#{name}%")
  end
end
