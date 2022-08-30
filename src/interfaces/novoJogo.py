MENSAGEM_INTERFACE_NOVO_JOGO = """Insira o seu nome de usuário.
Esse nome será utilizado para identificá-lo e para carregar o progresso.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_novo_jogo():
    mensagem_da_interface = MENSAGEM_INTERFACE_NOVO_JOGO

    # TRATAMENTO DE EXCEÇÕES: CASO O USUÁRIO DIGITE UM NOME JÁ EXISTENTE NO SISTEMA.
    # PRECISA CONECTAR NO BD

    entrada_do_jogador = input(">> ")

    print(mensagem_da_interface)
