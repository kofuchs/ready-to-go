class CreateAssignRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.timestamps
    end
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :role_id
      t.timestamps
    end
    
    Role.create(:name => 'admin')
    Role.create(:name => 'user')
  end

  def self.down
    drop_table :roles
    drop_table :assignments    
  end
end