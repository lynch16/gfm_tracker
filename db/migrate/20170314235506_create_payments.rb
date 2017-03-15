class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :amount_in_cents
      t.integer :project_id
      t.timestamps
    end
  end
end
