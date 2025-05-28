import 'dart:convert';
import 'package:crud_mobile_app/models/item_model.dart';
import 'package:http/http.dart' as http;

class NoteService {
  static const baseUrl = 'https://crudcrud.com/api/2dee7e0a8b5d468da3dc58f88f0642ec/items';


  Future<List<Note>> fetchNotes() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Note.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load notes');
    }
  }

  Future<void> addNote(Note note) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(note.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add note');
    }
  }

  Future<void> updateNote(String id, Note note) async {
    final url = '$baseUrl/$id';
    final response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': note.title,
        'note': note.note,
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update note');
    }
  }

  Future<void> deleteNote(String id) async {
    final url = '$baseUrl/$id';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete note');
    }
  }
}
