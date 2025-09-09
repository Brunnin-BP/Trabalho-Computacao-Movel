import 'package:flutter/material.dart';

void main() {
  runApp(const ProdutoApp());
}

// Classe que representa um produto com id, nome e valor
class Produto {
  final int id;
  final String nome;
  final double valor;

  const Produto({required this.id, required this.nome, required this.valor});
}

// Lista constante de produtos
const List<Produto> produtos = [
  Produto(id: 1, nome: 'Tv', valor: 1499.99),
  Produto(id: 2, nome: 'Teclado', valor: 149.50),
  Produto(id: 3, nome: 'Notebook', valor: 859.99),
  Produto(id: 4, nome: 'Fone de Ouvido', valor: 39.99),
  Produto(id: 5, nome: 'Celular', valor: 999.99),
];

// Widget principal do aplicativo
class ProdutoApp extends StatelessWidget {
  const ProdutoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produtos em Destaque',
      theme: ThemeData(
        // Define o esquema de cores do app com base em uma cor semente
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Lista de Produtos')),
         // Lista de produtos exibida com ListView.builder
        body: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final produto = produtos[index];
            final destaque = produto.valor > 500.00;

            return Card(
               // Define a cor do card com base se é destaque ou não
              color: destaque ? Colors.orange[100] : Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                // Ícone diferente para produtos em destaque
                leading: Icon(
                  destaque ? Icons.star : Icons.shopping_cart,
                  color: destaque ? Colors.deepOrange : Colors.grey,
                ),
                // Nome do produto
                title: Text(produto.nome),
                // Valor do produto formatado
                subtitle: Text('Valor: R\$${produto.valor.toStringAsFixed(2)}'),
                // Texto adicional se o produto for destaque
                trailing: destaque
                    ? const Text(
                        '🔥 Destaque',
                        style: TextStyle(color: Colors.red),
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
