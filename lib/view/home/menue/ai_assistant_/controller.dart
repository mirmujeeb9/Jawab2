import 'dart:convert';
import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class AiAssistentController extends GetxController {
  TextEditingController messageController = TextEditingController();
  List<Message> messageList = [];
  String pdfContent = ''; // To store the extracted PDF content
  bool pdfUploaded = false; // To track if a PDF has been uploaded

  final String apiUrl = '${StaticData.mainURL}ai-chat';

  Future<void> sendMessage() async {
    // Combine user input with PDF content if a PDF has been uploaded
    final userMessage = messageController.text.trim();

    String finalMessage = userMessage;

    if (finalMessage.isEmpty) return;

    // Add the user's message to the list and clear the input field
    messageList.add(Message(
      toId: 'assistant',
      msg: finalMessage,
      read: 'false',
      fromId: 'user',
      sent: DateTime.now().toString(),
      type: Type.text,
    ));

    if (pdfUploaded) {
      finalMessage +=
          '\n\nPDF Content:\n$pdfContent'; // Combine with PDF content
      pdfUploaded = false; // Reset PDF uploaded status after sending
      pdfContent = ''; // Clear extracted PDF content
    }

    messageController.clear(); // Clear the input field after sending
    update(['list']);

    // Send message to the backend
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': finalMessage}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final reply = responseData['reply'];

        messageList.add(Message(
          toId: 'user',
          msg: reply,
          read: 'false',
          fromId: 'assistant',
          sent: DateTime.now().toString(),
          type: Type.text,
        ));
      } else {
        print('Server error: ${response.body}');
        messageList.add(Message(
          toId: 'user',
          msg: 'Error: Unable to get a response.',
          read: 'false',
          fromId: 'assistant',
          sent: DateTime.now().toString(),
          type: Type.text,
        ));
      }
    } catch (e) {
      print('Exception: $e');
      messageList.add(Message(
        toId: 'user',
        msg: 'Error: Check your connection.',
        read: 'false',
        fromId: 'assistant',
        sent: DateTime.now().toString(),
        type: Type.text,
      ));
    }

    update(['list']);
  }

  Future<void> pickPDF() async {
    try {
      // Pick a PDF file
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.single.path;

        // Read the PDF document
        if (filePath != null) {
          // Load the PDF document
          final PdfDocument document =
              PdfDocument(inputBytes: File(filePath).readAsBytesSync());

          // Create a PdfTextExtractor instance
          final PdfTextExtractor textExtractor = PdfTextExtractor(document);
          pdfContent =
              textExtractor.extractText(); // Store the extracted PDF content

          // Update the input field to show "PDF uploaded"
          messageController.text =
              'PDF uploaded'; // Show indication in the text field
          pdfUploaded = true; // Set the PDF uploaded flag
          update(['list']); // Update the UI
        }
      }
    } catch (e) {
      print("Error picking PDF: $e");
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class Message {
  String? toId;
  String? msg;
  String? read;
  String? fromId;
  String? sent;
  Type? type;

  Message({
    this.toId,
    this.msg,
    this.read,
    this.fromId,
    this.sent,
    required this.type,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      toId: json['toId'],
      msg: json['msg'],
      read: json['read'],
      fromId: json['fromId'],
      sent: json['sent'],
      type: getTypeFromString(json['type']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'toId': toId,
      'msg': msg,
      'read': read,
      'fromId': fromId,
      'sent': sent,
      'type': type.toString().split('.').last,
    };
  }

  static Type getTypeFromString(String typeString) {
    switch (typeString) {
      case 'text':
        return Type.text;
      case 'image':
        return Type.text; // You might want to handle image types differently
      default:
        return Type.text;
    }
  }
}

enum Type {
  text,
  pdf,
}
