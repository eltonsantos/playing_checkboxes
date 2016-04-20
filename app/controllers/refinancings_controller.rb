class RefinancingsController < ApplicationController

  def index
    if params[:search_employee_by_cpf].present?
      @employees = Employee.search_cpf(params[:search_employee_by_cpf]).includes(:authorizations)
    else
      @authorizations = []
    end
  end

  def show
    @refinancing = Refinancing.find(params[:id])
  end

  def new
    if params[:authorization].present?
      # Get contract_number checked
      @selected_ids = params[:authorization][:contract_number]
      # Get all authorizations checked
      @authorizations = Authorization.where("contract_number in (?)", @selected_ids)

      auth_params = params[:authorization]
      auth_params[:contract_number].zip(auth_params[:value_solve].reject(&:blank?)).each do |contract_number, value_solve|
          Authorization.where(contract_number: contract_number).update_all(value_solve: value_solve, situation: 2)
      end

    end
    @employee = Employee.search_cpf(params[:search_employee_by_cpf])
    @refinancing = Refinancing.new
  end

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

    def refinancing_params
      params.require(:refinancing).permit(:employee_id, :authorization_id, :contract_number, :situation, :total_value, :parcel_value, :qtd_parcel, :refinancing_date, authorization_attributes: [ :value_solve ])
    end
end
