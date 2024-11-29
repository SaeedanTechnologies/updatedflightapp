import 'package:get/get.dart';

import '../modules/authentication/forgotPassword/bindings/forgot_password_binding.dart';
import '../modules/authentication/forgotPassword/views/forgot_password_view.dart';
import '../modules/authentication/signin/bindings/signin_binding.dart';
import '../modules/authentication/signin/views/signin_view.dart';
import '../modules/authentication/signup/bindings/signup_binding.dart';
import '../modules/authentication/signup/views/signup_view.dart';
import '../modules/cardInformation/bindings/card_information_binding.dart';
import '../modules/cardInformation/views/card_information_view.dart';
import '../modules/flight/addPassenger/bindings/add_passenger_binding.dart';
import '../modules/flight/addPassenger/views/add_passenger_view.dart';
import '../modules/flight/flightDetails/bindings/flight_details_binding.dart';
import '../modules/flight/flightDetails/views/flight_details_view.dart';
import '../modules/flight/personalInfo/bindings/personal_info_binding.dart';
import '../modules/flight/personalInfo/views/personal_info_view.dart';
import '../modules/flight/searchFlight/bindings/search_flight_binding.dart';
import '../modules/flight/searchFlight/views/search_flight_view.dart';
import '../modules/flight/searchFlightResults/bindings/search_flight_results_binding.dart';
import '../modules/flight/searchFlightResults/views/search_flight_results_view.dart';
import '../modules/flight/searchResult/bindings/search_result_binding.dart';
import '../modules/flight/searchResult/views/search_result_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hotels/HotelPayment/bindings/hotel_payment_binding.dart';
import '../modules/hotels/HotelPayment/views/hotel_payment_view.dart';
import '../modules/hotels/HotelReservationInformation/bindings/hotel_reservation_information_binding.dart';
import '../modules/hotels/HotelReservationInformation/views/hotel_reservation_information_view.dart';
import '../modules/hotels/hotelDetails/bindings/hotel_details_binding.dart';
import '../modules/hotels/hotelDetails/views/hotel_details_view.dart';
import '../modules/hotels/hotelImages/bindings/hotel_images_binding.dart';
import '../modules/hotels/hotelImages/views/hotel_images_view.dart';
import '../modules/hotels/hotelReservation/bindings/hotel_reservation_binding.dart';
import '../modules/hotels/hotelReservation/views/hotel_reservation_view.dart';
import '../modules/hotels/recentlyBooked/bindings/recently_booked_binding.dart';
import '../modules/hotels/recentlyBooked/views/recently_booked_view.dart';
import '../modules/hotels/searchHotels/bindings/search_hotels_binding.dart';
import '../modules/hotels/searchHotels/views/search_hotels_view.dart';
import '../modules/onBoarding/getstarted/bindings/getstarted_binding.dart';
import '../modules/onBoarding/getstarted/views/getstarted_view.dart';
import '../modules/onBoarding/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/onBoarding/splashScreen/views/splash_screen_view.dart';
import '../modules/reviewHotelBookingDetails/bindings/review_hotel_booking_details_binding.dart';
import '../modules/reviewHotelBookingDetails/views/review_hotel_booking_details_view.dart';
import '../modules/userProfile/bindings/user_profile_binding.dart';
import '../modules/userProfile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.GETSTARTED,
      page: () => const GetstartedView(),
      binding: GetstartedBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_INFO,
      page: () => const PersonalInfoView(),
      binding: PersonalInfoBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => const SearchResultView(),
      binding: SearchResultBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_FLIGHT,
      page: () => const SearchFlightView(),
      binding: SearchFlightBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_FLIGHT_RESULTS,
      page: () => const SearchFlightResultsView(),
      binding: SearchFlightResultsBinding(),
    ),
    GetPage(
      name: _Paths.FLIGHT_DETAILS,
      page: () => const FlightDetailsView(),
      binding: FlightDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PASSENGER,
      page: () => const AddPassengerView(),
      binding: AddPassengerBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_HOTELS,
      page: () => SearchHotelsView(),
      binding: SearchHotelsBinding(),
    ),
    GetPage(
      name: _Paths.RECENTLY_BOOKED,
      page: () => const RecentlyBookedView(),
      binding: RecentlyBookedBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_DETAILS,
      page: () => const HotelDetailsView(),
      binding: HotelDetailsBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_IMAGES,
      page: () => const HotelImagesView(),
      binding: HotelImagesBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_RESERVATION,
      page: () => const HotelReservationView(),
      binding: HotelReservationBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_RESERVATION_INFORMATION,
      page: () => const HotelReservationInformationView(),
      binding: HotelReservationInformationBinding(),
    ),
    GetPage(
      name: _Paths.HOTEL_PAYMENT,
      page: () => const HotelPaymentView(),
      binding: HotelPaymentBinding(),
    ),
    GetPage(
      name: _Paths.CARD_INFORMATION,
      page: () => const CardInformationView(),
      binding: CardInformationBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW_HOTEL_BOOKING_DETAILS,
      page: () => const ReviewHotelBookingDetailsView(),
      binding: ReviewHotelBookingDetailsBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
  ];
}
