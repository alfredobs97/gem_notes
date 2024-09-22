import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/ui/widgets/confirm_delete_dialog.dart';

class NoteDetailPage extends StatelessWidget {
  final Note note;

  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: note.id,
          child: Text(
            note.title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showAdaptiveDialog(
              context: context,
              builder: (_) => ConfirmDeleteDialog(note: note),
            ),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                '${note.date.toLocal()}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              MarkdownBody(data: note.content),
            ],
          ),
        ),
      ),
    );
  }
}
