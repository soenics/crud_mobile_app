import 'package:crud_mobile_app/models/item_model.dart';
import 'package:crud_mobile_app/service/api_service.dart';
import 'package:riverpod/riverpod.dart';


final noteServiceProvider = Provider((ref) => NoteService());


final noteListProvider = FutureProvider<List<Note>>((ref) {
  return ref.watch(noteServiceProvider).fetchNotes();
});
