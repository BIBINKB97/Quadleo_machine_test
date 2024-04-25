import 'package:flutter/material.dart'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:quadleo_test/model/api_model.dart'; 


class CustomerProvider extends ChangeNotifier {
  List<CustomerInfo> customers = []; // This List is to store customers Data

  // Function to fetch customer data from the API
  Future<void> fetchCustomers() async {
    // Define the URL to fetch customer data from
    final url = Uri.parse('https://customer.billerq.com/public/api/mobile/get-customer-details?page_length=10&page=2');
    
    try {
      // Sending a GET request to the URL and waiting for the response
      final response = await http.get(url);
      //  Checking the response status code
      if (response.statusCode == 200) {
        // Decoding the response body from JSON file
        final jsonData = json.decode(response.body);
        // Extracting the list of customer data from the decoded JSON data
        final List<dynamic> data = jsonData['data']['data'];
        // Converting each items to map 
        customers = data.map((item) => CustomerInfo.fromJson(item)).toList();
        // Notifying to the listners to change the state
        notifyListeners();
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load customers data');
      }
    } catch (error) {
      // Catch any errors that happens during the data fetching process 
      rethrow;
    }
  }
}
