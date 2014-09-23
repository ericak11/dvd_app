Sequel.migration do
  change do
    alter_table(:dvrs) do
      rename_column :hard_drive_size, :hdd_size
    end
  end
end
