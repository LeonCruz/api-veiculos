class Api::V1::VeiculosController < ApplicationController
  def create
    @veiculo = Veiculo.new veiculos_params

    if @veiculo.save
      render json: @veiculo
    else
      render json: @veiculo.errors
    end
  end

  private

  def veiculos_params
    params.require(:veiculo).permit(:marca, :veiculo, :ano, :descricao, :vendido)
  end
end
