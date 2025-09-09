import 'package:flutter/material.dart';

void main() {
  runApp(const ProdutoApp());
}

class Produto {
  final int id;
  final String nome;
  final double valor;

  const Produto({required this.id, required this.nome, required this.valor});
}

const List<Produto> produtos = [
  Produto(id: 1, nome: 'Tv', valor: 1499.99),
  Produto(id: 2, nome: 'Teclado', valor: 149.50),
  Produto(id: 3, nome: 'Notebook', valor: 859.99),
  Produto(id: 4, nome: 'Fone de Ouvido', valor: 39.99),
  Produto(id: 5, nome: 'Celular', valor: 999.99),
];

class ProdutoApp extends StatelessWidget {
  const ProdutoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produtos em Destaque',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Lista de Produtos')),
        body: ListView.builder(
          itemCount: produtos.length,
          itemBuilder: (context, index) {
            final produto = produtos[index];
            final destaque = produto.valor > 500.00;

            return Card(
              color: destaque ? Colors.orange[100] : Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: Icon(
                  destaque ? Icons.star : Icons.shopping_cart,
                  color: destaque ? Colors.deepOrange : Colors.grey,
                ),
                title: Text(produto.nome),
                subtitle: Text('Valor: R\$${produto.valor.toStringAsFixed(2)}'),
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
