import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/payment_gat_ways_controller.dart';

class PaymentGatWaysView extends GetView<PaymentGatWaysController> {
  @override
  final PaymentGatWaysController controller =
      Get.put(PaymentGatWaysController());
  PaymentGatWaysView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Payment Gateways'),
          centerTitle: true,
        ),
        body: controller.gateways.isEmpty
            ? const Center(child: Text('No payment methods available'))
            : ListView.builder(
                itemCount: controller.gateways.length,
                itemBuilder: (context, index) {
                  final paymentMethod = controller.gateways[index];
                  return ListTile(
                    title: Text(paymentMethod.vendorTitle),
                    subtitle: Text(
                        'Buyer Reference ID: ${paymentMethod.buyerReferenceId}'),
                    trailing: Text('Vendor ID: ${paymentMethod.vendorId}'),
                    onTap: () {
                      // Add your onTap logic here
                    },
                  );
                },
              ));
  }
}
