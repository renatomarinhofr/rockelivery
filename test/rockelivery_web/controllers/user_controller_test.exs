defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, create the user", %{conn: conn} do
      params = %{
        "age" => 27,
        "address" => "Rua Rosa Jasmim, 55",
        "cep" => "61905580",
        "cpf" => "05681788206",
        "email" => "renato@email.com",
        "password" => "123456",
        "name" => "Renato Marinho"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua Rosa Jasmim, 55",
                 "age" => 27,
                 "cep" => "61905580",
                 "cpf" => "05681788206",
                 "email" => "renato@email.com",
                 "id" => _id,
                 "name" => "Renato Marinho"
               }
             } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Renato Marinho"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert expected_response == response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "98510772-1ef9-4b26-a2a4-832cb3142307"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
