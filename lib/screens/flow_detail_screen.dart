import 'package:flutter/material.dart';

class FlowDetailScreen extends StatelessWidget {
  final String? flowId;
  const FlowDetailScreen({super.key, this.flowId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flow Detail (ID: ${flowId ?? 'N/A'})')),
      body: Center(child: Text('Flow Detail Screen Content for ID: ${flowId ?? 'N/A'}')),
    );
  }
}
