class RepositoriesController < ApplicationController
  before_action :set_repository, only: %i[show edit update destroy]

  # GET /repositories
  # GET /repositories.json
  def index
    @title = 'Repositories'
    @repositories = Repository.includes(:leaks).all.order(:url)
  end

  # GET /repositories/1
  # GET /repositories/1.json
  def show
    @title = @repository.url

    @leaks = @repository.leaks

    @unchecked_leaks = @leaks.select(&:unchecked?)
    @safe_leaks = @leaks.select(&:safe?)
    @unsafe_leaks = @leaks.select(&:unsafe?)

    @unchecked_leak_exists = @unchecked_leaks.count > 0
  end

  # GET /repositories/new
  def new
    @title = 'New'
    @repository = Repository.new
  end

  # POST /repositories
  # POST /repositories.json
  def create
    @repository = Repository.new(repository_params)

    if @repository.valid?
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
    else
      flash[:danger] = @repository.errors
      render :new
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
    params.require(:repository).permit(:url, :framework)
  end
end
