class LeaksController < ApplicationController
  before_action :set_leak, only: %i[show edit update destroy]

  # GET /leaks
  # GET /leaks.json
  def index
    @leaks = Leak.all
  end

  # GET /leaks/1
  # GET /leaks/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leak
    @leak = Leak.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leak_params
    params.require(:leak).permit(:content)
  end
end
