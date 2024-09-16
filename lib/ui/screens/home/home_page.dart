import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_notes/core/model/note.dart';
import 'package:gem_notes/ui/bloc/notes/notes_cubit.dart';
import 'package:gem_notes/ui/routes.dart';
import 'package:gem_notes/ui/screens/editor/note_editor_page.dart';
import 'package:gem_notes/ui/screens/home/widgets/empty_state_widget.dart';
import 'package:gem_notes/ui/screens/home/widgets/note_list_widget.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My notes'),
        actions: [
          IconButton(
            icon: const Icon(HugeIcons.strokeRoundedGoogleGemini),
            onPressed: () => Navigator.of(context).pushNamed(Routes.chat.name),
          ),
        ],
      ),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) => switch (state) {
          NotesLoading() => const Center(child: CircularProgressIndicator.adaptive()),
          NotesReady() => state.notes.isEmpty
              ? const Center(child: EmptyStateWidget())
              : ListView.builder(
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    return NoteListWidget(note: state.notes[index]);
                  },
                ),
          NotesError() => ErrorWidget(state.error),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          WoltModalSheet.show(
            context: context,
            pageListBuilder: (bottomSheetContext) => [
              WoltModalSheetPage(
                enableDrag: true,
                forceMaxHeight: true,
                leadingNavBarWidget: AppBar(
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  actions: const [
                    CloseButton(),
                  ],
                ),
                child: const NoteEditorPage(),
              )
            ],
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
