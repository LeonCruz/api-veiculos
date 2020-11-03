require 'test_helper'

class Api::V1::VeiculosControllerTest < ActionDispatch::IntegrationTest
  test 'cadastrar um veiculo' do
    veiculo = { marca: 'Cadillac', veiculo: 'automovel', ano: 1991,
                descricao: 'Deville/Eldorado 4.9', vendido: false }

    assert_difference 'Veiculo.count' do
      post api_v1_veiculos_url, params: { veiculo: veiculo }
    end
  end

  test 'listar veiculos' do
    get api_v1_veiculos_url
    assert_response :success
  end

  test 'detalhes de um veiculo' do
    get api_v1_veiculo_url(id: veiculos(:one).id)
    assert_response :success
  end

  test 'alterar um veiculo' do
    put api_v1_veiculo_url(id: veiculos(:one).id), params: { veiculo: { vendido: true } }
    assert_response :success
  end

  test 'remove um veiculo' do
    assert_difference 'Veiculo.count', -1 do
      delete api_v1_veiculo_url(id: veiculos(:one).id)
    end
  end
end
