import 'dart:convert';
import 'package:flightbooking/app/storage/storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PaymentGatWaysController extends GetxController {
  var storage = GetStorage();
  //TODO: Implement PaymentGatWaysController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    var invoiceId = storage.read('newInvoiceReferenceId');
    fetchInvoiceData(invoiceId);
  }

  List<GatewayInfo> gateways = [];

  Future<List<GatewayInfo>> fetchInvoiceData(String invoiceId) async {
    const String baseUrl = "https://marketplace.beta.luxota.network/v1/gateway";
    final String url = "$baseUrl?referenceId=$invoiceId&lang=en&currency=158";

    try {
      print(StorageServices.to.getString('usertoken'));
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Bearer ${StorageServices.to.getString('usertoken')}',
          'Content-Type': 'application/json', // Optional but recommended
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print('responsee ${response.body}');

        // Accessing the "gateways" key and processing the nested structure
        if (data['gateways'] != null) {
          for (var gatewayGroup in data['gateways']) {
            if (gatewayGroup is List) {
              for (var gateway in gatewayGroup) {
                if (gateway != null) {
                  gateways.add(
                    GatewayInfo(
                      buyerReferenceId: gateway['buyerReferenceId'] ?? '',
                      vendorId: gateway['id'],
                      vendorTitle: gateway['vendor'],
                    ),
                  );
                }
              }
              print(gateways);
            }
          }
        }

        // // Accessing the "gateways" key and processing the nested list
        // for (var gatewayGroup in data['gateways']) {
        //   for (var gateway in gatewayGroup) {
        //     if (gateway != null) {
        //       gateways.add(
        //         GatewayInfo(
        //           buyerReferenceId: gateway['buyerReferenceId'] ?? '',
        //           vendorId: gateway['id'],
        //           vendorTitle: gateway['vendor'],
        //         ),
        //       );
        //     }
        //   }
        // }

        return gateways;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

class GatewayInfo {
  final String buyerReferenceId;
  final int vendorId;
  final String vendorTitle;

  GatewayInfo({
    required this.buyerReferenceId,
    required this.vendorId,
    required this.vendorTitle,
  });
}
