class CreateWanderlists < ActiveRecord::Migration
  def change
    create_table :wanderlists do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
