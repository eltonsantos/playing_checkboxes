class HistoricRefinancingsController < ApplicationController
  before_action :set_historic_refinancing, only: [:show, :edit, :update, :destroy]

  # GET /historic_refinancings
  # GET /historic_refinancings.json
  def index
    @historic_refinancings = HistoricRefinancing.all
  end

  # GET /historic_refinancings/1
  # GET /historic_refinancings/1.json
  def show
  end

  # GET /historic_refinancings/new
  def new
    @historic_refinancing = HistoricRefinancing.new
  end

  # GET /historic_refinancings/1/edit
  def edit
  end

  # POST /historic_refinancings
  # POST /historic_refinancings.json
  def create
    @historic_refinancing = HistoricRefinancing.new(historic_refinancing_params)

    respond_to do |format|
      if @historic_refinancing.save
        format.html { redirect_to @historic_refinancing, notice: 'Historic refinancing was successfully created.' }
        format.json { render :show, status: :created, location: @historic_refinancing }
      else
        format.html { render :new }
        format.json { render json: @historic_refinancing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historic_refinancings/1
  # PATCH/PUT /historic_refinancings/1.json
  def update
    respond_to do |format|
      if @historic_refinancing.update(historic_refinancing_params)
        format.html { redirect_to @historic_refinancing, notice: 'Historic refinancing was successfully updated.' }
        format.json { render :show, status: :ok, location: @historic_refinancing }
      else
        format.html { render :edit }
        format.json { render json: @historic_refinancing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historic_refinancings/1
  # DELETE /historic_refinancings/1.json
  def destroy
    @historic_refinancing.destroy
    respond_to do |format|
      format.html { redirect_to historic_refinancings_url, notice: 'Historic refinancing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historic_refinancing
      @historic_refinancing = HistoricRefinancing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historic_refinancing_params
      params.require(:historic_refinancing).permit(:authorization_origin_id, :refinancing_id, :authorization_new_id)
    end
end
