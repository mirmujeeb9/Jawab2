import 'package:alxza/services/APIs/chat_templates_api.dart';
import 'package:flutter/material.dart';

class ChatTemplatesWidget extends StatefulWidget {
  final String token;

  ChatTemplatesWidget({required this.token});

  @override
  _ChatTemplatesWidgetState createState() => _ChatTemplatesWidgetState();
}

class _ChatTemplatesWidgetState extends State<ChatTemplatesWidget> {
  late Future<List<dynamic>> chatTemplates;

  @override
  void initState() {
    super.initState();
    chatTemplates = ChatTemplatesApi.fetchChatTemplates(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Templates'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: chatTemplates,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> templatesList = snapshot.data!;

            return ListView.builder(
              itemCount: templatesList.length,
              itemBuilder: (context, index) {
                var template = templatesList[index];
                return Card(
                  child: ListTile(
                    title: Text(template['name']),
                    subtitle: Text('Role: ${template['role']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editChatTemplate(template);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _deleteChatTemplate(template['id']);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No chat templates found.'));
          }
        },
      ),
    );
  }

  Future<void> _deleteChatTemplate(String id) async {
    try {
      await ChatTemplatesApi.deleteChatTemplate(id, widget.token);
      setState(() {
        chatTemplates = ChatTemplatesApi.fetchChatTemplates(
            widget.token); // Reload after deletion
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error deleting template: $e')));
    }
  }

  Future<void> _editChatTemplate(Map<String, dynamic> template) async {
    // Show an edit form or pass the data to another screen for editing
    // You can implement the logic for updating the chat template here
  }
}
