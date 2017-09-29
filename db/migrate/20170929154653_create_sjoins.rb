class CreateSjoins < ActiveRecord::Migration[5.1]
  def change
    create_table(:sjoins) do |t|
      t.column(:store_id, :integer)
      t.column(:brand_id, :integer)

      t.timestamps()
    end
  end
end
