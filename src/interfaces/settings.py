from classes.Player import Player

import os

player = None


def carrega_player(
        nome="",
        id_player=0
        ):
    global player  # isso aqui ainda não tá certo

    player = Player(nome, id_player)
    print(player.id_player)
    print(player.nome)


CABECALHO = """
                                     ____________________________________________________________________________________________________________
                                     |                   __  __      _        _    ____                   ____        _ _     _                 |
                                     |                  |  \/  | ___| |_ __ _| |  / ___| ___  __ _ _ __  / ___|  ___ | (_) __| |                |
                                     |                  | |\/| |/ _ \ __/ _` | | | |  _ / _ \/ _` | '__| \___ \ / _ \| | |/ _` |                |
                                     |                  | |  | |  __/ || (_| | | | |_| |  __/ (_| | |     ___) | (_) | | | (_| |                |
                                     |                  |_|  |_|\___|\__\__,_|_|  \____|\___|\__,_|_|    |____/ \___/|_|_|\__,_|                |
                                     |                                                                                                          |
                                     |                                                 __     __                                                |
                                     |                                                 \ \   / /                                                |
                                     |                                                  \ \ / /                                                 |
                                     |                                                   \ V /                                                  |
                                     |                                                    \_/                                                   |    
                                     |__________________________________________________________________________________________________________|
"""
SAIR = """
                                                                         ___________________________
                                                                        < Nos vemos em breve, Boss. >
                                                                         ---------------------------
                                                                                \   ^__^
                                                                                 \  (oo)\_______
                                                                                    (__)\       )\/\\
                                                                                        ||----w |
                                                                                        ||     ||
"""


def desenha_cabecalho():
    os.system("clear")
    print(CABECALHO)


def desenha_saida():
    os.system("clear")
    print(SAIR)
