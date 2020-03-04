# coding: utf-8

from GUI import GUI
import json
import random


def creer_grille(l,c):
	""" Cette fonction crée une grille aléatoire de taille l par c
	contenant des murs placés aléatoirement
	"""
	with open("grille.json", "r", encoding="utf-8") as fichier:
		(grille, p) = json.load(fichier)
	return grille, (p[0],p[1])


def voisins ( G, pos ) :
	r = []
	i = pos[0]; j = pos[1]
	if ( i > 0 and G [ i - 1 ] [ j ] != "wall" ) :
		r.append((i-1,j))		
	if ( i < len(G)-1 and G[i+1][j] != "wall") :
		r.append((i+1,j))
	if (j > 0 and G[i][j-1] != "wall") :
		r.append((i,j-1))
	if ( j < len(G[0])-1 and G[i][j+1] != "wall") :
		r.append((i,j+1))
	return r

def ParcoursRobot ( G, depart, gui ) :
	atteint = set()
	P = [ ( depart, [ depart ] ) ]
	prev_chemin = [ depart ]
	while ( len ( P )  > 0 ):
		( u, chemin ) = P.pop()
		i, j = u
		if ( u not in atteint ) :
			gui.deplacer_oscar(prev_chemin, chemin)
			prev_chemin = chemin
			atteint.add ( u )
			if (G[i][j] == "cookie"):
				print("j'ai trouvé le cookie au sommet", i, j)
				break
		for v in ( voisins ( G, u ) ) :
			P.append ( ( v, chemin + [ v ] ) )


if __name__ == '__main__':
	grille, pos_robot = creer_grille(12,20)
	print(voisins(grille , (3,3)))
	GUI(grille, pos_robot, ParcoursRobot)

