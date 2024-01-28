extends Node2D

var is_dragging = false


# Quantidade de objetos necessarios a serem arrumados, a fim de completar
# o jogo
var objectiveNum
var objectiveGroup

# Os são ativados em sequencia, como uma Goldberg machine.
# A sequencia para no primeiro elemento consecutivo nao colocado
# no lugar. Por questao de falta de habilidade, estou colocando uma quantidade
# estatica no codigo que deve ser alterada manualmente
var objectives = []

func _ready():
	#var intro = get_parent().get_node("Intro")
	#intro.tree_exiting.connect()
	
	var main = get_parent().get_node("Main")
	objectiveGroup = main.get_tree().get_nodes_in_group("objective")
	objectiveNum = objectiveGroup.size()
	print(objectiveNum)
	objectives.resize(objectiveNum)
	
	# preenche a lista dos objetivos na ordem dos objectId, mantendo o numero
	# de indice de referência para a lista dos objetos "objectiveGroup"
	for i in objectiveNum:
		objectives[objectiveGroup[i].objectId-1] = i
	#pass
