defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Rua Rosa Jasmim, 55",
               age: 27,
               cep: "61905580",
               cpf: "05681788206",
               email: "renato@email.com",
               id: "98510772-1ef9-4b26-a2a4-832cb3142307",
               inserted_at: nil,
               name: "Renato Marinho",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
