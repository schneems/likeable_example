require 'test_helper'

class AuthenticationTest < ActionController::IntegrationTest

  def warden
    request.env['warden']
  end

  def create_user(options={})
    @user ||= User.create!(
      :email => 'test@test.com', :password => '123456', :password_confirmation => '123456'
    )
    @user.confirm! unless options[:confirm] == false
  end

  def sign_in(options={}, &block)
    create_user(options)
    visit '/'
    fill_in 'email', :with => 'test@test.com'
    fill_in 'password', :with => '123456'
    yield if block_given?
    click_button 'Sign In'
  end

  test 'not authenticated user should load up sign in form' do
    visit '/'
    assert_response :success
    assert_template 'sessions/new'
  end

  test 'signing in with invalid email should return to sign in form with error message' do
    sign_in do
      fill_in 'email', :with => 'wrongemail@test.com'
    end

    assert_response :success
    assert_template 'sessions/new'
    assert_contain 'Invalid email or password'
    assert !warden.authenticated?
  end

  test 'signing in with invalid pasword should return to sign in form with error message' do
    sign_in do
      fill_in 'password', :with => 'abcdef'
    end

    assert_response :success
    assert_template 'sessions/new'
    assert_contain 'Invalid email or password'
    assert !warden.authenticated?
  end

  test 'not confirmed user should not be able to login' do
    sign_in(:confirm => false)

    assert_contain 'Invalid email or password'
    assert !warden.authenticated?
  end

  test 'when user is authenticated should not open sign in form' do
    sign_in

    assert_response :success
    assert_template 'home/index'
    assert_not_contain 'Sign In'
    assert warden.authenticated?
  end

  test 'not authenticated user should not be able to sign out' do
    delete '/session'

    assert_response :success
    assert_template 'sessions/new'
    assert !warden.authenticated?
  end

  test 'authenticated user should be able to sign out' do
    sign_in
    assert warden.authenticated?

    delete '/session'
    assert_response :redirect
    assert_redirected_to new_session_path
    assert !warden.authenticated?
  end
end
