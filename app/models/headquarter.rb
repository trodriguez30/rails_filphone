class Headquarter < ApplicationRecord

  enum city_vp: %i[barranquilla bogota cali medellin]
  belongs_to :user

  has_many :phones

  def as_json(*)
    super(except: %i[created_at updated_at])
  end
end
