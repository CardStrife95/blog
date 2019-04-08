class AccountsController < ApplicationController
    def create
        @account = Account.find_by("LOWER(username) = ?",account_params[:username].downcase)
        
        if @account.present? && @account.authenticate(account_params[:password])
            cookies.permanent.signed[:account_id] = @account.id
            redirect_to welcome_index_path
        else
            render :new
        end
    end

    def new
        @account = Account.new
    end

    def destroy
        cookies.delete(:account_id)
        redirect_to welcome_index_path
    end

    private
        def account_params
            params.require(:account).permit(:username,:password)
        end
end
