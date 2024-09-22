import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class EmptyStateChatWidget extends StatelessWidget {
  const EmptyStateChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Aquí podrás interactuar con la IA y hacer consultas sobre tus notas.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Powered by Gemini',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 8),
              const Icon(HugeIcons.strokeRoundedGoogleGemini, size: 24),
            ],
          )
        ],
      ),
    );
  }
}
