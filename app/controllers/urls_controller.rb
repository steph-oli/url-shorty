class UrlsController < ApplicationController
  # before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
    @urls = Url.all
  end 

  def show
    url = Url.where(:short => params[:id]).first
    if url
      redirect_to url.original
    else
      render "index"
    end
  end 

  def new
    @url = Url.new
    letters = [('a'..'z'), ('A'..'Z')].map {|i| i.to_a}.flatten
    @url.short = (0...8).map{ letters[rand(letters.length)]}.join
  end

  def urls_params
    params.require(:url).permit(:original, :short)
  end 

  def create
    @url = Url.new(urls_params)
    if @url.save
      redirect_to urls_path
    else 
      render "new"
    end 
  end 

private
  def url_params
    params.require(:url).permit(:original, :short)
  end 
  
end 

