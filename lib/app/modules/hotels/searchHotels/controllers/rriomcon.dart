import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RoomController extends GetxController {
  var rooms = <Map<String, dynamic>>[].obs;

  RoomController() {
    addRoom(); // Add the first room by default
  }
  var travellers = 1.obs;
  void addRoom() {
    rooms.add({
      "adults": 1,
      "children": 0,
      "childAges": [],
    });
  }

  void removeRoom(int index) {
    rooms.removeAt(index);
  }

  void incrementAdults(int roomIndex) {
    rooms[roomIndex]["adults"]++;
    travellers.value++;
    rooms.refresh(); // Notify UI
  }

  void decrementAdults(int roomIndex) {
    if (rooms[roomIndex]["adults"] > 0) {
      rooms[roomIndex]["adults"]--;
      travellers.value--;
      rooms.refresh(); // Notify UI
    }
  }

  void incrementChildren(int roomIndex) {
    rooms[roomIndex]["children"]++;
    travellers.value++;
    rooms[roomIndex]["childAges"].add(0); // Add placeholder for child age
    print(rooms[roomIndex]["childAges"]);
    rooms.refresh(); // Notify UI
  }

  void decrementChildren(int roomIndex) {
    if (rooms[roomIndex]["children"] > 0) {
      rooms[roomIndex]["children"]--;
      travellers.value--;
      rooms[roomIndex]["childAges"].removeLast(); // Remove last child age
      rooms.refresh(); // Notify UI
    }
  }

  void incrementChildAge(int roomIndex, int childIndex) {
    rooms[roomIndex]["childAges"][childIndex]++;
    rooms.refresh(); // Notify UI
  }

  void decrementChildAge(int roomIndex, int childIndex) {
    if (rooms[roomIndex]["childAges"][childIndex] > 0) {
      rooms[roomIndex]["childAges"][childIndex]--;
      rooms.refresh(); // Notify UI
    }
  }

  void printRooms() {
    for (int i = 0; i < rooms.length; i++) {
      print('Room ${i + 1}: ${rooms[i]}');
    }
  }
}


//
// import 'package:get/get.dart';

// class RoomController extends GetxController {
//   // List of rooms, each containing adults and children's counts

//   var rooms = <Map<String, int>>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Add the first room by default
//     addRoom();
//   }

//   // Add a new room with default values
//   void addRoom() {
//     rooms.add({
//       "adults": 1,
//       "children": 0,
//     });
//   }

//   // Remove a room at a specific index
//   void removeRoom(int index) {
//     if (rooms.length > 1) {
//       rooms.removeAt(index);
//     }
//   }

//   // Increment adults in a specific room
//   void incrementAdults(int index) {
//     rooms[index]["adults"] = rooms[index]["adults"]! + 1;
//     rooms.refresh();
//   }

//   // Decrement adults in a specific room
//   void decrementAdults(int index) {
//     if (rooms[index]["adults"]! > 1) {
//       rooms[index]["adults"] = rooms[index]["adults"]! - 1;
//       rooms.refresh();
//     }
//   }

//   // Increment children in a specific room
//   void incrementChildren(int index) {
//     rooms[index]["children"] = rooms[index]["children"]! + 1;
//     rooms.refresh();
//   }

//   // Decrement children in a specific room
//   void decrementChildren(int index) {
//     if (rooms[index]["children"]! > 0) {
//       rooms[index]["children"] = rooms[index]["children"]! - 1;
//       rooms.refresh();
//     }
//   }


  
// }
