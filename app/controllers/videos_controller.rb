class VideosController < ApplicationController
  def index
  	@videos = Video.all
  	@video = Video.new
  end

  def create
    Video.create!(video_params)
    redirect_to root_url
  end

private

  def video_params
    params.require(:video).permit(:video_url)
  end
end
