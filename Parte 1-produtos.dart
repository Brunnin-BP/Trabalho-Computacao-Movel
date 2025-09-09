  // Definindo a classe Produto, que representa um item com id, nome e valor.
class Produto {
  final int id;
  final String nome;
  final double valor;

  // Construtor da classe Produto, que requer id, nome e valor.
  Produto({required this.id, required this.nome, required this.valor});

   // Sobrescreve o método toString() para exibir uma representação legível do objeto.
  @override
  String toString() {
    // Formata a string retornada com os dados do produto.
    return 'Produto(id: $id, nome: "$nome", valor: R\$${valor.toStringAsFixed(2)})';
  }
}

void main() {
  // Criando uma lista de produtos com diferentes atributos.
  List<Produto> produtos = [
    Produto(id: 1, nome: 'Tv"', valor: 1499.99),
    Produto(id: 2, nome: 'Teclado', valor: 149.50),
    Produto(id: 3, nome: 'Notbook', valor: 859.99),
    Produto(id: 4, nome: 'Fone de Ouvido', valor: 39.99),
    Produto(id: 5, nome: 'Celular', valor: 999.99),
  ];

  print('Lista de Produtos Disponíveis:');
  for (var produto in produtos) {
    // Verifica se o valor do produto é maior que R$500.00 para destacar itens mais caros.
    if (produto.valor > 500.00) {
       // Exibe a mensagem de destaque para produtos com preço acima de R$500.00.
      print(
        '[ITEM EM DESTAQUE] ${produto.toString()} - Preço acima de R\$500.00!',
      );
    } else {
      // Caso contrário, exibe apenas o produto normalmente.
      print(produto);
    }
  }
}
