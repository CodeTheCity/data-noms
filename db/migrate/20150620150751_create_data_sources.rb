class CreateDataSources < ActiveRecord::Migration
  def change
    create_table :data_sources do |t|
      t.string :name, null: false
      t.string :url,  null: false
      t.belongs_to :format

      t.timestamps null: false
    end
  end
end
