require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:rodrigo)
  end

  test "invalid edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {name: "", email: "testuserint@invalid", password: "123456", password_confirmation: "123456"}

    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)

    log_in_as(@user)

    assert_redirected_to edit_user_path(@user)
    patch user_path(@user), user: {name: "Rodrigo R", email: "testuserint@valid.com", password: "", password_confirmation: ""}

    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, "Rodrigo R"
    assert_equal @user.email, "testuserint@valid.com"

  end

end
