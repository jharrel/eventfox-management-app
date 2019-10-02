class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :project
      t.string :task

      t.timestamps
    end
  end
end
