class Api::V1::VeiculosController < ApplicationController
  def index
    @veiculos = Veiculo.all
    render json: @veiculos
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
    @veiculo = Veiculo.find(params[:id])
    @veiculo.update(veiculos_params)

    render json: { 'success': true, 'status': 'atualizado' }
  end

  def destroy
    @veiculo = Veiculo.find(params[:id])
    @veiculo.destroy

    render json: { 'success': true, 'status': 'deletado' }
  end

  private

  def veiculos_params
    params.require(:veiculo).permit(:marca, :veiculo, :ano, :descricao, :vendido)
  end
end
