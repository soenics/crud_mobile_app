import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteDetail extends StatelessWidget {
  final String noteTitle;
  final String noteDescription;
  const NoteDetail({super.key, required this.noteTitle, required this.noteDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0EBE3),
      appBar: AppBar(
        title: const Text("Note Details"),
        backgroundColor: const Color(0xffF0EBE3),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/icons/note_title_icon.png",width: 30,height: 30,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        noteTitle,
                        style: GoogleFonts.merriweather(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[100],
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    noteDescription,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
