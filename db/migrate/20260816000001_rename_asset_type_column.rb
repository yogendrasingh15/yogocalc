class RenameAssetTypeColumn < ActiveRecord::Migration[7.0]
  def up
    if column_exists?(:assets, :asset_type)
      return
    end

    if column_exists?(:assets, :type)
      rename_column :assets, :type, :asset_type
    else
      add_column :assets, :asset_type, :string
    end
  end

  def down
    if column_exists?(:assets, :asset_type) && !column_exists?(:assets, :type)
      rename_column :assets, :asset_type, :type
    elsif column_exists?(:assets, :asset_type)
      remove_column :assets, :asset_type, :string
    end
  end
end
