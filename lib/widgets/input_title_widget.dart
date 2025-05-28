import 'package:flutter/material.dart';

class InputTitleWidget extends StatefulWidget {
  final TextEditingController titleController;
  const InputTitleWidget({super.key, required this.titleController});

  @override
  State<InputTitleWidget> createState() => _InputTitleWidgetState();
}

class _InputTitleWidgetState extends State<InputTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
              controller: widget.titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: const TextStyle(color: Colors.deepPurple),
                hintText: 'Enter title',
                filled: true,
                fillColor: Colors.deepPurple[50],
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
                ),
              ),
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            );
  }
}