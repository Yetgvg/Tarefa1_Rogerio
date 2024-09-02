import 'package:flutter/material.dart';
import 'package:nome_do_projeto/screens/infoproduto.dart';

class resposta extends StatelessWidget {
  final String usuario;
  final String senha;
  const resposta({Key? key, required this.usuario, required this.senha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> produtos = ['Produto 1', 'Produto 2', 'Produto 3'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo - $usuario'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20.0),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // Definindo largura da caixa
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // muda a posição da sombra
                  ),
                ],
              ),
              child: Column(
                children: produtos.map((produto) {
                  return ListTile(
                    title: Text(produto),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navegar para a próxima página
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetalhesProduto(produto: produto),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
