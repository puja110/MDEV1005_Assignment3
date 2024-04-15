import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                notes[index],
                style: const TextStyle(fontSize: 16),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNote() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newNote = '';
        return Dialog(
          insetPadding: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.all(16),
            width:
                MediaQuery.of(context).size.width * 0.8, // 80% of screen width
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add Note',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    newNote = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your note',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (newNote.isNotEmpty) {
                          notes.add(newNote);
                        }
                        Navigator.of(context).pop();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[300],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
