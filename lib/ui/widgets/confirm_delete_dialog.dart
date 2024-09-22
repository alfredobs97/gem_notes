import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/ui/bloc/notes/notes_cubit.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final Note note;

  const ConfirmDeleteDialog({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar nota'),
      content: Text('¿Estás seguro de que quieres eliminar ${note.title}?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            context.read<NotesCubit>().deleteNote(note.id);
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.errorContainer
          ),
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
