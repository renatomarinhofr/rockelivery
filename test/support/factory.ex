defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 27,
      address: "Rua Rosa Jasmim, 55",
      cep: "61905580",
      cpf: "05681788206",
      email: "renato@email.com",
      password: "123456",
      name: "Renato Marinho"
    }
  end
end
