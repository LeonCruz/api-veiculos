class Veiculo < ApplicationRecord
  validates_presence_of :marca, :veiculo, :ano, :descricao
  validates :vendido, inclusion: [true, false]
end
