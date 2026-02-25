import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../widgets/activity_card.dart';
import 'add_page.dart';
import 'edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> activities = [];

  void addActivity(Activity activity) {
    setState(() {
      activities.add(activity);
    });
  }

  void deleteActivity(int index) {
    setState(() {
      activities.removeAt(index);
    });
  }

  void updateActivity(int index, Activity newActivity) {
    setState(() {
      activities[index] = newActivity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Productivity"),
        centerTitle: true,
      ),
      body: activities.isEmpty
          ? const Center(child: Text("Belum ada data kegiatan"))
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return ActivityCard(
                  activity: activities[index],
                  onDelete: () => deleteActivity(index),
                  onEdit: () async {
                    final updated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPage(
                          activity: activities[index],
                        ),
                      ),
                    );

                    if (updated != null) {
                      updateActivity(index, updated);
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newActivity = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPage()),
          );

          if (newActivity != null) {
            addActivity(newActivity);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}