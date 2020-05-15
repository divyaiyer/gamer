class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end
    # GET /albums/new
  def new
    @album = Album.new
    @play = Play.new
  end
  # POST /albums
  # POST /albums.json
  def create
    errors = []
    if params[:album][:album_image] 
      params[:album][:album_image].each_with_index do |img,i|
       @album = Album.new(album_image: img)
       if !@album.save
         errors << @album.errors
       end
      end
    end
    if errors.empty?
      flash[:notice] = "Uploaded Images, All set for play!!"
    else
      flash[:notice] = "Error in Uploaded Files, check file type 'jpg jpeg gif png'"
    end
    redirect_to "/plays",:notice =>flash[:notice]
  end


  private
    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name,{album_image: []})
    end
end
