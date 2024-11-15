import 'package:flutter/material.dart';

// Support Request Widget
class SupportRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Support Requests'),
    );
  }
}

// Ticket Messages Widget
class TicketMessagesWidget extends StatelessWidget {
  final String ticketId;

  TicketMessagesWidget({required this.ticketId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Messages for Ticket ID: $ticketId'),
    );
  }
}

// New Support Ticket Widget
class NewSupportTicketWidget extends StatefulWidget {
  @override
  _NewSupportTicketWidgetState createState() => _NewSupportTicketWidgetState();
}

class _NewSupportTicketWidgetState extends State<NewSupportTicketWidget> {
  final _formKey = GlobalKey<FormState>();
  String _priority = 'Low';
  String _category = 'General Inquiry';
  String _subject = '';
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          DropdownButtonFormField(
            value: _priority,
            onChanged: (String? value) {
              setState(() {
                _priority = value!;
              });
            },
            items: ['Low', 'Normal', 'High', 'Critical']
                .map((priority) => DropdownMenuItem(
                      child: Text(priority),
                      value: priority,
                    ))
                .toList(),
          ),
          DropdownButtonFormField(
            value: _category,
            onChanged: (String? value) {
              setState(() {
                _category = value!;
              });
            },
            items: [
              'General Inquiry',
              'Technical Issue',
              'Improvement Idea',
              'Feedback',
              'Other'
            ]
                .map((category) => DropdownMenuItem(
                      child: Text(category),
                      value: category,
                    ))
                .toList(),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Subject'),
            onChanged: (value) {
              setState(() {
                _subject = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Message'),
            onChanged: (value) {
              setState(() {
                _message = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Handle form submission logic
              }
            },
            child: Text('Submit Ticket'),
          ),
        ],
      ),
    );
  }
}

// Merged Parent Widget that renders all widgets
class SupportWidget extends StatefulWidget {
  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  String currentView = 'supportRequests';
  String? selectedTicketId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support System'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentView = 'supportRequests';
                  });
                },
                child: Text('Support Requests'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentView = 'newTicket';
                  });
                },
                child: Text('New Ticket'),
              ),
            ],
          ),
          Expanded(
            child: _buildCurrentView(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentView() {
    switch (currentView) {
      case 'supportRequests':
        return SupportRequestWidget();
      case 'ticketMessages':
        return TicketMessagesWidget(ticketId: selectedTicketId!);
      case 'newTicket':
        return NewSupportTicketWidget();
      default:
        return Container();
    }
  }
}
