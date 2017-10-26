class AddHpToPokemon < ActiveRecord::Migration[5.1]
  def change
    add_column :pokemons, :hp, :integer
  end
end
