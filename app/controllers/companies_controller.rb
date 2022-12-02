class CompaniesController < ApplicationController
  before_action :set_company, only: %i[ show update destroy ]

  # GET /companies
  def index
    @companies = Company.all

    render template: "companies/index"
  end

  # GET /companies/1
  def show
    render template: "companies/show"
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render template: "companies/show"
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    @company.name = params[:name] || @company.name
    @company.url = params[:url] || @company.url
    @company.region = params[:region] || @company.region
    @company.favorite = params[:favorite] || @company.favorite
    @company.notes = params[:notes] || @company.notes
    if @company.save
      render template: "companies/show",
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    render json: {message: "Company deleted."}
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name, :url, :region, :favorite, :notes)
  end
end
