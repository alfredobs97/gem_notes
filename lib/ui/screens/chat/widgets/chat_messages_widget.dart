import 'package:flutter/material.dart';

class ChatMessagesWidget extends StatelessWidget {
  final List<(bool isUser, String content)> messages;

  const ChatMessagesWidget({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: messages.map((message) => _buildChatMessage(message)).toList(),
    );
  }

  Widget _buildChatMessage((bool isUser, String content) message) {
    final (isUser, content) = message;
    return ListTile(
      title: Text(content),
      leading: isUser ? null : const Icon(Icons.computer),
      trailing: isUser ? const Icon(Icons.person) : null,
    );
  }
}
