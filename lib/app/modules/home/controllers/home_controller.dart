import 'package:flightbooking/app/repositories/flightsRepo/flightsRepo.dart';
import 'package:flightbooking/app/repositories/hotelsRepo/searchHotelsRepo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  FlightsRepository flightsRepository = FlightsRepository();
  HotelsRepository hotelsRepository = HotelsRepository();
  Future getpopularFlights() async {
    return flightsRepository.popularFlights();
  }
  Future getPopularDestinations() async {
    return hotelsRepository.getPopularDestinations();
  }
}
