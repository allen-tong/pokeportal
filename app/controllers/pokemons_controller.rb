class PokemonsController < ApplicationController
  def capture
    pkmn = Pokemon.find(params[:id])
    pkmn.trainer_id = current_trainer.id
    pkmn.save
    redirect_to root_path
  end

  def damage
    pkmn = Pokemon.find(params[:id])
    if pkmn.hp > 0
      pkmn.hp -= 10
      pkmn.save
    end
    redirect_to trainer_path(id: pkmn.trainer_id)
  end

  def heal
    pkmn = Pokemon.find(params[:id])
    if pkmn.hp < 100
      pkmn.hp += 10
      pkmn.save
    end
    redirect_to trainer_path(id: pkmn.trainer_id)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(name: params[:pokemon][:name])
    @pokemon.level = 1
    @pokemon.hp = 100
    @pokemon.trainer_id = current_trainer.id
    if @pokemon.save
      redirect_to trainer_path(id: current_trainer.id)
    else
      redirect_to new_path
      flash[:error] = @pokemon.errors.full_messages.to_sentence
    end
  end
end
