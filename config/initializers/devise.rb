Devise.map :user, :for => [:authenticable, :recoverable, :confirmable]
Devise.map :admin, :for => [:authenticable]
