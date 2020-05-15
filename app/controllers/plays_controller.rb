class PlaysController < ApplicationController

  # GET /plays
  # GET /plays.json
  def index
    @images_hash = {}
    images = Album.select("id, album_image").limit(10).order("RAND()")
    images.each_with_index {|v, i| @images_hash[i] = v}
    @random_key = @images_hash.keys.sample

    @img = @images_hash[@random_key]
    missing = 10 - images.size

    @plays = Play.all

    if images.size <=10
        images.size.times do |i|
          p = Play.find_or_initialize_by(timer:10-i)
          if p.new_record?
           p.index_of_array = i
           p.play_image = @images_hash[i].album_image
           p.save
          end
        end
    end 
    if missing != 0 
      missing.size.times do |i|
          n = Play.last.timer if !Play.last.nil?
          if !n.nil? && n != 1
            p = Play.find_or_initialize_by(timer:n-1)
            if p.new_record?
             p.index_of_array = i 
             p.play_image = @images_hash[i].album_image if @images_hash[i].present?
             p.save
            end
          end
      end
    end     
  end

 
  # PATCH/PUT /plays/1
  # PATCH/PUT /plays/1.json
  def update
    url = params[:img_url].gsub(root_url,'/')
    id  = url.split('/')[4].to_i

    respond_to do |format|
      if params[:timer]
        @play = Play.find_by_timer(params[:timer])
        @play.index_of_array = params[:key]
        @play.play_image = Album.find_by_id(id).album_image
        @play.save
      end
      @plays = Play.all
      format.js {render layout: false}
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def play_params
      params.require(:play).permit(:filename, :file_url, :timer,{play_image: []})
    end
end
