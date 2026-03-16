import 'package:flutter/material.dart';

/// Loading indicator widget with progress bar
class LoadingIndicator extends StatelessWidget {
  final double progress;

  const LoadingIndicator({super.key, this.progress = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            if (progress > 0) ...[
              const SizedBox(height: 16),
              Text(
                '${(progress * 100).toInt()}%',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            const SizedBox(height: 8),
            Text(
              'Loading...',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
