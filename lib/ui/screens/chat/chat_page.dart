import 'package:flutter/material.dart';
import 'package:gem_notes/data/services/ai_chat_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.aiChatService,
  });

  final AiChatService aiChatService;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final TextEditingController _textController;
  final List<(bool isUser, String content)> _messages = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    widget.aiChatService.clearHistory();
    _messages.clear();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat con IA'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: _messages.map((message) => _buildChatMessage(message)).toList(),
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
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

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: const InputDecoration.collapsed(hintText: "Escribe tu consulta"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String question) async {
    _textController.clear();
    setState(() {
      _messages.add((true, question));
    });

    setState(() {
      _messages.add((false, '...'));
    });

    String output = '';
    await for (final chunk in widget.aiChatService.askQuestion(question)) {
      output += chunk;
      setState(() {
        _messages[_messages.length - 1] = (false, output);
      });
    }
  }
}
