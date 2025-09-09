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

// Widget principal do aplicativo
class ProdutoApp extends StatefulWidget {
  const ProdutoApp({super.key});

  @override
  State<ProdutoApp> createState() => _ProdutoAppState();
}

class _ProdutoAppState extends State<ProdutoApp> {
  // Lista inicial de produtos (agora mutável)
  final List<Produto> _produtos = [
    const Produto(id: 1, nome: 'Tv', valor: 1499.99),
    const Produto(id: 2, nome: 'Teclado', valor: 149.50),
    const Produto(id: 3, nome: 'Notebook', valor: 859.99),
    const Produto(id: 4, nome: 'Fone de Ouvido', valor: 39.99),
    const Produto(id: 5, nome: 'Celular', valor: 999.99),
  ];

  // Contador usado para atribuir IDs únicos a novos produtos
  int _contador = 6; 

  // Função que adiciona um novo item à lista
  void _adicionarProduto() {
    setState(() {
      _produtos.add(
        Produto(
          id: _contador,
          nome: 'Produto $_contador',
          valor: 100.0 + (_contador * 50),
        ),
      );
      _contador++;
    });
  }

  // Função que remove o primeiro item da lista
  void _removerPrimeiroProduto() {
    setState(() {
      if (_produtos.isNotEmpty) {
        _produtos.removeAt(0);
      }
    });
  }

  // Função que inverte a ordem dos elementos
  void _inverterOrdem() {
    setState(() {
      _produtos.setAll(0, _produtos.reversed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Produtos Interativos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Produtos'),
          actions: [
            // Botão para inverter a ordem dos produtos
            IconButton(
              onPressed: _inverterOrdem,
              icon: const Icon(Icons.swap_vert),
              tooltip: "Inverter Ordem",
            ),
            // Botão para remover o primeiro produto da lista
            IconButton(
              onPressed: _removerPrimeiroProduto,
              icon: const Icon(Icons.delete),
              tooltip: "Remover Primeiro",
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _produtos.length,
          itemBuilder: (context, index) {
            final produto = _produtos[index];
            // Verifica se o produto deve ser destacado (valor > R$500,00)
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
                // Exibe rótulo "🔥 Destaque" se o valor for alto
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
        // Botão flutuante para adicionar um novo produto
        floatingActionButton: FloatingActionButton(
          onPressed: _adicionarProduto,
          tooltip: "Adicionar Produto",
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
