import 'package:flutter/material.dart';

class FlowBuilderScreen extends StatelessWidget {
  final String? flowId;
  const FlowBuilderScreen({super.key, this.flowId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(flowId == null ? 'Create Flow' : 'Edit Flow')),
      body: Center(child: Text('Flow Builder Placeholder (ID: ${flowId ?? 'New'})')),
    );
  }
}
