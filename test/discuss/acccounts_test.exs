defmodule Discuss.AcccountsTest do
  use Discuss.DataCase

  alias Discuss.Acccounts

  describe "users" do
    alias Discuss.Acccounts.User

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Acccounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Acccounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Acccounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Acccounts.create_user(@valid_attrs)
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Acccounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Acccounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Acccounts.update_user(user, @invalid_attrs)
      assert user == Acccounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Acccounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Acccounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Acccounts.change_user(user)
    end
  end
end
