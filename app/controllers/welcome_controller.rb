class WelcomeController < ApplicationController

    #GET
    def index
        render json:{message: 'welcome to my first API'}, status: :ok
    end
end
