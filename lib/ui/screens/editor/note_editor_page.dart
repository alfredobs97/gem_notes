import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gem_notes/core/model/note.dart';
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
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Flexible(
            child: TextField(
              minLines: 2,
              maxLines: null,
              decoration: const InputDecoration(
                labelText: 'Note (markdown available)',
              ),
              controller: _contentController,
            ),
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            icon: const Icon(Icons.save),
            onPressed: () {
              final note = Note(
                title: _titleController.text,
                content: _contentController.text,
                date: DateTime.now(),
              );
              context.read<NotesCubit>().createNote(note);
              Navigator.pop(context);
            },
            label: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
