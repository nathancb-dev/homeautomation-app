import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:por_de_sol/models/editItem_model.dart';

class EditItemScreen extends StatefulWidget {
  static const String route = 'editItem';
  final Item item;
  final EditItemViewModel viewModel;

  const EditItemScreen(this.item, this.viewModel, {Key? key}) : super(key: key);

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _descriptionController;
  TextEditingController _urlController;
  FocusNode _descriptionFocusNode;
  FocusNode _urlFocusNode;

  @override
  void initState() {
    final Item item = widget.item;
    _nameController = TextEditingController(text: item.name);
    _descriptionController = TextEditingController(text: item.description);
    _urlController = TextEditingController(text: item.url);
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
        title: const Text('HomeEdit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              const Text('Altera sabosta ai seu ruim'),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                onFieldSubmitted: (_) {
                  _descriptionFocusNode.requestFocus();
                },
                validator: _mandatoryValidator,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                onFieldSubmitted: (_) {
                  _urlFocusNode.requestFocus();
                },
                validator: _mandatoryValidator,
              ),
              TextFormField(
                controller: _urlController,
                decoration: const InputDecoration(labelText: 'URL'),
                validator: _mandatoryValidator,
              ),
              if (widget.viewModel.editingItem) ...const <Widget>[
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
        onPressed: widget.viewModel.editingItem
            ? null
            : () async {
                await _editItem(context);
              },
        child: const Icon(Icons.save),
      ),
    );
  }

  String? _mandatoryValidator(String text) {
    return (text.isEmpty) ? 'Obrigatorio' : null;
  }

  Future<void> _editItem(BuildContext context) async {
    try {
      if (_formKey.currentState.validate()) {
        final Item item = Item(
            id: widget.item.id,
            name: _nameController.text,
            description: _descriptionController.text,
            url: _urlController.text);
        await widget.viewModel.editItem(item);
        Navigator.of(context).pop(true);
      }
    } on Exception {
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: const Text('Erro ao editar item'),
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
