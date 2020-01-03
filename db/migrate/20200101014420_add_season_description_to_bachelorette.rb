class AddSeasonDescriptionToBachelorette < ActiveRecord::Migration[5.2]
  def change
    add_column :bachelorettes, :season_description, :string
  end
end
