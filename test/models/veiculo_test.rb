require 'test_helper'

class VeiculoTest < ActiveSupport::TestCase
  test 'cadastro de um veiculo' do
    @veiculo = Veiculo.new(marca: 'Cadillac', veiculo: 'automovel', ano: 1991,
                           descricao: 'Deville/Eldorado 4.9', vendido: false)
    assert_difference 'Veiculo.count' do
      @veiculo.save
    end
  end

  test 'não cadastra um veiculo invalido' do
    @veiculo = Veiculo.new(marca: 'Cadillac', veiculo: 'automovel', vendido: false)

    assert_difference 'Veiculo.count', 0 do
      @veiculo.save
    end
  end
end
