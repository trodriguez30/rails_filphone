class Headquarter < ApplicationRecord

  enum city_vp: %i[barranquilla bogota cali medellin]

  validate :already_exists

  belongs_to :user

  has_many :phones

  def as_json(*)
    super(except: %i[created_at updated_at])
  end

  private
  def already_exists
    if Headquarter.find_by(user_id: user_id)
      errors.add(:base, 'This user is already admin of ahother HQ')
    end
  end
end
