class AddSportsPartnerCheckColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sports_partner_check, :boolean, default:false
  end
end