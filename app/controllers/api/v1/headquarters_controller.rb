## Api::V1::UserController == module api module V1 class User
## :: -> acceder a un modulo dentro de otro
class Api::V1::HeadquartersController < ApiController
    
    #antes de la acción el set_user se lo vas a mandar solo al show
    before_action :set_headquarter, only: %i[show update destroy]
    
    def index 
        @headquarter = Headquarter.all
        render json: { headquarters: @headquarter }, status: :ok
    end


    def create 
        @headquarter = Headquarter.new(headquarter_params)
        if @headquarter.save 
            render json: { message: 'Headquarter created', data: @headquarter}, status: :ok
        else
            render json: { message: 'Headquarter not created', data: @headquarter.errors}, status: :unprocessable_entity
        end
    end
    
    def show
        render json: { data: @headquarter }, status: :ok
    end

    def update
        if @headquarter.update(headquarter_params)
            render json: { message: 'Headquarter updated', data: @headquarter}, status: :ok
        else
            render json: { message: 'Headquarter not updated', data: @headquarter.errors}, status: :unprocessable_entity
        end
    end

    #soft delete pending
    def destroy
        if @headquarter.destroy
            render json: { message: 'Headquarter deleted', data: @headquarter}, status: :ok
        else
            render json: { message: 'Headquarter not deleted', data: @headquarter.errors}, status: :unprocessable_entity
        end
    end

    private 
    def headquarter_params
        params.require(:headquarter).permit!
    end

    def set_headquarter
        @headquarter =  Headquarter.find(params[:id])
    end
end 