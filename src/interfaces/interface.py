# WIP, talvez seja descartado!

class Interface:
    def __init__(
                self,
                mensagem_da_interface: str,
                entradas_aceitas: [str]
                ):
        self.mensagem_da_interface = mensagem_da_interface
        self.entradas_aceitas = entradas_aceitas

    def roda_interface(self):
        pass


    def printa_mensagem_da_interface(self):
        print(self.mensagem_da_interface)



