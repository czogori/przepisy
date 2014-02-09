class UsersController < ApplicationController

    before_filter :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def new
        @user = User.new
    end

    def edit
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to users_path, notice: 'Utworzenie nowego konta użytkownika zakończone sukcesem.'
        else
                render action: 'new'
        end
    end

    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'Aktualizacja użytkownika zakończona sukcesem.'
        else
            render action: 'edit'
        end
    end

    def destroy
        @user.destroy
        redirect_to users_url
    end

private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
