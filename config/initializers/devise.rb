Devise.map :users, :for => [:authenticable, :recoverable, :confirmable]
Devise.map :admin, :for => [:authenticable]
