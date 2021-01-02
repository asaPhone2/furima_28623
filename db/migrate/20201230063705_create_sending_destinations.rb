class CreateSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_destinations do |t|
      t.string    :post_code, null: false
      t.integer   :prefecture_code_id, null: false
      t.string    :city, null: false
      t.string    :house_number, null: false
      t.string    :bilding_number, null: false
      t.string    :phone_number, null: false
      t.references :purchase_history, null: false
      t.timestamps
    end
  end
end
