## Api::V1::UserController == module api module V1 class User
## :: -> acceder a un modulo dentro de otro
class Api::V1::UsersController < ApiController
    
    wrap_parameters :user, include: %i[role_vp gender_vp cc name address email password password_confirmation phone_number date_of_birth ]
    def index 
        @users = User.all
        render json: { users: @users }, status: :ok
    end

    def genders 
        render json: { message: 'Genders loaded', data: User.gender_vps}, status: :ok
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            render json: { message: 'Insertado'}, status: :ok
        else
            render json: { message: 'usuario no ingresado', data: @user.errors}, status: :unprocessable_entity
        end
    end 

    private 
    def user_params
        params.require(:user).permit!
    end
end 