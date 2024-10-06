import 'package:alxza/services/APIs/extensions_api.dart';
import 'package:flutter/material.dart';

class ExtensionsWidget extends StatefulWidget {
  final String token;

  ExtensionsWidget({required this.token});

  @override
  _ExtensionsWidgetState createState() => _ExtensionsWidgetState();
}

class _ExtensionsWidgetState extends State<ExtensionsWidget> {
  late Future<List<dynamic>> extensions;

  @override
  void initState() {
    super.initState();
    extensions = ExtensionsApi.fetchInstalledExtensions(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Installed Extensions'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: extensions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> extensionsList = snapshot.data!;

            return ListView.builder(
              itemCount: extensionsList.length,
              itemBuilder: (context, index) {
                var extension = extensionsList[index];
                return Card(
                  child: ListTile(
                    title: Text(extension['name']),
                    subtitle: Text('Version: ${extension['version']}'),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No installed extensions found.'));
          }
        },
      ),
    );
  }
}
