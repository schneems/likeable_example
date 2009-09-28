RailsWarden.unauthenticated_action = 'new'
Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :devise
  manager.failure_app = SessionsController
end

# Declare your strategies here
Warden::Strategies.add(:devise) do
  def valid?
    params[:email].present? || params[:password].present?
  end

  def authenticate!
    if user = User.authenticate(params[:email], params[:password])
      success!(user)
    else
      fail!(I18n.t(:failed_login, :scope => :devise, :default => 'Invalid email or password'))
    end
  end
end
