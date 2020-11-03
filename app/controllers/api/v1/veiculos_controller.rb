class Api::V1::VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[show update destroy]

  def index
    @veiculos = Veiculo.all
    render json: @veiculos
  end

  def show
    render json: @veiculo
  end

  def create
    @veiculo = Veiculo.new veiculos_params

    if @veiculo.save
      render json: @veiculo
    else
      render json: @veiculo.errors
    end
  end

  def update
    if @veiculo.update(veiculos_params)
      render json: @veiculo
    else
      render json: @veiculo.errors
    end
  end

  def destroy
    @veiculo.destroy

    render json: { 'success': true, 'status': 'deletado' }
  end

  private

  def veiculos_params
    params.require(:veiculo).permit(:marca, :veiculo, :ano, :descricao, :vendido)
  end

  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end
end
