class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update

    @song.assign_attributes(song_params)

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end

  end

  def edit
	end


  def destroy
    # Song.find(params[:id]).destroy
    binding.pry
    @song.destroy
    redirect_to songs_path(@song)
  end


  private

  def set_song!
      @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(:title, :artist_name, :released, :release_year, :artist_name, :genre)
  end

end
