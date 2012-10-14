class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.text :format
      t.text :output
      t.boolean :public
      t.references :account

      t.timestamps
    end
    add_index :datasets, :account_id
  end
end
