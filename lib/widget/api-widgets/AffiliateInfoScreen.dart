import 'package:alxza/services/APIs/affiliate_service.dart';
import 'package:flutter/material.dart';
//import 'package:jawab_io/services/APIs/affiliate_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AffiliateInfoScreen extends StatefulWidget {
  @override
  _AffiliateInfoScreenState createState() => _AffiliateInfoScreenState();
}

class _AffiliateInfoScreenState extends State<AffiliateInfoScreen> {
  final AffiliateService affiliateService = AffiliateService();
  Map<String, dynamic> affiliateInfo = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getTokenAndFetchAffiliateInfo();
  }

  // Retrieve the token from SharedPreferences and fetch affiliate info
  Future<void> getTokenAndFetchAffiliateInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token'); // Retrieve the stored token

    if (token == null) {
      print('Token not found');
      return;
    }

    fetchAffiliateInfo(token); // Call the API method using the token
  }

  // Call the API method
  Future<void> fetchAffiliateInfo(String token) async {
    try {
      var data =
          await affiliateService.getAffiliateInfo(token); // Use the token
      setState(() {
        affiliateInfo = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print('Error fetching affiliate info: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Affiliate Info')),
      body: isLoading
          ? Center(child: CircularProgressIndicator()) // Loading indicator
          : affiliateInfo.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Earnings: ${affiliateInfo['earnings']}'),
                    Text('Total Earnings: ${affiliateInfo['total_earnings']}'),
                    Text(
                        'Total Withdrawal: ${affiliateInfo['total_withdrawal']}'),
                  ],
                )
              : Center(child: Text('No data available')), // Display data
    );
  }
}
