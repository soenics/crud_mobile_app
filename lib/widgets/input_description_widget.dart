import 'package:flutter/material.dart';

class TextDescription extends StatefulWidget {
  final TextEditingController noteController;
  const TextDescription({super.key, required this.noteController});

  @override
  State<TextDescription> createState() => _TextDescriptionState();
}

class _TextDescriptionState extends State<TextDescription> {
  @override
  Widget build(BuildContext context) {
    return  TextField(
                controller: widget.noteController,
                maxLines: 4, // For multi-line input
                decoration: InputDecoration(
                  labelText: 'Note',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                  hintText: 'Enter note description...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  filled: true,
                  fillColor: Colors.deepPurple[50],
                ),
                style: TextStyle(fontSize: 16, color: Colors.black87),
              );
  }
}