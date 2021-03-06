class CdsController < ApplicationController
  before_action :set_cd, only: [:show, :edit, :update, :destroy]
  
  # GET /cds
  # GET /cds.json
  def index
    @artist = Artist.find params[:artist_id]
    if params[:i] && params[:i].length == 1
      @cds = @artist.cds.order("#{params[:sort]} #{params[:direction]}").where("title ilike ?", params[:i] + '%').page params[:page]
    else
      @cds = @artist.cds.order("#{params[:sort]} #{params[:direction]}").page params[:page]
    end
  end

  # GET /cds/1
  # GET /cds/1.json
  def show
  end

  # GET /cds/new
  def new
    @artist = Artist.find params[:artist_id]
    @cd = Cd.new
  end

  # GET /cds/1/edit
  def edit
  end

  # POST /cds
  # POST /cds.json
  def create
    @artist = Artist.find params[:artist_id]
    @cd = Cd.new(cd_params)
    @cd.artist = @artist
    respond_to do |format|
      if @cd.save
        format.html { redirect_to @cd, notice: 'Cd was successfully created.' }
        format.json { render :show, status: :created, location: @cd }
      else
        format.html { render :new }
        format.json { render json: @cd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cds/1
  # PATCH/PUT /cds/1.json
  def update
    respond_to do |format|
      if @cd.update(cd_params)
        format.html { redirect_to @cd, notice: 'Cd was successfully updated.' }
        format.json { render :show, status: :ok, location: @cd }
      else
        format.html { render :edit }
        format.json { render json: @cd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cds/1
  # DELETE /cds/1.json
  def destroy
    artist = @cd.artist
    @cd.destroy
    respond_to do |format|
      format.html { redirect_to artist_cds_url(artist), notice: 'Cd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cd
      @cd = Cd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cd_params
      params.require(:cd).permit(:title, :artist, :condition, :type, :note, { genre_ids:[] })
    end
end
