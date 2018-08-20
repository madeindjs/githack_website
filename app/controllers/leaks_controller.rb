class LeaksController < ApplicationController
  before_action :set_leak, only: %i[show edit update]

  # GET /leaks
  # GET /leaks.json
  def index
    @leaks = Leak.all
  end

  # GET /leaks/1
  # GET /leaks/1.json
  def show; end

  # PATCH /leaks/1
  def update
    puts '*' * 80
    puts params['status'].inspect
    if params['status'] == 'safe'
      @leak.safe!
    else
      @leak.unsafe!
    end
    @leak.save
    redirect_to @leak.repository
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_leak
    @leak = Leak.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leak_params
    params.require(:leak).permit(:safe)
  end
end
