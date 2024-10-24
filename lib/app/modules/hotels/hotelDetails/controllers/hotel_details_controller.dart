// import 'package:carousel_slider/carousel_options.dart' hide CarouselOptions;
import 'package:get/get.dart';

class HotelDetailsController extends GetxController {
  final List<String> items = [
    "https://t3.ftcdn.net/jpg/04/75/76/86/360_F_475768676_wmwEVWYWNlcqaMoj4khb4GF3F0f4f7TF.jpg",
    "https://t3.ftcdn.net/jpg/04/90/62/16/360_F_490621606_PUPDJBKkkrDo6Av2hPFiPjeVH9wmNWEO.jpg",
    "https://t3.ftcdn.net/jpg/02/94/36/40/360_F_294364016_iMm3YUSoVww9URDNueqhttZrBKoyUOk3.jpg",
    "https://media.istockphoto.com/id/1390233984/photo/modern-luxury-bedroom.jpg?s=612x612&w=0&k=20&c=po91poqYoQTbHUpO1LD1HcxCFZVpRG-loAMWZT7YRe4="
  ];
  var currentSlide = 0.obs;

  // void onPageChanged(int index, CarouselPageChangedReason reason) {
  //   currentSlide.value = index;
  // }

  List<String> detailsNames = ["Hotel", "3 Bedroom", "2 Bathroom", "4500 Sqft"];

  List<String> detailsIcon = [
    'assets/icons/hotelicon.png',
    'assets/icons/bedroom.png',
    'assets/icons/bathroom.png',
    'assets/icons/sqft.png'
  ];
  List<String> facilitiesIcons1 = [
    'assets/icons/Wifi.png',
    'assets/icons/Swimming.png',
    'assets/icons/Parking.png',
    'assets/icons/Resturant.png'
  ];
  List<String> facilitiesIcons2 = [
    'assets/icons/Elevator.png',
    'assets/icons/Gym Center.png',
    'assets/icons/meeting.png',
    'assets/icons/referesh.png'
  ];
  List<String> facilitiesNames1 = ['Wifi', 'Swimming', 'Parking', 'Resturant'];
  List<String> facilitiesNames2 = [
    'Elevator',
    'Gym Center',
    'Meeting Room',
    '24 hr'
  ];
}
