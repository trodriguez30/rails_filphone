class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :phone

  def as_json(*)
    super(except: %i[created_at updated_at])
  end
end
