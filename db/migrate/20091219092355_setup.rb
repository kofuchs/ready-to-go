class Setup < ActiveRecord::Migration
  def self.up
    #Create Users table
    create_table "users", :force => true do |t|
      t.column :login,                     :string, :limit => 40
      t.column :name,                      :string, :limit => 100, :default => '', :null => true
      t.column :email,                     :string, :limit => 100
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string, :limit => 40
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code,           :string, :limit => 40
      t.column :activated_at,              :datetime

    end
    add_index :users, :login, :unique => true
    
    #Create Sessions table
    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text :data
      t.timestamps
    end
    add_index :sessions, :session_id
    add_index :sessions, :updated_at
    
    #Create Passwords table
    create_table "passwords" do |t|
      t.integer :user_id
      t.string :reset_code
      t.datetime :expiration_date
      t.timestamps
    end
    
    #Create Assignments and Roles tables
    create_table :roles do |t|
      t.string :name
    end
    
    create_table :assignments do |t|
      t.belongs_to :user
      t.belongs_to :role
    end
    
    #Creates an admin user, activate it and create the roles User and Admin!
    admin = User.create(:login => 'admin', :name => 'Administrator', :email=> CONFIG[:admin_email], :password => "password", :password_confirmation => "password")
    admin.activate!
    admin.roles << Role.create(:name => 'admin')
    Role.create(:name => 'user')
  end

  def self.down
    drop_table "users"
    drop_table :sessions
    drop_table "passwords"
    drop_table :roles
    drop_table :assignments
  end
end