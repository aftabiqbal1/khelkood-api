class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :name
      t.text :desc
      t.string :promo_code
      t.float :discount_percentage

      t.timestamps
    end
  end
end
