import 'dart:convert';

import 'package:brand_assignment/ChargingApp/model/charging_model.dart';
import 'package:http/http.dart' as http;

class ChargingStationService {
 late List<ChargingModel> chargingModel = [];

  final String baseUrl =
      'https://mocki.io/v1/d86221e4-6755-4666-96ba-bf88b61a3cdc';
  Future<List<ChargingModel>> fetchChargingStations() async {
    final response = await http.get(Uri.parse('baseUrl'));
    var data = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map index in data) {
        String id = index['id'];
        String evsName = index['evsname'];
        String status = index['status'];
        String connectors = index['connectors'];
        return data;
      }
      return data;
    } else {
      throw Exception('Failed to load charging stations');
    }
  }
}
