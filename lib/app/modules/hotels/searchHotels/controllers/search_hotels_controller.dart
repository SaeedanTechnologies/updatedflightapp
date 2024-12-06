import 'package:flightbooking/app/models/getResponseModel/hotels/getSearchedHotesResult.dart';
import 'package:flightbooking/app/repositories/configsRepo/configsRepo.dart';
import 'package:flightbooking/app/repositories/hotelsRepo/searchHotelsRepo.dart';
import 'package:get/get.dart';

class SearchHotelsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    rooms.add(RoomModel()); //to show initially one room created
  }

  Rx<DateTime?> startDate = Rx<DateTime?>(DateTime.now());
  Rx<DateTime?> endDate = Rx<DateTime?>(DateTime.now());

  var selectedCity = ''.obs;
  var selectedTravelers = 2.obs;
  var selectedAdults = 2.obs;
  var selectedChildren = 0.obs;
  var childAge = 0.obs;
  var selectedNationality = 'Select Nationality'.obs;
  var cityId = 0.obs;
  var countryId = 0.obs;

  String formatDate(DateTime? date) {
    if (date != null) {
      // Pad the month and day with a leading zero if less than 10
      String month = date.month.toString().padLeft(2, '0');
      String day = date.day.toString().padLeft(2, '0');
      return '${date.year}-$month-$day';
    } else {
      return 'Not selected';
    }
  }

  // Assuming this is the repository you use for making API calls related to hotels
  HotelsRepository hotelsRepository = HotelsRepository();
  ConfigRepository configRepository = ConfigRepository();
  GetSearchedHotelsResponse? getSearchedHotelsResponse;
  Future<dynamic> getSearchedHotelData() async {
    // Get configuration data, which includes searcher identity
    var data = await configRepository.configuration();

    // Send request to get search results
    var getSessionId = await hotelsRepository.getSessionIdForHotelSearch(
      cityCode: cityId.value, // City ID or name from your logic
      nationality: countryId.value, // Nationality ID or code
      checkinDate: startDate.value != null ? formatDate(startDate.value!) : '',
      checkOutDate: endDate.value != null ? formatDate(endDate.value!) : '',
      selectedAdults: selectedAdults.value.toString(),
      selectedChildren: selectedChildren.value.toString(),
      childAge: childAge.value.toString(),
      searchIdentity: data.searcherIdentity, // Use identity from config
    );
    print(getSessionId);

    var result = await hotelsRepository.getsearchHotelResults(
      sessionId: getSessionId.sessionId!,
    );

    return result;
  }

  //adult selection bottom sheet code by murtaza

  var childAges = <int>[].obs;

  // void incrementAdults() {
  //   adults.value++;
  // }

  // void decrementAdults() {
  //   if (adults.value > 1) {
  //     adults.value--;
  //     selectedTravelers.value--;
  //   }
  // }

//  /

//   void decrementChildren() {
//     if (children.value > 0) {
//       children.value--;
  //   childAges
  //       .removeLast(); // Remove the last child's age when children count decreases.
  // }
//   }

  void incrementChildAge(int index) {
    if (childAges[index] < 18) childAges[index]++;
  }

  void decrementChildAge(int index) {
    if (childAges[index] > 1) childAges[index]--;
  }

  //code for another room creation
  var rooms = <RoomModel>[].obs;

  void addRoom() {
    rooms.add(RoomModel());

    print("All Rooms:");
    for (int i = 0; i < rooms.length; i++) {
      print(
          "Room $i -> Adults: ${rooms[i].adults.value}, Children: ${rooms[i].children.value}, Child Ages: ${rooms[i].childAges}");
    }

    // print(rooms);
  }

  void removeRoom(int index) {
    if (rooms.length > 1) {
      rooms.removeAt(index);
    }
  }
}

class RoomModel {
  var adults = RxInt(2); // Default adults count is 2
  var children = RxInt(0); // Default children count is 0
  var childAges = RxList<int>(); // Default empty list for child ages

  void incrementAdults() => adults.value++;
  void decrementAdults() {
    if (adults.value > 1) adults.value--;
  }

  void incrementChildren() {
    children.value++;
    childAges.add(1); // Add a default age for the new child
  }

  void decrementChildren() {
    if (children.value > 0) {
      children.value--;
      childAges.removeLast();
    }
  }

  void incrementChildAge(int index) {
    print(" oo ${childAges[index]}");
    print("object   ${index}");
    print("bnbnbnbn ${childAges}");
    if (childAges[index] < 18) childAges[index]++;
  }

  void decrementChildAge(int index) {
    print(" hgvbnn ${childAges[index]}");
    if (childAges[index] > 1) childAges[index]--;
  }
}
