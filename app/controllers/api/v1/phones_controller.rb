## Api::V1::UserController == module api module V1 class User
## :: -> acceder a un modulo dentro de otro
class Api::V1::PhonesController < ApiController
    
    #antes de la acción el set_user se lo vas a mandar solo al show
    before_action :set_phone, only: %i[show update destroy]
    
    def index 
        @phones = Phone.all
        render json: { phones: @phones }, status: :ok
    end

    def create 
        @phone = Phone.new(phone_params)
        if @phone.save 
            render json: { message: 'phone created'}, status: :ok
        else
            render json: { message: 'Phone not reated', data: @phone.errors}, status: :unprocessable_entity
        end
    end
    
    def show
        render json: { data: @phone }, status: :ok
    end

    def update
        if @phone.update(phone_params)
            render json: { message: 'Phone  updated', data: @phone}, status: :ok
        else
            render json: { message: 'Phone not updated', data: @phone.errors}, status: :unprocessable_entity
        end
    end

    #soft delete pending
    def destroy
        if @phone.destroy
            render json: { message: 'Phone deleted',data: @phone}, status: :ok
        else
            render json: { message: 'Phone not deleted', data: @phone.errors}, status: :unprocessable_entity
        end
    end

    private 
    def phone_params
        params.require(:phone).permit!
    end

    def set_phone
        @phone =  Phone.find(params[:id])
    end
end 