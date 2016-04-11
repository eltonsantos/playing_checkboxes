class LoansController < ApplicationController
  def index
     if params[:search_cpf].present?
      @employees = Employee.search_cpf(params[:search_cpf]).all
    else
      @employees = []
    end
  end
end
