class Api::V1::ShowsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    render json: { results: [{id: 1, img_url: '', title: 'hello', user: current_user}] }
  end
end
