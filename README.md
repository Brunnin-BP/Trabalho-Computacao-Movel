# Trabalho-Computacao-Movel
# Lista de Produtos em Dart - Parte 1

## Descrição do Projeto

Este projeto demonstra como criar e manipular uma lista de produtos utilizando a linguagem **Dart**. O programa mantém informações de produtos como ID, nome e valor, e exibe os produtos destacando aqueles com preço acima de R$500,00.

---

## Estrutura de Dados

Foi utilizada uma **classe `Produto`** para representar cada item. Cada objeto `Produto` possui os seguintes atributos:

- `id` (int): Identificador único do produto.
- `nome` (String): Nome do produto.
- `valor` (double): Preço do produto.

Os produtos são armazenados em uma **lista (`List<Produto>`)**, permitindo a iteração e filtragem dos itens.

Exemplo de inicialização da lista:
```dart
List<Produto> produtos = [
  Produto(id: 1, nome: 'Tv', valor: 1499.99),
  Produto(id: 2, nome: 'Teclado', valor: 149.50),
  Produto(id: 3, nome: 'Notebook', valor: 859.99),
  Produto(id: 4, nome: 'Fone de Ouvido', valor: 39.99),
  Produto(id: 5, nome: 'Celular', valor: 999.99),
];
```
---

## Lógica Implementada

O programa percorre a lista de produtos usando um loop for.

Para cada produto, verifica se o valor é maior que R$500,00.

Produtos com valor acima de R$500,00 são exibidos com a tag [ITEM EM DESTAQUE].

Produtos com valor igual ou abaixo de R$500,00 são exibidos normalmente.

---

# Lista de Produtos em Flutter - Parte 2
# 📱 Lista de Produtos em Destaque

Este projeto é um aplicativo Flutter simples que exibe uma lista de produtos, destacando aqueles cujo valor ultrapassa **R$ 500,00**.  
Ele demonstra conceitos básicos de **modelagem de dados**, **listas dinâmicas** e **renderização condicional** na interface.

---

## 🚀 Funcionalidades

- Exibe uma lista de produtos em formato de cartões (`Card`).
- Produtos com valor acima de **R$ 500,00** são destacados:
  - Fundo em **laranja claro**.
  - Ícone de **estrela**.
  - Indicador 🔥 **"Destaque"**.
- Produtos com valor abaixo ou igual a **R$ 500,00**:
  - Fundo **branco**.
  - Ícone de **carrinho de compras**.
  - Sem indicador de destaque.

---

## 🗂️ Estrutura de Dados

Foi criada uma classe `Produto` para representar os itens da lista:

```dart
class Produto {
  final int id;
  final String nome;
  final double valor;

  const Produto({required this.id, required this.nome, required this.valor});
}

A lista de produtos é definida de forma estática e constante:
const List<Produto> produtos = [
  Produto(id: 1, nome: 'Tv', valor: 1499.99),
  Produto(id: 2, nome: 'Teclado', valor: 149.50),
  Produto(id: 3, nome: 'Notebook', valor: 859.99),
  Produto(id: 4, nome: 'Fone de Ouvido', valor: 39.99),
  Produto(id: 5, nome: 'Celular', valor: 999.99),
];
```
---

🖥️ Exibição na Interface

A lista é renderizada com ListView.builder, que percorre os itens dinamicamente e cria os cartões de forma automática.
A lógica de destaque é aplicada em cada item:
```dart
final destaque = produto.valor > 500.00;

return Card(
  color: destaque ? Colors.orange[100] : Colors.white,
  child: ListTile(
    leading: Icon(
      destaque ? Icons.star : Icons.shopping_cart,
      color: destaque ? Colors.deepOrange : Colors.grey,
    ),
    title: Text(produto.nome),
    subtitle: Text('Valor: R\$${produto.valor.toStringAsFixed(2)}'),
    trailing: destaque
        ? const Text('🔥 Destaque', style: TextStyle(color: Colors.red))
        : null,
  ),
);
```
---

📷 Exemplo Visual
---
.
---



