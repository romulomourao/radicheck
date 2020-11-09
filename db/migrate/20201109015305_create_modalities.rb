class CreateModalities < ActiveRecord::Migration[6.0]
  def change
    create_table :modalities do |t|
      t.string  :name
      t.string  :tag
    end
  end
end
