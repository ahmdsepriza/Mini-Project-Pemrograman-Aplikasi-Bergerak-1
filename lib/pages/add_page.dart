import 'package:flutter/material.dart';
import '../models/activity.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleController = TextEditingController();
  final durationController = TextEditingController();
  final descriptionController = TextEditingController();

  void saveData() {
    if (titleController.text.isEmpty ||
        durationController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      return;
    }

    final activity = Activity(
      title: titleController.text,
      duration: durationController.text,
      description: descriptionController.text,
    );

    Navigator.pop(context, activity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Kegiatan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Judul Kegiatan"),
            ),
            TextField(
              controller: durationController,
              decoration: const InputDecoration(labelText: "Durasi (Jam)"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveData,
              child: const Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}