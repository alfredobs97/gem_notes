import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //final GeminiService geminiService = GeminiService();
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [];

  /* void _handleSubmitted(String text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      _messages.insert(0, message);
    });

    String response = await geminiService.queryGemini(text);

    ChatMessage aiMessage = ChatMessage(
      text: response,
      isUser: false,
    );
    setState(() {
      _messages.insert(0, aiMessage);
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat con IA'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: _messages.map((message) => _buildChatMessage(message)).toList(),
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatMessage(ChatMessage message) {
    return ListTile(
      title: Text(message.text),
      leading: message.isUser ? null : Icon(Icons.computer),
      trailing: message.isUser ? Icon(Icons.person) : null,
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
                //onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(hintText: "Escribe tu consulta"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => {},// _handleSubmitted(_textController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  ChatMessage({required this.text, required this.isUser});

  final String text;
  final bool isUser;
}
