class AlbumsController < ApplicationController
    before_action :set_album, only: [:show, :destroy, :edit, :update]

    def show
        render :show
    end

    def new
        @band = Band.find_by(id: params[:band_id])
        @album = Album.new(band_id: params[:band_id])
    end

    def create
        @album = Album.new(album_params)

        if @album.save
            redirect_to album_url(@album)
        else
            @band = @album.band
            flash.now[:errors] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        render :edit
    end

    def update
        if @album.update(album_params)
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def destroy
        @album.destroy
        redirect_to band_url(@album.band_id)
    end

    private

    def album_params
        params.require(:album).permit(:title, :band_id, :year, :live)
    end
    
    def set_album
        @album = Album.find_by(id: params[:id])
    end
end
