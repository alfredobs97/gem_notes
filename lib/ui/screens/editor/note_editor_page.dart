import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_notes/ui/bloc/notes/notes_cubit.dart';

class NoteEditorPage extends StatefulWidget {
  const NoteEditorPage({super.key});

  @override
  State<StatefulWidget> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Título'),
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Flexible(
            child: TextField(
              minLines: 2,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Detalles (Puedes usar markdown)',
              ),
              controller: _contentController,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            label: Text('Guardar', style: Theme.of(context).textTheme.bodyMedium),
            icon: const Icon(Icons.save),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.secondary,
              ),
              iconColor: WidgetStatePropertyAll(
                Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            onPressed: () {
              context.read<NotesCubit>().createNote(
                    title: _titleController.text,
                    content: _contentController.text,
                  );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
