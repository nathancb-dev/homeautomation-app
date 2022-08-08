import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:por_de_sol/models/addItem_model.dart';

class AddItemScreen extends StatefulWidget {
  static const String route = 'addItem';
  final AddItemViewModel viewModel;
  const AddItemScreen(this.viewModel, {Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _descriptionController;
  TextEditingController _urlController;
  FocusNode _descriptionFocusNode;
  FocusNode _urlFocusNode;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _urlController = TextEditingController();
    _descriptionFocusNode = FocusNode();
    _urlFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _urlController.dispose();
    _descriptionFocusNode.dispose();
    _urlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              const Text('Insere alguma bosta ai'),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                onFieldSubmitted: (_) {
                  _descriptionFocusNode.requestFocus();
                },
                validator: _mandatoryValidator,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                onFieldSubmitted: (_) {
                  _urlFocusNode.requestFocus();
                },
                validator: _mandatoryValidator,
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Url'),
                validator: _mandatoryValidator,
              ),
              if (widget.viewModel.addingItem) ...const <Widget>[
                SizedBox(
                  height: 32,
                ),
                CircularProgressIndicator(),
              ]
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.viewModel.addingItem
            ? null
            : () async {
                await _addItem(context);
              },
        child: const Icon(Icons.save),
      ),
    );
  }

  String? _mandatoryValidator(String text) {
    return (text.isEmpty) ? 'Preenche sabosta' : null;
  }

  Future<void> _addItem(BuildContext context) async {
    try {
      if (_formKey.currentState.validate()) {
        final Item item = Item(
            name: _nameController.text,
            description: _descriptionController.text,
            url: _urlController.text);
        await widget.viewModel.addItem(item);
        Navigator.of(context).pop();
      }
    } on Exception {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: const Text('Falha ao adicionar Item'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }
}
