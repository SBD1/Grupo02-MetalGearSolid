from interfaces.settings import MENSAGEM_INTERFACE_NOVO_JOGO


def interface_novo_jogo():
    mensagem_da_interface = MENSAGEM_INTERFACE_NOVO_JOGO

    # TRATAMENTO DE EXCEÇÕES: CASO O USUÁRIO DIGITE UM NOME JÁ EXISTENTE NO SISTEMA.
    # PRECISA CONECTAR NO BD

    print(mensagem_da_interface)
