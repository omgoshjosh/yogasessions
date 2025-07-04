import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yogasessions/services/seeding_service.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Correctly instantiate the service with necessary dependencies
    final SeedingService seedingService = SeedingService(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
      debug: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Show a confirmation dialog before seeding
            final bool? shouldSeed = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirm Seeding'),
                  content: const Text(
                      'This will delete existing data and seed the database. Are you sure?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    TextButton(
                      child: const Text('Seed'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                );
              },
            );

            // Proceed if the user confirmed
            if (shouldSeed == true) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Seeding database...')),
                );
              }
              try {
                // Use the service to seed data
                await seedingService.seedData();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Database seeding complete!')),
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error seeding database: $e')),
                  );
                }
              }
            }
          },
          child: const Text('Seed Database'),
        ),
      ),
    );
  }
}