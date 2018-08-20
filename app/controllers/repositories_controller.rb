class RepositoriesController < ApplicationController
  before_action :set_repository, only: %i[show edit update destroy]

  # GET /repositories
  # GET /repositories.json
  def index
    @title = 'Repositories'
    @repositories = Repository.all
  end

  # GET /repositories/1
  # GET /repositories/1.json
  def show
    @title = @repository.url
    @leaks = @repository.leaks.where.not status: :checked
  end

  # GET /repositories/new
  def new
    @repository = Repository.new
  end

  # POST /repositories
  # POST /repositories.json
  def create
    @repository = Repository.new(repository_params)
    @repository.scan_leaks

    respond_to do |format|
      if @repository.save
        format.html { redirect_to @repository, notice: 'Repository was successfully created.' }
        format.json { render :show, status: :created, location: @repository }
      else
        format.html { render :new }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repositories/1
  # DELETE /repositories/1.json
  def destroy
    @repository.destroy
    respond_to do |format|
      format.html { redirect_to repositories_url, notice: 'Repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_repository
    @repository = Repository.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def repository_params
    params.require(:repository).permit(:url)
  end
end
