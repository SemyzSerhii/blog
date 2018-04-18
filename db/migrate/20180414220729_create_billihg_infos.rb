class CreateBillihgInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :billihg_infos do |t|
      t.string :last4
      t.string :country
      t.string :brand
      t.integer :user_id
      t.timestamps
    end

  end
end
