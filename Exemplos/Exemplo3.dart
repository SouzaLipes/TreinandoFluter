void main() {
// Criar instâncias da classe Carro
  Carro carro1 = Carro('Toyota', 'Corolla', 2024);
  Carro carro2 = Carro('Honda', 'Civic', 2022);
// Imprimir os detalhes dos carros
  carro1.detalhes();
  carro2.detalhes();
// Verificar se os carros são novos
  print('O carro ${carro1.modelo} é novo? ${carro1.isNovo()}');
  print('O carro ${carro2.modelo} é novo? ${carro2.isNovo()}');
}

class Carro {
  String marca;
  String modelo;
  int ano;
// Construtor da classe Carro
  Carro(this.marca, this.modelo, this.ano);
// Método para imprimir os detalhes do carro
  void detalhes() {
    print('Marca: $marca, Modelo: $modelo, Ano: $ano');
  }

// Método para verificar se o carro é novo
  bool isNovo() {
    return ano == DateTime.now().year;
  }
}
