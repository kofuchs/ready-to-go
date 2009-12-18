authorization do
  role :admin do
    includes :guest
    includes :user
    has_permission_on :users, :to => [:admin, :all]
  end
  
  role :user do
    includes :guest
    has_permission_on :users, :to => [:edit, :update] do
      if_attribute :id => is { user.id }
    end

  end
  
  role :guest do
    has_permission_on :users, :to => [:create, :read]
  end
end

privileges do
  privilege :admin, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end