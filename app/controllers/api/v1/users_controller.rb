## Api::V1::UserController == module api module V1 class User
## :: -> acceder a un modulo dentro de otro
class Api::V1::UsersController < ApiController
    
    #antes de la acción el set_user se lo vas a mandar solo al show
    before_action :set_user, only: %i[show update destroy]
    
    wrap_parameters :user, include: %i[role_vp gender_vp cc name address email password password_confirmation phone_number date_of_birth]
    def index 
        @users = User.all
        render :index
        #render json: { users: @users }, status: :ok
    end

    def genders 
        render json: { message: 'Genders loaded', data: User.gender_vps}, status: :ok
    end

    def create 
        @user = User.new(user_params)
        if @user.save 
            render :show
        else
            render json: { message: 'usuario no ingresado', data: @user.errors}, status: :unprocessable_entity
        end
    end
    
    def show
        render :show
    end

    def update
        if @user.update(user_params)
            render json: {data: @user}, status: :ok
        else
            render json: { message: 'User not updated', data: @user.errors}, status: :unprocessable_entity
        end
    end

    #soft delete pending
    def destroy
        if @user.destroy
            render json: { data: @user}, status: :ok
        else
            render json: { message: 'User not deleted', data: @user.errors}, status: :unprocessable_entity
        end
    end

    private 
    def user_params
        params.require(:user).permit!
    end

    def set_user
        @user =  User.find(params[:id])
    end
end 