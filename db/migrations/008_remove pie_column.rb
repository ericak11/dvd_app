Sequel.migration do
  change do
    alter_table(:genres) do
      drop_column :pie
    end
  end
end
