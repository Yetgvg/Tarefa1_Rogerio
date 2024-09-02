import 'package:flutter/material.dart';
import 'package:nome_do_projeto/main.dart';

// Tela de detalhes do produto
class DetalhesProduto extends StatelessWidget {
  final String produto;
  final TextEditingController _quantidadeController =
      TextEditingController(); // Controlador de texto

  DetalhesProduto({Key? key, required this.produto}) : super(key: key);

  // Função para validar o campo de quantidade
  void _validateAndSubmit(BuildContext context) {
    if (_quantidadeController.text.isEmpty ||
        int.tryParse(_quantidadeController.text) == null ||
        int.parse(_quantidadeController.text) <= 0) {
      // Se o campo estiver vazio ou não for um número válido ou menor ou igual a zero
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: const Text(
                'Por favor, insira uma quantidade válida maior que zero.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Se o campo estiver preenchido corretamente, navegar para a próxima página
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProximaPagina(
            quantidade: _quantidadeController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes - $produto'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50.0),
            const Text(
              'Informações do produto',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20.0),
                const Text(
                  'Produto:', // Label "Nome"
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
                const SizedBox(width: 8.0), // Espaço entre o label e o nome
                Text(
                  produto, // Nome enviado
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 20, 88, 144),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 20.0),
                SizedBox(
                  width: 370,
                  child: TextField(
                    controller: _quantidadeController, // Controlador de texto
                    keyboardType:
                        TextInputType.number, // Tipo de entrada numérico
                    decoration: InputDecoration(
                      hintText: 'Digite a quantidade',
                      prefixIcon: const Icon(Icons.shopping_cart_outlined),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
                height: 30.0), // Espaço entre o TextField e os botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Ação para voltar para a página anterior
                    Navigator.pop(context);
                  },
                  child: const Text('Voltar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _validateAndSubmit(
                        context); // Chama a função de validação ao enviar
                  },
                  child: const Text('Enviar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Página de exemplo para onde o botão "Enviar" navega
class ProximaPagina extends StatelessWidget {
  final String quantidade;

  const ProximaPagina({Key? key, required this.quantidade}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Próxima Página'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 120.0),
            ClipOval(
              // Usando ClipOval para deixar a imagem redonda
              child: const Image(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2owgtagk4Mo5wda4EOalu3DOhscqDf8onng&s',
                ),
                width: 200,
                height: 200,
                fit: BoxFit.cover, // Ajusta a imagem ao círculo
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Pedido Confirmado!!',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Ação para enviar dados e ir para a próxima página
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                  child: const Text('Voltar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
