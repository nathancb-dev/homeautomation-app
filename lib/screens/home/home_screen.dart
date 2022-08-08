import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:por_de_sol/models/home_model.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen(this.viewModel, {Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadInitialHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder<HomeScreen>(
        future: widget.viewModel.HomeFuture,
        builder: (_, AsyncSnapshot<Home> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                            'Oops, tivemos um problema ao carregar seus widgets, se vira aí, abre um chamado.'),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () async {
                            await widget.viewModel.refreshHome();
                          },
                          child: const Text('Tentar novamente.'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              final List<Item> items = snapshot.data?.items ?? <Item>[];
              if (items.isEmpty) {
                return const Center(
                  child: Text('Você não tem widgets, bota algo mermão.'),
                );
              }
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, int index) {
                  final Item item = items[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(item.name),
                                Text(item.description),
                                GestureDetector(
                                  onTap: () => launch(item.url),
                                  child: Text(
                                    item.url,
                                    style: const TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _editItem(item);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _deleteItem(item);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            default:
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: const <Widget>[
                      Text('Carregando os quadradinho'),
                      SizedBox(
                        height: 32,
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  Future<void> _deleteItem(Item item) async {
    try {
      await widget.viewModel.deleteItem(item);
    } on Exception {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Falha ao tentar deletar item'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'))
          ],
        ),
      );
    }
  }

  Future<void> _addItem(BuildContext context) async {
    final Object? addedItem =
        await Navigator.of(context).pushNamed(AddItemPage.route);
    if ((addedItem as bool) ?? false) {
      await widget.viewModel.refreshHome();
    }
  }

  Future<void> _editItem(Item item) async {
    final Object? addedItem = await Navigator.of(context)
        .pushNamed(EditItemPage.route, arguments: item);
    if ((addedItem as bool) ?? false) {
      await widget.viewModel.refreshHome();
    }
  }
}
