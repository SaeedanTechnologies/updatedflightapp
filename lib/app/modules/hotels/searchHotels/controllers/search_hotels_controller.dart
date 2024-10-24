import 'package:flightbooking/app/repositories/hotelsRepo/searchHotelsRepo.dart';
import 'package:get/get.dart';

class SearchHotelsController extends GetxController {
  List <String> tabs=['All Hotel','Recommended','Tranding','High Level Hotel'];
  var selectedTab=0.obs;
  HotelsRepository hotelsRepository=HotelsRepository();

}
