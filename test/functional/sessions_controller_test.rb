require 'test_helper'
require 'ostruct'

module SessionsTest

  def self.included(base)
    base.tests SessionsController
  end

  def mock_user
    @mock_user ||= mock('user', :email => 'test@test.com')
  end

  def setup_env(stubs={})
    @mock_warden ||= begin
      @request.env['warden'] = mock_warden = OpenStruct.new
      mock_warden
    end
#    stubs.each {|key, value| @mock_warden.stubs(key).returns(value) }
  end
end

class NoAuthenticatedUserSessionsControllerTest < ActionController::TestCase
  include SessionsTest

  class MockSession
    attr_accessor :app
    def initialize(app,configs = {})
      @app = app
    end

    def call(e)
      e['rack.session'] ||= {}
      @app.call(e)
    end
  end # session

  def setup_rack(app = nil, opts = {}, &block)
    Rack::Builder.new do
      use MockSession
      use Warden::Manager, opts do |manager|
        manager.failure_app = SessionsController
        manager.default_strategies :devise
      end
      run ActionController::Dispatcher.new
    end
  end

  def setup
#    setup_rack
#    setup_env
  end

  test 'GET #new should respond with success' do
#    @mock_warden.stubs(:authenticated?).returns(false)
    get :new
    assert_response :success
    assert_not_nil @controller.warden
  end

#  test 'GET #new should render template' do
#    @mock_warden.stubs(:authenticated?).returns(false)
#    get :new
#    assert_template 'new'
#  end

#  test 'GET #new should not set flash messages' do
#    @mock_warden.stubs(:authenticated?).returns(false)
#    get :new
#    assert flash.empty?
#  end

#  test 'POST #create with invalid credentials should respond with success' do
#    User.create!(:email => 'test@test.com', :password => '123456', :password_confirmation => '123456')
##    @mock_warden.stubs(:authenticate!).returns(lambda { raise 'Falha' })
#    post :create, :email => 'test@test.com', :password => '123456'
#    assert_response :success
#  end

#  test 'POST #create with invalid credentials should set flash error message' do
#    setup_env :authenticate! => false, :message => 'Invalid User or Password'
#    post :create
#    assert_equal 'Invalid User or Password', flash[:error]
#  end

#  test 'POST #create with invalid credentials should render login form' do
#    setup_env :authenticate! => false, :message => ''
#    post :create
#    assert_template 'new'
#  end

#  test 'POST #create with valid credentials should respond with redirect' do
#    setup_env :authenticate! => true
#    post :create, :email => 'test@email.com', :password => '123456'
#    assert_response :redirect
#  end

#  test 'POST #create with valid credentials should redirect to root path' do
#    setup_env :authenticate! => true
#    post :create, :email => 'test@email.com', :password => '123456'
#    assert_redirected_to root_path
#  end

#  test 'DELETE #destroy should redirect to login' do
#    setup_env :authenticate! => false
#    delete :destroy
#    assert_redirected_to new_session_path
#  end
end

#class AuthenticatedUserSessionsControllerTest < ActionController::TestCase
#  include SessionsTest

#  def setup
#    setup_env(:authenticated? => true, :user => mock_user)
#  end

#  test 'when authenticated GET #new should respond with redirect' do
#    get :new
#    assert_response :redirect
#  end

#  test 'when authenticated GET #new should redirect to root' do
#    get :new
#    assert_redirected_to root_path
#  end

#  test 'when authenticated GET #new should not set error flash message' do
#    get :new
#    assert flash.empty?
#  end

#  test 'when authenticated POST #create should respond with redirect' do
#    post :create
#    assert_response :redirect
#  end

#  test 'when authenticated POST #create should redirect to root' do
#    post :create
#    assert_redirected_to root_path
#  end

#  test 'when authenticated POST #create should not set flash message' do
#    post :create
#    assert flash.empty?
#  end
#end
