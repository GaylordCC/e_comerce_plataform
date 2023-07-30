class Authentication::SessionsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by("email = :login OR username = :login", { login: params[:login] })
        pp @user
        pp "******************************************************"

        if @user&.authenticate(params[:password])
            redirect_to products_path, notice: t('.created')
        else

        end
    end


end