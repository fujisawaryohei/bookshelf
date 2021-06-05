Hanami::Model.migration do
  change do
    alter_table :books do
      add_column :price, Integer, null: false, default: 0
    end
  end
end
