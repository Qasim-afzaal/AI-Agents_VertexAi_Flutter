import 'dart:async';
import 'dart:convert' as convert;
import 'package:ai_agents_vertex_ai/config.dart';
import 'package:ai_agents_vertex_ai/functionality/app_state.dart';
import 'package:ai_agents_vertex_ai/ui/components/app_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({this.onExit, super.key});

  final VoidCallback? onExit;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool loading = false;
  final List<types.Message> _messages = [];
  final types.User _user = const types.User(id: 'user', firstName: 'You');
  final types.User _agent = const types.User(
      firstName: 'Khanh',
      id: 'agent',
      imageUrl: 'https://services.google.com/fh/files/misc/bunny.jpeg');

  @override
  void initState() {
    super.initState();
    _messages.add(types.TextMessage(
      id: const Uuid().v4(),
      author: _agent,
      text: 'Hey there! My name is Khanh. I\'m your assistant, let me know how I can help.',
    ));
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
    _sendMessageToAgent(message);
  }

  Future<String> askAgent(String name, String description, String question) async {
    var query = 'The photo is $name. $description. $question.';
    var endpoint = Uri.https(cloudRunHost, '/ask_gemini', {'query': query});
    var response = await http.get(endpoint);
    if (response.statusCode == 200) {
      return convert.utf8.decode(response.bodyBytes).replaceAll(RegExp(r'\*'), '');
    }
    return 'Sorry, I can\'t answer that.';
  }

  void _sendMessageToAgent(types.PartialText message) async {
    setState(() {
      loading = true;
    });

    var text = await askAgent(
      context.read<AppState>().metadata!.name,
      context.read<AppState>().metadata!.description,
      message.text,
    );

    final textMessage = types.TextMessage(
      author: _agent,
      id: const Uuid().v4(),
      text: text,
    );

    _addMessage(textMessage);

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var metadata = context.watch<AppState>().metadata;
    List<types.User> typingUsers = loading ? [_agent] : [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chat Assistant'),
        actions: widget.onExit != null
            ? [
                IconButton(
                  onPressed: widget.onExit,
                  icon: const Icon(FontAwesomeIcons.circleXmark, size: 28),
                ),
              ]
            : null,
      ),
      body: Column(
        children: [
          Expanded(
            child: Chat(
              typingIndicatorOptions: TypingIndicatorOptions(
                typingUsers: typingUsers,
              ),
              messages: _messages,
              onSendPressed: _handleSendPressed,
              showUserAvatars: true,
              showUserNames: true,
              user: _user,
              theme: DefaultChatTheme(
                backgroundColor: Colors.black,
                primaryColor: Colors.blueAccent,
                secondaryColor: Colors.grey.shade900,
                receivedMessageBodyTextStyle: TextStyle(color: Colors.white),
                sentMessageBodyTextStyle: TextStyle(color: Colors.white),
                userAvatarNameColors: [Colors.blueAccent],
                messageBorderRadius: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
