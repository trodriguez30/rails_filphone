class Api::V1::PurchasesController < ApiController
    
    before_action :set_purchase, only: %i[show update destroy]
    
    def index 
        @purchase = Purchase.all
        render json: { purchases: @purchase }, status: :ok
    end


    def create 
        @purchase = Purchase.new(purchase_params)
        if @purchase.save 
            render json: { message: 'Purchase created', data: @purchase}, status: :ok
        else
            render json: { message: 'Purchase not created', data: @purchase.errors}, status: :unprocessable_entity
        end
    end
    
    def show
        render json: { data: @purchase }, status: :ok
    end

    def update
        if @purchase.update(purchase_params)
            render json: { message: 'Purchase updated', data: @purchase}, status: :ok
        else
            render json: { message: 'Purchase not updated', data: @purchase.errors}, status: :unprocessable_entity
        end
    end

    #soft delete pending
    def destroy
        if @purchase.destroy
            render json: { message: 'Purchase deleted', data: @purchase}, status: :ok
        else
            render json: { message: 'Purchase not deleted', data: @purchase.errors}, status: :unprocessable_entity
        end
    end

    private 
    def purchase_params
        params.require(:purchase).permit!
    end

    def set_purchase
        @purchase =  Purchase.find(params[:id])
    end
end 