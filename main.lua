local level

function love.load()
	local Object = require "classic"
	local Noeud = require "graphe"
	local Character = require "character"
	local Player = require "player"
	local Context = require "context"

	love.keyboard.setKeyRepeat(0.1, true)

	local triste = Character("Tajine", "data/tajine/triste.png")
	local cute = Character("Tajine", "data/tajine/cute.png")
	local classroom = Context("data/locations/classroom.jpg")

	-- Racine.
	level = Noeud("Est-ce que c'est plus clair ?"):addContext(classroom)
	level:addCharacter(cute)

	level
		:addChild("Oui.")
			:addCharacter(cute)
			:addAction("tajine_amitie", "tajine_amitie", "+", 1)
			:addChild("Yay. :D")
				:addChild(level) -- Retour à l'entretien
	level
		:addChild("Non.")
			:addCharacter(triste)
			:addChild("Ok. :(")
				:addChild(level) -- Retour à l'entretien
	level
		:addChild("Nooooooon !")
			:addCharacter(triste)
			:addChild("Aw. :(")
				:addChild(level) -- Retour à l'entretien
	level
		:addChild("Nique bien ta mère Y_Y.")
			:addCharacter(triste)
			:addAction("tajine_amitie", "tajine_amitie", "-", 1)
			:addChild("C'est pas gentil. :(")
				:addChild(level) -- Retour à l'entretien

	player = Player(level)
	player:initialize()
end

function love.draw()
	player:drawStuff()
end

function love.update(dt)
end
