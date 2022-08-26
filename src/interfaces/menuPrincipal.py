from src.settings import MENSAGEM_INTERFACE_MENU_PRINCIPAL, ENTRADAS_ACEITAS_MENU_PRINCIPAL


def interface_menu_principal():

    mensagem_da_interface = MENSAGEM_INTERFACE_MENU_PRINCIPAL
    print(mensagem_da_interface)

    entrada_do_jogador = input(">> ").split()
    entradas_aceitas = ENTRADAS_ACEITAS_MENU_PRINCIPAL
    trata_entrada(entrada_do_jogador, entradas_aceitas)


def trata_entrada(entrada_do_jogador: [str], entradas_aceitas: [str]):
    entrada = entrada_do_jogador[0]

    if mais_de_uma_palavra(entrada_do_jogador) or entrada_nao_aceita(entrada, entradas_aceitas):
        print("Insira uma entrada válida!")
        interface_menu_principal()
    else:
        # direciona para outro menu
        pass


def mais_de_uma_palavra(entrada_do_jogador: [str]):
    if len(entrada_do_jogador) > 1:
        return True
    return False


def entrada_nao_aceita(entrada_do_jogador: str, entradas_aceitas: [str]):
    if entrada_do_jogador not in entradas_aceitas:
        return True
    return False

### TESTE
# interface_menu_principal()


