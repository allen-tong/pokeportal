class PokemonsController < ApplicationController
  def capture
    level = rand(1..20)
    Pokemon.create name: params[:name], level: level, hp: level * 4, trainer: current_trainer
    redirect_to trainer_path(id: current_trainer.id)
  end

  def damage
    pkmn = Pokemon.find(params[:id])
    attacker = Pokemon.find(params[:attack][:attacker_id])
    if pkmn.hp > 0
      pkmn.hp = [pkmn.hp - 10, 0].max
      pkmn.save
      if attacker.level < 100
        attacker.level += 1
        attacker.save
      end
    end
    Trainer.all.each do |trainer|
      if trainer != current_trainer && trainer != pkmn.trainer
        trainer.pokemon.each do |pokemon|
          pokemon.hp = [pokemon.hp + 10, pokemon.level * 4].min
          pokemon.save
        end
      end
    end
    redirect_to trainer_path(id: pkmn.trainer_id)
  end

  def heal
    pkmn = Pokemon.find(params[:id])
    if pkmn.hp < pkmn.level * 4
      pkmn.hp = [pkmn.hp + 10, pkmn.level * 4].min
      pkmn.save
    end
    redirect_to trainer_path(id: pkmn.trainer_id)
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(name: params[:pokemon][:name])
    @pokemon.level = 5
    @pokemon.hp = 20
    @pokemon.trainer_id = current_trainer.id
    if @pokemon.save
      redirect_to trainer_path(id: current_trainer.id)
    else
      redirect_to new_path
      flash[:error] = @pokemon.errors.full_messages.to_sentence
    end
  end

  def release
    pkmn = Pokemon.find(params[:id])
    trainer = pkmn.trainer_id
    pkmn.destroy
    redirect_to trainer_path(id: trainer)
  end
end
