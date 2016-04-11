class RefinancingsController < ApplicationController

  # GET /refinancings
  # GET /refinancings.json
  def index
    if params[:search_employee_by_cpf].present?
      @employees = Employee.search_cpf(params[:search_employee_by_cpf]).all
      @authorizations = Authorization.search_employee_by_cpf(params[:search_employee_by_cpf]).all
    else
      @authorizations = []
    end
  end

  # GET /refinancings/1
  # GET /refinancings/1.json
  def show
    @refinancing = Refinancing.find(params[:id])
  end

  # GET /refinancings/new
  def new
    @employee = Employee.search_cpf(params[:search_employee_by_cpf])
    @authorizations.authorization_marked = true
    @refinancing = Refinancing.new
  end

  # POST /refinancings
  # POST /refinancings.json
  def create
    @refinancing = Refinancing.new(refinancing_params)

    respond_to do |format|
      if @refinancing.save
        format.html { redirect_to @refinancing, notice: 'Refinancing was successfully created.' }
        format.json { render :show, status: :created, location: @refinancing }
      else
        format.html { render :new }
        format.json { render json: @refinancing.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def refinancing_params
      params.require(:refinancing).permit(:employee_id, :authorization_id, :contract_number, :situation, :total_value, :parcel_value, :qtd_parcel, :refinancing_date)
    end
end
