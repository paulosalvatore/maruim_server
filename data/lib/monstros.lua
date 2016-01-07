monstros = {
	["Alligator"] = {5, 34},
	["Amazon"] = {5, 20},
	["Angry Villager"] = {3, 15},
	["Azure Frog"] = {0, 10},
	["Bear"] = {0, 5},
	["Blazing Fire Elemental"] = {12, 125},
	["Blood Crab"] = {5, 20},
	["Bug"] = {0, 6},
	["Carrion Worm"] = {5, 45},
	["Cave Rat"] = {0, 4},
	["Coral Frog"] = {0, 10},
	["Crab"] = {1, 10},
	["Crimson Frog"] = {0, 10},
	["Crocodile"] = {0, 10},
	["Cyclops Drone"] = {4, 30},
	["Cyclops Smith"] = {9, 70},
	["Cyclops"] = {5, 47},
	["Emerald Damselfly"] = {4, 15},
	["Filth Toad"] = {4, 21},
	["Fire Elemental"] = {5, 43},
	["Gnarlhound"] = {5, 30},
	["Goblin Assassin"] = {1, 9},
	["Goblin Scavenger"] = {2, 9},
	["Goblin"] = {0, 9},
	["Island Tortoise"] = {5, 15},
	["Island Troll"] = {1, 10},
	["Killer Caiman"] = {30, 180},
	["Leaf Golem"] = {0, 30},
	["Minotaur"] = {5, 20},
	["Orc Spearman"] = {1, 11},
	["Orc"] = {2, 14},
	["Orchid Frog"] = {0, 10},
	["Poison Spider"] = {1, 5},
	["Rat"] = {0, 4},
	["Rotworm"] = {2, 17},
	["Salamander"] = {3, 15},
	["Scorpion"] = {0, 12},
	["Skeleton Warrior"] = {2, 12},
	["Skeleton"] = {1, 10},
	["Skunk"] = {2, 15},
	["Slime"] = {3, 17},
	["Slug"] = {7, 40},
	["Snake"] = {0, 4},
	["Spider"] = {0, 5},
	["Swamp Troll"] = {0, 8},
	["Swampling"] = {1, 12},
	["Thornfire Wolf"] = {7, 53},
	["Toad"] = {4, 20},
	["Troll Champion"] = {3, 12},
	["Troll"] = {1, 12},
	["Valkyrie"] = {1, 12},
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
