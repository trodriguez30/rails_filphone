json.status :ok
json.message 'success'
  json.data do
    json.extract! @headquarter, :id
    json.user do
        json.extract! @headquarter.user, :id, :role_vp, :gender_vp, :cc, :name, :address, :email, :phone_number, :date_of_birth
    end
    json.extract! @headquarter, :city_vp, :name, :address, :url
end
