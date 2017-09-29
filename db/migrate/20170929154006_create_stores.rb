class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:store_name, :string)

      t.timestamps()
  end
end
