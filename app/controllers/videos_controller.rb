class VideosController < ApplicationController
  def index
  	@videos = Video.all
  	@video = Video.new
  end
end
