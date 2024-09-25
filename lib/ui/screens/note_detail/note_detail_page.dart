import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/ui/bloc/notes/notes_cubit.dart';
import 'package:gem_notes/ui/widgets/confirm_delete_dialog.dart';

class NoteDetailPage extends StatefulWidget {
  final Note note;

  const NoteDetailPage({super.key, required this.note});

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  late Note _tempNote;
  bool _isEditMode = false;
  final _editController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tempNote = widget.note;
  }

  @override
  void dispose() {
    _editController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.note.id,
          child: Text(
            widget.note.title,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isEditMode = !_isEditMode;
                _editController.text = widget.note.content;
              });
            },
            icon: Icon(_isEditMode ? Icons.cancel_outlined : Icons.edit),
          ),
          IconButton(
            onPressed: () => showAdaptiveDialog(
              context: context,
              builder: (_) => ConfirmDeleteDialog(note: widget.note),
            ),
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 8),
              if (_isEditMode)
                TextField(
                  controller: _editController,
                  minLines: 4,
                  maxLines: 10,
                )
              else
                MarkdownBody(data: _tempNote.content),
              if (_isEditMode)
                ...[
                  const SizedBox(height: 8),
                  IconButton.filled(
                    onPressed: () {
                      _tempNote = _tempNote.copyWith(content: _editController.text);
                      _isEditMode = false;
                      context.read<NotesCubit>().editNote(id: _tempNote.id, newContent: _tempNote.content);
                      setState(() {});
                    },
                    icon: const Icon(Icons.save_as),
                  )
                ]
            ],
          ),
        ),
      ),
    );
  }
}
