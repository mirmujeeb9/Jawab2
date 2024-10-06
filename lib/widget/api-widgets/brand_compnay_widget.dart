import 'package:alxza/services/APIs/brand_api.dart';
import 'package:flutter/material.dart';

class CompaniesWidget extends StatefulWidget {
  final String token;

  CompaniesWidget({required this.token});

  @override
  _CompaniesWidgetState createState() => _CompaniesWidgetState();
}

class _CompaniesWidgetState extends State<CompaniesWidget> {
  late Future<List<dynamic>> companies;

  @override
  void initState() {
    super.initState();
    companies = BrandApi.fetchCompanies(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: companies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> companiesList = snapshot.data!;

            return ListView.builder(
              itemCount: companiesList.length,
              itemBuilder: (context, index) {
                var company = companiesList[index];
                return Card(
                  child: ListTile(
                    title: Text(company['name']),
                    subtitle: Text('Products: ${company['products'].length}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteCompany(company['id']);
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No companies found.'));
          }
        },
      ),
    );
  }

  Future<void> _deleteCompany(String id) async {
    try {
      await BrandApi.deleteCompany(id, widget.token);
      setState(() {
        companies = BrandApi.fetchCompanies(
            widget.token); // Reload the list after delete
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error deleting company: $e')));
    }
  }
}
