class CountersController < ApplicationController
	protect_from_forgery with: :null_session
  def index
  	response.headers["Access-Control-Allow-Origin"] = "*"
     response.headers["Access-Control-Allow-Methods"] = "*"
     @counter = Counter2.all
     render json: @counter
  end

  def create
  	response.headers["Access-Control-Allow-Origin"] = "*"
     response.headers["Access-Control-Allow-Methods"] = "*"
  	 @counter = Counter2.new
     @counter.productId = params[:productId]
     @counter.shopName = params[:shopName]
     @counter.save

     render json: @counter
  end
  def params_counter
  	
  end
end
