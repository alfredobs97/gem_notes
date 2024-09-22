import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.edit_note, size: 72),
        const SizedBox(
          height: 16,
        ),
        Text(
          'No tienes notas...',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(height: 8),
        Text(
          'añade tu primera nota y empieza a interactuar con la IA',
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
