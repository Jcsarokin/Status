class CreateStatis < ActiveRecord::Migration
  def change
    create_table :statis do |t|
      t.string :description

      t.timestamps
    end
  end
end
