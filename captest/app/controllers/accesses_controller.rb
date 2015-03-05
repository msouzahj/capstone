class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]

  def index
    @accesses = Access.all
    respond_with(@accesses)
  end

  def show
    respond_with(@access)
  end

  def new
    @access = Access.new
    respond_with(@access)
  end

  def edit
  end

  def create
    @access = Access.new(access_params)
    @access.save
    respond_with(@access)
  end

  def update
    @access.update(access_params)
    respond_with(@access)
  end

  def destroy
    @access.destroy
    respond_with(@access)
  end

  private
    def set_access
      @access = Access.find(params[:id])
    end

    def access_params
      params.require(:access).permit(:meets_id, :seasons_id, :events_id)
    end
end
