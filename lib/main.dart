import 'package:flutter/material.dart';
import 'screens/produtos.dart';

void main() {
  runApp(MyApp());
}

// Classe que inicia o aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // define Material Design
    return MaterialApp(
      title: 'Sample Input',
      home: Forms(), // inicia página principal
    );
  }
}

// Classe que instancia classe responsável por gerenciar estados
class Forms extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Forms> {
  final TextEditingController _usuario = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  Color textColor = Colors.black;
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;

  bool envio = false;

  // Função para validar campos
  void _validateAndSubmit(BuildContext context) {
    if (_usuario.text.isEmpty || _senha.text.isEmpty) {
      // Se algum dos campos estiver vazio, mostrar um diálogo de aviso
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: const Text(
                'Por favor, preencha todos os campos antes de enviar.'),
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
      // Se ambos os campos estão preenchidos, navega para a próxima página
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => resposta(
            usuario: _usuario.text,
            senha: _senha.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Barra do aplicativo
        title: const Text('Felipes Testes'),
      ),
      body: SingleChildScrollView(
        // Adiciona rolagem para evitar overflow
        child: Align(
          // Corpo do aplicativo
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
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _usuario,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Login',
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _senha,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    prefixIcon: const Icon(Icons.lock),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  height: 10.0), // Um retângulo contendo widget de entrada
              const SizedBox(height: 30.0),
              SizedBox(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _validateAndSubmit(
                            context); // Chama a função de validação ao enviar
                      },
                      child: const Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
