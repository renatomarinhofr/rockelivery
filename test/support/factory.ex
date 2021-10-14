defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

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

  def user_factory do
    %User{
      age: 27,
      address: "Rua Rosa Jasmim, 55",
      cep: "61905580",
      cpf: "05681788206",
      email: "renato@email.com",
      password: "123456",
      name: "Renato Marinho",
      id: "98510772-1ef9-4b26-a2a4-832cb3142307"
    }
  end
end
