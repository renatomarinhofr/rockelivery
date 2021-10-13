defmodule Rockelivery.UserTest do
  use Rockelivery.DataCase, async: true

  alias Ecto.Changeset
  alias Rockelivery.User

  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        age: 27,
        address: "Rua Rosa Jasmim, 55",
        cep: "61905580",
        cpf: "05681788206",
        email: "renato@email.com",
        password: "123456",
        name: "Renato Marinho"
      }

      response = User.changeset(params)

      assert %Changeset{changes: %{name: "Renato Marinho"}, valid?: true} = response
    end

    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = %{
        age: 27,
        address: "Rua Rosa Jasmim, 55",
        cep: "61905580",
        cpf: "05681788206",
        email: "renato@email.com",
        password: "123456",
        name: "Renato Marinho"
      }

      update_params = %{name: "Freitas", password: "123456"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Freitas"}, valid?: true} = response
    end

    test "when there are some error, returns a invalid changeset" do
      params = %{
        age: 15,
        address: "Rua Rosa Jasmim, 55",
        cep: "61905580",
        cpf: "05681788206",
        email: "renato@email.com",
        password: "123",
        name: "Renato Marinho"
      }

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
