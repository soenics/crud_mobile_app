import 'package:crud_mobile_app/models/item_model.dart';
import 'package:crud_mobile_app/provider/notes_provider.dart';
import 'package:crud_mobile_app/screen/note_detail.dart';
import 'package:crud_mobile_app/widgets/input_description_widget.dart';
import 'package:crud_mobile_app/widgets/input_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  

Future<void> _showAddNoteDialog() async {
    _titleController.clear();
    _noteController.clear();

showDialog(
  context: context,
  builder: (context) {
    return AlertDialog(
      title: Text(
        "Add Note",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
          fontSize: 20,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputTitleWidget(titleController: _titleController,),
            SizedBox(height: 16),
            TextDescription(noteController: _noteController,),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            final title = _titleController.text;
            final note = _noteController.text;
            if (title.isNotEmpty && note.isNotEmpty) {
              final newNote = Note(title: title, note: note);
              await ref.read(noteServiceProvider).addNote(newNote);
              ref.invalidate(noteListProvider); // Refresh list
            }
            _titleController.clear();
            _noteController.clear();
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
      ],
    );
  },
);

  }

  Future<void> _showEditNoteDialog(Note note) async {
    _titleController.text = note.title;
    _noteController.text = note.note;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Note"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             InputTitleWidget(titleController: _titleController,),
              SizedBox(height: 20),
              TextDescription(noteController: _noteController,),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                final updatedTitle = _titleController.text;
                final updatedContent = _noteController.text;
                if (updatedTitle.isNotEmpty && updatedContent.isNotEmpty) {
                  final updatedNote = Note(
                    title: updatedTitle,
                    note: updatedContent,
                  );
                  await ref
                      .read(noteServiceProvider)
                      .updateNote(note.id!, updatedNote);
                  ref.invalidate(noteListProvider);
                }
                _titleController.clear();
                _noteController.clear();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteListAsync = ref.watch(noteListProvider);

    return Scaffold(
      backgroundColor:  Color(0xffF0EBE3),
      appBar: AppBar(title: Text("Note App",),backgroundColor: Color(0xffF0EBE3),),
      body: noteListAsync.when(
        data:
            (notes) => Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/note_book.jpg',
                      width: 400,
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return Slidable(
                        endActionPane: ActionPane(
                          motion: StretchMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) => _showEditNoteDialog(note),
                              backgroundColor: Color.fromARGB(255, 149,117,205,),
                              icon: Icons.edit,
                            ),
                            SlidableAction(
                              onPressed: (context) async {
                                await ref
                                    .read(noteServiceProvider)
                                    .deleteNote(note.id!);
                                ref.invalidate(noteListProvider);
                              },
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: (){    
                             Get.to(()=>NoteDetail(noteTitle: note.title,noteDescription: note.note,),transition: Transition.downToUp,duration: Duration(seconds: 1));   
                          },
                          child: Card(
                            color: Colors.deepPurple[100],
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(note.title),
                              subtitle: Text(note.note,maxLines: 1,overflow: TextOverflow.ellipsis,),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddNoteDialog,
        child: Image.asset("assets/icons/notes.png", width: 30, height: 30),
      ),
    );
  }
}
