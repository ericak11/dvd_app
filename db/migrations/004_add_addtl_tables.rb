Sequel.migration do
  change do
    create_table(:series_viewers) do
      primary_key :id
      foreign_key :viewer_id, :viewers, :null=>false, :key=>[:id]
      foreign_key :series_id, :series, :null=>false, :key=>[:id]
    end
    create_table(:genres_series) do
      primary_key :id
      foreign_key :genre_id, :genres, :null=>false, :key=>[:id]
      foreign_key :series_id, :series, :null=>false, :key=>[:id]
    end
    create_table(:flags) do
      primary_key :id
      String :name, :size => 127, :null => false
    end
    create_table(:flags_episodes) do
      primary_key :id
      foreign_key :episode_id, :episodes, :null=>false, :key=>[:id]
      foreign_key :flag_id, :flags, :null=>false, :key=>[:id]
    end
    create_table(:dvrs) do
      primary_key :id
      Integer :serial_number, :null=>false
      Integer :hard_drive_size, :null=>false
      String :zip_code, :size => 5, :null => false
    end
    create_table(:dvrs_viewers) do
      primary_key :id
      foreign_key :dvr_id, :dvrs, :null=>false, :key=>[:id]
      foreign_key :viewer_id, :viewers, :null=>false, :key=>[:id]
    end
    create_table(:dvrs_recordings) do
      primary_key :id
      foreign_key :dvr_id, :dvrs, :null=>false, :key=>[:id]
      foreign_key :recording_id, :recordings, :null=>false, :key=>[:id]
    end
  end
end
