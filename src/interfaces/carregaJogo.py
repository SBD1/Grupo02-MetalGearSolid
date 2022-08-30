from ConectaBanco import ConectaBanco

MENSAGEM_INTERFACE_CARREGAMENTO = """Insira o seu nome de usuário.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_carregamento_jogo():

    c = ConectaBanco()

    print(MENSAGEM_INTERFACE_CARREGAMENTO)

    entrada_do_jogador = input(">> ")
    if entrada_do_jogador == "voltar":
        return

    nome = c.select("Player", "nome", f"nome = '{entrada_do_jogador}'")
    # TRATAMENTO DE EXCEÇÕES: CASO O USUÁRIO INSIRA UM NOME NÃO EXISTENTE NO SISTEMA.
    if not nome:
        print("Insira um nome existente no sistema!")
    else:
        print(nome)


def trata_entrada(entrada):
    pass
