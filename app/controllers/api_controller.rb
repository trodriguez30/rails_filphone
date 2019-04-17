class ApiController < ApplicationController
    before_action :set_default_format

    private
    #define el formato de retorno
    def set_default_format
        request.format = :json
    end
end