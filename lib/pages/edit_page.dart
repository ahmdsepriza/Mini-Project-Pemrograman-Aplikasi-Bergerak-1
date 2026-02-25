import 'package:flutter/material.dart';
import '../models/activity.dart';

class EditPage extends StatefulWidget {
  final Activity activity;

  const EditPage({super.key, required this.activity});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late TextEditingController titleController;
  late TextEditingController durationController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.activity.title);
    durationController = TextEditingController(text: widget.activity.duration);
    descriptionController =
        TextEditingController(text: widget.activity.description);
  }

  void updateData() {
    final updated = Activity(
      title: titleController.text,
      duration: durationController.text,
      description: descriptionController.text,
    );

    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Kegiatan")),
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
              onPressed: updateData,
              child: const Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}