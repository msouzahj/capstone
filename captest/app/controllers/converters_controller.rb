class ConvertersController < ApplicationController
  before_action :set_converter, only: [:show, :edit, :update, :destroy]

  def index
    @converters = Converter.all
  end

  def show
  end

  def new
    @converter = Converter.new
  end

  def edit
  end

  def create
    @converter = Converter.new(converter_params)
    @converter.save
    respond_with(@converter)
  end

  def update
    @converter.update(converter_params)
    respond_with(@converter)
  end

  def destroy
    @converter.destroy
    respond_with(@converter)
  end

  private
    def set_converter
      @converter = Converter.find(params[:id])
    end

    def converter_params
      params[:converter]
    end
end
