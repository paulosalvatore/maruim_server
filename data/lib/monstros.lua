monstros = {
	["Alligator"] = {5, 34},
	["Amazon"] = {5, 20},
	["Angry Villager"] = {3, 15},
	["Azure Frog"] = {0, 10},
	["Bandit"] = {4, 30},
	["Banshee"] = {0, 70},
	["Bear"] = {0, 5},
	["Blazing Fire Elemental"] = {12, 125},
	["Blood Crab"] = {5, 20},
	["Bug"] = {0, 6},
	["Carrion Worm"] = {5, 45},
	["Cave Rat"] = {0, 4},
	["Centipede"] = {1, 15},
	["Coral Frog"] = {0, 10},
	["Crab"] = {1, 10},
	["Crimson Frog"] = {0, 10},
	["Crocodile"] = {0, 10},
	["Crypt Shambler"] = {6, 55},
	["Cyclops Drone"] = {4, 30},
	["Cyclops Smith"] = {9, 70},
	["Cyclops"] = {5, 47},
	["Deepling Brawler"] = {5, 44},
	["Deepling Elite"] = {29, 186},
	["Deepling Guard"] = {62, 380},
	["Deepling Master Librarian"] = {78, 400},
	["Deepling Scout"] = {6, 50},
	["Deepling Spellsinger"] = {27, 160},
	["Deepling Tyrant"] = {90, 600},
	["Deepling Warrior"] = {33, 180},
	["Deepling Worker"] = {4, 25},
	["Demon Skeleton"] = {9, 75},
	["Dragon Hatchling"] = {6, 55},
	["Dragon Lord Hatchling"] = {25, 165},
	["Dragon Lord"] = {40, 245},
	["Dragon"] = {11, 105},
	["Dwarf Geomancer"] = {0, 45},
	["Dwarf Guard"] = {0, 30},
	["Dwarf Soldier"] = {0, 12},
	["Dwarf"] = {0, 8},
	["Emerald Damselfly"] = {4, 15},
	["Filth Toad"] = {4, 21},
	["Fire Elemental"] = {5, 43},
	["Ghoul"] = {5, 30},
	["Giant Spider"] = {30, 195},
	["Gnarlhound"] = {5, 30},
	["Goblin Assassin"] = {1, 9},
	["Goblin Scavenger"] = {2, 9},
	["Goblin"] = {0, 9},
	["Hydra"] = {82, 546},
	["Island Tortoise"] = {3, 15},
	["Island Troll"] = {1, 10},
	["Killer Caiman"] = {30, 180},
	["Larva"] = {1, 15},
	["Leaf Golem"] = {0, 30},
	["Lich"] = {38, 237},
	["Medusa"] = {102, 790},
	["Minotaur"] = {5, 20},
	["Nomad"] = {5, 40},
	["Orc Spearman"] = {1, 11},
	["Orc"] = {2, 14},
	["Orchid Frog"] = {0, 10},
	["Poison Spider"] = {1, 5},
	["Quara Constrictor Scout"] = {8, 49},
	["Quara Constrictor"] = {16, 100},
	["Quara Hydromancer Scout"] = {21, 139},
	["Quara Hydromancer"] = {17, 110},
	["Quara Mantassin Scout"] = {5, 30},
	["Quara Mantassin"] = {19, 129},
	["Quara Pincher Scout"] = {23, 143},
	["Quara Pincher"] = {42, 249},
	["Quara Predator Scout"] = {16, 129},
	["Quara Predator"] = {21, 153},
	["Rat"] = {0, 4},
	["Rotworm"] = {2, 17},
	["Salamander"] = {3, 15},
	["Sandcrawler"] = {0, 6},
	["Scorpion"] = {0, 12},
	["Skeleton Warrior"] = {2, 12},
	["Skeleton"] = {1, 10},
	["Skunk"] = {2, 15},
	["Slime"] = {3, 17},
	["Slug"] = {7, 40},
	["Smuggler"] = {1, 10},
	["Snake"] = {0, 4},
	["Spider"] = {0, 5},
	["Stone Golem"] = {6, 40},
	["Swamp Troll"] = {0, 8},
	["Swampling"] = {1, 12},
	["Tarantula"] = {6, 40},
	["Thornback Tortoise"] = {6, 48},
	["Thornfire Wolf"] = {7, 53},
	["Toad"] = {4, 20},
	["Tortoise"] = {5, 30},
	["Troll Champion"] = {3, 12},
	["Troll"] = {1, 12},
	["Valkyrie"] = {1, 12},
	["Wailing Widow"] = {18, 137},
	["Weak Fire Elemental"] = {4, 26},
	["Wasp"] = {0, 4},
	["Wisp"] = {3, 15},
	["Witch"] = {7, 40},
	["Wolf"] = {0, 5}
}

monstrosDano = {}

for a, b in pairs(monstros) do
	monstrosDano[a] = {}
end

--	Features do Sistema de Gold após matar
--		Definido - Fazer
--		Criar um local separado para o dinheiro ir
--			O jogador poderá retirar gold a qualquer momento
--				desse local, porém, não poderá depositar lá
--			O jogador poderá transferir todo o dinheiro
--				para o banco caso esteja em um banqueiro
--		Estudar
--		Estudar limite de ouro no sistema para evitar com que o jogador
--		acumule muito ouro nesse sistema já que dá pra retirar a qualquer momento
--		Estudar a possibilidade de um item que aumenta
--			a quantidade de gold obtido por monstro
--		Estudar a implementação de um calculo para verificar se
--		as curas (nos participantes das parties dos atacantes) irá
--			afetar na divisão
--		Estudar a possibilidade do líder da party ativar a divisão
--			igualitária do gold entre os membros da party que estão próximos (30 sqm)
