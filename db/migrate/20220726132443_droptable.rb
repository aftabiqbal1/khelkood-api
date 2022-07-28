class Droptable < ActiveRecord::Migration[7.0]
  def change
    execute "DROP TABLE #{:users} CASCADE"
  end
end
