class ApiController < ApplicationController
    before_action :set_default_format
    
    private
    #define return format
    def set_default_format
        request.format = :json
    end
end