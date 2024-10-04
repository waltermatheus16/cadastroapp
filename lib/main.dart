import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Pessoas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> pessoas = [];

  void adicionarPessoa(String nome) {
    setState(() {
      pessoas.add(nome);
    });
  }

  void removerPessoa(int index) {
    setState(() {
      pessoas.removeAt(index);
    });
  }

  void mostrarModalBottomSheet(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    adicionarPessoa(controller.text);
                    Navigator.pop(context);
                  }
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Pessoas'),
      ),
      body: ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(pessoas[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removerPessoa(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => mostrarModalBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
