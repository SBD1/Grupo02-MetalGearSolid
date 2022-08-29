MENSAGEM_INTERFACE_CARREGAMENTO = """Insira o seu nome de usuário.
Caso queira voltar ao menu principal, digite "voltar"."""

def interface_carregamento_jogo():

    print(MENSAGEM_INTERFACE_CARREGAMENTO)

    entrada_do_jogador = input(">> ")
    # TRATAMENTO DE EXCEÇÕES: CASO O USUÁRIO INSIRA UM NOME NÃO EXISTENTE NO SISTEMA.
    trata_entrada(entrada_do_jogador)


def trata_entrada(entrada):
    pass
