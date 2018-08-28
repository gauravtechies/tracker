class StocksController < ApplicationController

    def search
        if params[:stock].present? 
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "Enter the correct name of stock" unless @stock
        else
            flash.now[:danger] = "Please type Something in search box"
        end
        render partial: 'users/result'
       
    end
    
end
