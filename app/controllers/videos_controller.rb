class VideosController < ApplicationController
  def index
  	@videos = Video.all
  	@video = Video.new
  end

  def create
  end

  def show
		@video = Video.find(params[:id])
  end
end
