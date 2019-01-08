require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "User should have a email" do
    @user = User.new
    assert_not @user.save
  end

  test "User dont have a password with less six characters" do
    @user = User.new(name: 'test', password: '12')
    assert_not @user.save
  end

end
