import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ActivityCard({
    super.key,
    required this.activity,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(activity.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Durasi: ${activity.duration}"),
            Text(activity.description),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}