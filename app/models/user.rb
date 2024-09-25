class User < ApplicationRecord
  validates :name, presence: true
  validates :birthday, presence: true  

  has_many :conditions  

  def age
    return unless birthday  

    today = Date.today
    age = today.year - birthday.year
    age -= 1 if today < birthday + age.years
    age
  end
end
