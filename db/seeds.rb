# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Make other trainers
mains = ['Pikachu', 'Blastoise', 'Starmie', 'Onix']
levels = [80, 60, 40, 20]
%w(Ash Gary Misty Brock).each do |name|
  trainer = Trainer.create name: name, email: name+"@pokeportal.com", password: 'password'
  i = trainer.id - 1
  Pokemon.create name: mains[i], level: levels[i], hp: levels[i] * 4, trainer: trainer
end
