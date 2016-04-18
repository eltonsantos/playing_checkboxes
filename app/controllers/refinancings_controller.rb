class RefinancingsController < ApplicationController

  # GET /refinancings
  # GET /refinancings.json
  def index
    if params[:search_employee_by_cpf].present?
      @employees = Employee.search_cpf(params[:search_employee_by_cpf]).includes(:authorizations)

      #@employees = Employee.search_cpf(params[:search_employee_by_cpf]).all
      #@authorizations = Authorization.search_employee_by_cpf(params[:search_employee_by_cpf]).all
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
    if params[:authorization].present?
      @selected_ids = params[:authorization][:contract_ids]
      @authorizations = Authorization.where("contract_number in (?)", @selected_ids)
      Authorization.where(id: params[:authorization][:contract_ids]).update_all(value_solve: params[:authorization][:value_solve], situation: 2)
    end
    @employee = Employee.search_cpf(params[:search_employee_by_cpf])
    @refinancing = Refinancing.new
    # @refinancing.build_authorization
    #params[:authorization][:contract_ids].each_with_index do |index, id|
    #  Authorization.find(id).update_column(value_solve: params[:authorization][:value_solve], situation: 2)
    #end
    #params[:authorization][:contract_ids].each do |id|
    #  Authorization.find(id).update_column(value_solve: params[:authorization][:value_solve])
    #end
    #Authorization.where(id: params[:authorization]['contract_ids']).update_all(value_solve: params[:authorization]['value_solve'], situation: 2)
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
      params.require(:refinancing).permit(:employee_id, :authorization_id, :contract_number, :situation, :total_value, :parcel_value, :qtd_parcel, :refinancing_date, authorization_attributes: [ :value_solve ])
    end
end
