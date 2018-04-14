class LpsController < ApplicationController
  before_action :set_lp, only: [:show, :edit, :update, :destroy]
  
  # GET /lps
  # GET /lps.json
  def index
    @artist = Artist.find params[:artist_id]
    if params[:i] && params[:i].length == 1
      @lps = @artist.lps.order("#{params[:sort]} #{params[:direction]}").where("title ilike ?", params[:i] + '%').page params[:page]
    else
      @lps = @artist.lps.order("#{params[:sort]} #{params[:direction]}").page params[:page]
    end
  end

  # GET /lps/1
  # GET /lps/1.json
  def show
  end

  # GET /lps/new
  def new
    @artist = Artist.find params[:artist_id]
    @lp = Lp.new
  end

  # GET /lps/1/edit
  def edit
  end

  # POST /lps
  # POST /lps.json
  def create
    @artist = Artist.find params[:artist_id]    
    @lp = Lp.new(lp_params)
    @lp.artist = @artist
    respond_to do |format|
      if @lp.save
        format.html { redirect_to @lp, notice: 'Lp was successfully created.' }
        format.json { render :show, status: :created, location: @lp }
      else
        format.html { render :new }
        format.json { render json: @lp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lps/1
  # PATCH/PUT /lps/1.json
  def update
    respond_to do |format|
      if @lp.update(lp_params)
        format.html { redirect_to @lp, notice: 'Lp was successfully updated.' }
        format.json { render :show, status: :ok, location: @lp }
      else
        format.html { render :edit }
        format.json { render json: @lp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lps/1
  # DELETE /lps/1.json
  def destroy
    artist = @lp.artist
    @lp.destroy
    respond_to do |format|
      format.html { redirect_to artist_lps_url(artist), notice: 'Lp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lp
      @lp = Lp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lp_params
      params.require(:lp).permit(:title, :artist, :condition, :type, :note, { genre_ids:[] })
    end
end
