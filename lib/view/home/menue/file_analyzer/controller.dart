import 'dart:convert';
import 'package:alxza/utilis/static_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:csv/csv.dart'; // To parse CSV files
import 'package:alxza/view/home/menue/ai_assistant_/controller.dart';
import 'package:docx_to_text/docx_to_text.dart'; // Requires docx_to_text package

class FileAnalyzerController extends GetxController {
  TextEditingController messageController = TextEditingController();
  List<Message> messageList = [];
  String fileContent = ''; // To store the extracted file content
  bool fileUploaded = false; // To track if a file has been uploaded

  final String apiUrl = '${StaticData.mainURL}ai-chat';

  Future<void> sendMessage() async {
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

    if (fileUploaded) {
      finalMessage += '\n\nFile Content:\n$fileContent';
      fileUploaded = false; // Reset file uploaded status after sending
      fileContent = ''; // Clear extracted file content
    }

    messageController.clear();
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

  Future<void> pickFile() async {
    try {
      // Pick a file with allowed extensions
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'doc', 'csv'],
      );

      if (result != null && result.files.isNotEmpty) {
        final filePath = result.files.single.path;

        if (filePath != null) {
          final fileExtension = filePath.split('.').last.toLowerCase();

          if (fileExtension == 'pdf') {
            await _extractPdfContent(filePath);
          } else if (fileExtension == 'csv') {
            await _extractCsvContent(filePath);
          }

          messageController.text = 'File uploaded';
          fileUploaded = true;
          update(['list']); // Update the UI
        }
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  Future<void> _extractPdfContent(String filePath) async {
    try {
      final PdfDocument document =
          PdfDocument(inputBytes: File(filePath).readAsBytesSync());
      final PdfTextExtractor textExtractor = PdfTextExtractor(document);
      fileContent = textExtractor.extractText();
    } catch (e) {
      print("Error extracting PDF content: $e");
      fileContent = "Error extracting PDF content.";
    }
  }

  Future<void> _extractCsvContent(String filePath) async {
    try {
      final csvFile = File(filePath);
      final csvString = await csvFile.readAsString();
      final csvData = CsvToListConverter().convert(csvString);
      fileContent = csvData.map((row) => row.join(', ')).join('\n');
    } catch (e) {
      print("Error extracting CSV content: $e");
      fileContent = "Error extracting CSV content.";
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}
