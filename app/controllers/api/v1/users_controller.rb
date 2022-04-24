class Api::V1::UsersController < ApplicationController
  respond_to :json

  def show
    render json: User.find(params[:id])
  end
end
