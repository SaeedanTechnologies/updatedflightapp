// To parse this JSON data, do
//
//     final getConfigurationsModel = getConfigurationsModelFromJson(jsonString);

import 'dart:convert';

GetConfigurationsModel getConfigurationsModelFromJson(String str) => GetConfigurationsModel.fromJson(json.decode(str));

String getConfigurationsModelToJson(GetConfigurationsModel data) => json.encode(data.toJson());

class GetConfigurationsModel {
    final String fileCenterDomain;
    final String logDomain;
    final String appEnv;
    final String googlerecaptchaSiteKey;
    final String searcherIdentity;
    final int nodeId;
    final String searchBtnColor;
    final String homepageBannerImage;
    final String homepageBannerTitle;
    final String home1;
    final String home2;
    final String home3;
    final String flight;
    final String hotel;
    final String package;
    final String visa;
    final String event;
    final String tour;
    final String flightResult;
    final String hotelResult;
    final String packageResult;
    final String visaResult;
    final String eventResult;
    final String tourResult;
    final String loadingPage;
    final String flightResultAd;
    final String hotelResultAdTop;
    final String hotelResultAdBottom;
    final String menuColor;
    final String hotelSearchGif;
    final String flightSearchGif;
    final String packageSearchGif;
    final String eventSearchGif;
    final String tourSearchGif;
    final String visaSearchGif;
    final String twitterAccount;
    final String youtubeAccount;
    final String instegramAccount;
    final String linkedinAccount;
    final String facebookAccount;
    final String hotelProfileAd;
    final String filterApplyBtn;
    final String filterResetBtn;
    final String filterHeaders;
    final String filterText;
    final String flightResultTimes;
    final String resultText;
    final String resultPrice;
    final String baggageBtn;
    final String ruleBtn;
    final String breakDownBtn;
    final String bookNowBtn;
    final String googleAnalytics;
    final String customSectionOfFooter;
    final String headerLogo;
    final String footerLogo;
    final String voucherLogoBackground;
    final String headerLogoHeight;
    final String voucherLogo;
    final String home1Video;
    final String flightVideo;
    final String hotelVideo;
    final String visaVideo;
    final String packageVideo;
    final String tourVideo;
    final String eventVideo;
    final String ticketBanner;
    final String ticketQr;
    final String suggestedVisaBackground;
    final String suggestedPackageBackground;
    final String suggestedEventBackground;
    final String suggestedTourBackground;
    final String suggestedBlogBackground;
    final String homePopularRouteBackground;
    final String flightPopularRouteBackground;
    final String hotelTopDestinationsBackground;
    final String navColorInSlideShow;
    final String ewalletGatewayChargingInstruction;
    final String homeMenuSelected;
    final String themeMobileAppTitle;
    final String themeMobileAppTitleColor;
    final String homeMenuDefault;
    final String navLineColor;
    final String navLineDefaultColor;
    final String popularRouteTitleColor;
    final dynamic suggestedVisaTitle;
    final String suggestedVisaTitleColor;
    final String suggestedTourTitleColor;
    final String suggestedPackageTitleColor;
    final String travelInspirationsTitleColor;
    final String travelInspirationsTitle;
    final String suggestedEventTitleColor;
    final String topDestinationColor;
    final String suggestionTitleColor;
    final String featureBackgroundColor;
    final String featureIconBackgroundColor;
    final String suggestionCaptionColor;
    final String captionItemTimeColor;
    final String captionDescriptionColor;
    final String captionTitleColor;
    final dynamic captionDelimiterColor;
    final String captionDelimiter;
    final String featureBoxIcon1;
    final String featureBoxIcon2;
    final dynamic featureBoxIcon3;
    final dynamic featureBoxIcon4;
    final String featureBoxIcon5;
    final String popularRouteItem;
    final String popularRouteItemContent;
    final String popularRouteItemTitleSign;
    final String popularRouteItemTitleSignColor;
    final String nodeInformation;
    final String featureDelimiter;
    final String popularRouteBorderBottomActive;
    final String popularRouteBorderBottom;
    final String availableRoomsNoticeBackground;
    final String availableRoomsNoticeColor;
    final dynamic popularRouteHeaderText;
    final String popularRouteHeaderTextColor;
    final String searchResultCheapestFlightsHeaderColor;
    final String searchResultCheapestFlightsHeaderTextColor;
    final String searchResultCheapestFlightsHeaderBackgroundColor;
    final String popularRouteContentTextColor;
    final String popularRouteItemTitle;
    final String displayTheLastSectionOnThePage;
    final String packageTitleColor;
    final String packageSubtitleColor;
    final String visaTitleColor;
    final String visaSubtitleColor;
    final String andVerLatest;
    final String andVerAvailable;
    final String homeMenuDefaultMobileView;
    final String homeMenuSelectedMobileView;
    final String menuColorMobileView;
    final String hamburgerMenuColor;
    final String home1MobileView;
    final String appPrimaryColor;
    final String appAccentColor;
    final String primaryColor;
    final String secondColor;
    final dynamic test;
    final String test1;
    final String secondaryColorDesk;
    final String primaryColorDesk;
    final String bgFormsSearchSky;
    final String bgFormItem;
    final String bannerTitleColor;
    final String bgSubmitBtn;
    final String bgShiftButton;
    final String searchIconDesktop;
    final String titleOfPopular;
    final String borderOfPopularItem;
    final String titleOfPopularItem;
    final String contentOfPopularItem;
    final String suggestedTitleColor;
    final String subtitleOfBanner;
    final String primaryColorVoucher;
    final String secondaryColorVoucher;
    final String flightTabBg;
    final String flightTabBg2;
    final String hotelTabBg;
    final String hotelTabBg2;
    final String packageTabBg;
    final String packageTabBg2;
    final String visaTabBg;
    final String visaTabBg2;
    final String popularIcon;
    final String visaLandingIcons;
    final String packageLandingIcons;
    final String companyEmail;
    final String filterIcon;
    final String appltButtonFly4All;
    final String applyButtonFly4All;
    final String resetButtonsFly4All;
    final String whatsappAccount;
    final String borderOfSuggestion;
    final String bgSliderOfFly4All;
    final String bgFooter;
    final String sidebarImgInPassengerInfo;
    final String adsBgFlightBanner1;
    final String adsBgFlightBanner2;
    final String adsBgFlightBanner3;
    final String adsBgFlightTitle1;
    final String adsBgFlightTitle2;
    final String adsBgFlightTitle3;
    final String adsBgFlightSubtitle1;
    final String adsFlightSubtitle1;
    final String adsFlightSubtitle2;
    final String adsFlightSubtitle3;
    final String adsBgHotelBanner1;
    final String adsBgHotelBanner2;
    final String adsBgHotelBanner3;
    final String adsBgHotelTitle1;
    final String adsBgHotelTitle2;
    final String adsBgHotelTitle3;
    final String adsHotelSubtitle1;
    final String adsHotelSubtitle2;
    final String adsHotelSubtitle3;
    final String adsBgPackageBanner1;
    final String adsBgPackageBanner2;
    final String adsBgVisaBanner1;
    final String adsBgVisaBanner2;
    final String adsBgPackageTitle1;
    final String adsBgPackageTitle2;
    final String adsBgVisaTitle1;
    final String adsBgVisaTitle2;
    final String adsPackageSubtitle1;
    final String adsPackageSubtitle2;
    final String adsVisaSubtitle1;
    final String adsVisaSubtitle2;
    final String adsInHomePage1;
    final String adsInHomePage2;
    final String adsInHomePageTitle1;
    final String adsInHomePageTitle2;
    final String adsInHomePageSubtitle1;
    final String adsInHomePageSubtitle2;
    final String adsLink1;
    final String adsLink2;
    final String popularThrDxb;
    final String popularDxbIst;
    final String hotelDestinationIst;
    final String hotelDestinationDxb;
    final String iraqFlag;
    final String mobileHeaderLogo;
    final String resultLogo;
    final String mobileResultLogo;
    final String primaryColorDesktop;
    final String secondaryColorDesktop;
    final String thirdColor;
    final String thirdColorDesktop;
    final String title;
    final String mobile;
    final String email;
    final City city;
    final Timezone timezone;
    final String regNo;
    final String websiteUrl;
    final String postalCode;
    final String address;
    final String notifiedEmails;
    final String status;
    final String copyrightMessage;
    final String footerDescription;
    final String marketplaceScript;
    final int defaultBuyerGroupId;
    final int role;
    final String favicon;
    final String logo;
    final String langFolder;
    final bool emailSender;
    final String defaultStatus;
    final bool marketplaceScriptConfirmed;
    final String dateFormat;
    final bool qEsmsSender;
    final bool smsSender;
    final bool bareedsmsSender;
    final String filemanHost;
    final String guestsSearchability;
    final Language language;
    final Currency currency;
    final List<Currency> currencies;
    final List<Language> languages;
    final Map<String, UserSignupSchema> userSignupSchema;

    GetConfigurationsModel({
        required this.fileCenterDomain,
        required this.logDomain,
        required this.appEnv,
        required this.googlerecaptchaSiteKey,
        required this.searcherIdentity,
        required this.nodeId,
        required this.searchBtnColor,
        required this.homepageBannerImage,
        required this.homepageBannerTitle,
        required this.home1,
        required this.home2,
        required this.home3,
        required this.flight,
        required this.hotel,
        required this.package,
        required this.visa,
        required this.event,
        required this.tour,
        required this.flightResult,
        required this.hotelResult,
        required this.packageResult,
        required this.visaResult,
        required this.eventResult,
        required this.tourResult,
        required this.loadingPage,
        required this.flightResultAd,
        required this.hotelResultAdTop,
        required this.hotelResultAdBottom,
        required this.menuColor,
        required this.hotelSearchGif,
        required this.flightSearchGif,
        required this.packageSearchGif,
        required this.eventSearchGif,
        required this.tourSearchGif,
        required this.visaSearchGif,
        required this.twitterAccount,
        required this.youtubeAccount,
        required this.instegramAccount,
        required this.linkedinAccount,
        required this.facebookAccount,
        required this.hotelProfileAd,
        required this.filterApplyBtn,
        required this.filterResetBtn,
        required this.filterHeaders,
        required this.filterText,
        required this.flightResultTimes,
        required this.resultText,
        required this.resultPrice,
        required this.baggageBtn,
        required this.ruleBtn,
        required this.breakDownBtn,
        required this.bookNowBtn,
        required this.googleAnalytics,
        required this.customSectionOfFooter,
        required this.headerLogo,
        required this.footerLogo,
        required this.voucherLogoBackground,
        required this.headerLogoHeight,
        required this.voucherLogo,
        required this.home1Video,
        required this.flightVideo,
        required this.hotelVideo,
        required this.visaVideo,
        required this.packageVideo,
        required this.tourVideo,
        required this.eventVideo,
        required this.ticketBanner,
        required this.ticketQr,
        required this.suggestedVisaBackground,
        required this.suggestedPackageBackground,
        required this.suggestedEventBackground,
        required this.suggestedTourBackground,
        required this.suggestedBlogBackground,
        required this.homePopularRouteBackground,
        required this.flightPopularRouteBackground,
        required this.hotelTopDestinationsBackground,
        required this.navColorInSlideShow,
        required this.ewalletGatewayChargingInstruction,
        required this.homeMenuSelected,
        required this.themeMobileAppTitle,
        required this.themeMobileAppTitleColor,
        required this.homeMenuDefault,
        required this.navLineColor,
        required this.navLineDefaultColor,
        required this.popularRouteTitleColor,
        required this.suggestedVisaTitle,
        required this.suggestedVisaTitleColor,
        required this.suggestedTourTitleColor,
        required this.suggestedPackageTitleColor,
        required this.travelInspirationsTitleColor,
        required this.travelInspirationsTitle,
        required this.suggestedEventTitleColor,
        required this.topDestinationColor,
        required this.suggestionTitleColor,
        required this.featureBackgroundColor,
        required this.featureIconBackgroundColor,
        required this.suggestionCaptionColor,
        required this.captionItemTimeColor,
        required this.captionDescriptionColor,
        required this.captionTitleColor,
        required this.captionDelimiterColor,
        required this.captionDelimiter,
        required this.featureBoxIcon1,
        required this.featureBoxIcon2,
        required this.featureBoxIcon3,
        required this.featureBoxIcon4,
        required this.featureBoxIcon5,
        required this.popularRouteItem,
        required this.popularRouteItemContent,
        required this.popularRouteItemTitleSign,
        required this.popularRouteItemTitleSignColor,
        required this.nodeInformation,
        required this.featureDelimiter,
        required this.popularRouteBorderBottomActive,
        required this.popularRouteBorderBottom,
        required this.availableRoomsNoticeBackground,
        required this.availableRoomsNoticeColor,
        required this.popularRouteHeaderText,
        required this.popularRouteHeaderTextColor,
        required this.searchResultCheapestFlightsHeaderColor,
        required this.searchResultCheapestFlightsHeaderTextColor,
        required this.searchResultCheapestFlightsHeaderBackgroundColor,
        required this.popularRouteContentTextColor,
        required this.popularRouteItemTitle,
        required this.displayTheLastSectionOnThePage,
        required this.packageTitleColor,
        required this.packageSubtitleColor,
        required this.visaTitleColor,
        required this.visaSubtitleColor,
        required this.andVerLatest,
        required this.andVerAvailable,
        required this.homeMenuDefaultMobileView,
        required this.homeMenuSelectedMobileView,
        required this.menuColorMobileView,
        required this.hamburgerMenuColor,
        required this.home1MobileView,
        required this.appPrimaryColor,
        required this.appAccentColor,
        required this.primaryColor,
        required this.secondColor,
        required this.test,
        required this.test1,
        required this.secondaryColorDesk,
        required this.primaryColorDesk,
        required this.bgFormsSearchSky,
        required this.bgFormItem,
        required this.bannerTitleColor,
        required this.bgSubmitBtn,
        required this.bgShiftButton,
        required this.searchIconDesktop,
        required this.titleOfPopular,
        required this.borderOfPopularItem,
        required this.titleOfPopularItem,
        required this.contentOfPopularItem,
        required this.suggestedTitleColor,
        required this.subtitleOfBanner,
        required this.primaryColorVoucher,
        required this.secondaryColorVoucher,
        required this.flightTabBg,
        required this.flightTabBg2,
        required this.hotelTabBg,
        required this.hotelTabBg2,
        required this.packageTabBg,
        required this.packageTabBg2,
        required this.visaTabBg,
        required this.visaTabBg2,
        required this.popularIcon,
        required this.visaLandingIcons,
        required this.packageLandingIcons,
        required this.companyEmail,
        required this.filterIcon,
        required this.appltButtonFly4All,
        required this.applyButtonFly4All,
        required this.resetButtonsFly4All,
        required this.whatsappAccount,
        required this.borderOfSuggestion,
        required this.bgSliderOfFly4All,
        required this.bgFooter,
        required this.sidebarImgInPassengerInfo,
        required this.adsBgFlightBanner1,
        required this.adsBgFlightBanner2,
        required this.adsBgFlightBanner3,
        required this.adsBgFlightTitle1,
        required this.adsBgFlightTitle2,
        required this.adsBgFlightTitle3,
        required this.adsBgFlightSubtitle1,
        required this.adsFlightSubtitle1,
        required this.adsFlightSubtitle2,
        required this.adsFlightSubtitle3,
        required this.adsBgHotelBanner1,
        required this.adsBgHotelBanner2,
        required this.adsBgHotelBanner3,
        required this.adsBgHotelTitle1,
        required this.adsBgHotelTitle2,
        required this.adsBgHotelTitle3,
        required this.adsHotelSubtitle1,
        required this.adsHotelSubtitle2,
        required this.adsHotelSubtitle3,
        required this.adsBgPackageBanner1,
        required this.adsBgPackageBanner2,
        required this.adsBgVisaBanner1,
        required this.adsBgVisaBanner2,
        required this.adsBgPackageTitle1,
        required this.adsBgPackageTitle2,
        required this.adsBgVisaTitle1,
        required this.adsBgVisaTitle2,
        required this.adsPackageSubtitle1,
        required this.adsPackageSubtitle2,
        required this.adsVisaSubtitle1,
        required this.adsVisaSubtitle2,
        required this.adsInHomePage1,
        required this.adsInHomePage2,
        required this.adsInHomePageTitle1,
        required this.adsInHomePageTitle2,
        required this.adsInHomePageSubtitle1,
        required this.adsInHomePageSubtitle2,
        required this.adsLink1,
        required this.adsLink2,
        required this.popularThrDxb,
        required this.popularDxbIst,
        required this.hotelDestinationIst,
        required this.hotelDestinationDxb,
        required this.iraqFlag,
        required this.mobileHeaderLogo,
        required this.resultLogo,
        required this.mobileResultLogo,
        required this.primaryColorDesktop,
        required this.secondaryColorDesktop,
        required this.thirdColor,
        required this.thirdColorDesktop,
        required this.title,
        required this.mobile,
        required this.email,
        required this.city,
        required this.timezone,
        required this.regNo,
        required this.websiteUrl,
        required this.postalCode,
        required this.address,
        required this.notifiedEmails,
        required this.status,
        required this.copyrightMessage,
        required this.footerDescription,
        required this.marketplaceScript,
        required this.defaultBuyerGroupId,
        required this.role,
        required this.favicon,
        required this.logo,
        required this.langFolder,
        required this.emailSender,
        required this.defaultStatus,
        required this.marketplaceScriptConfirmed,
        required this.dateFormat,
        required this.qEsmsSender,
        required this.smsSender,
        required this.bareedsmsSender,
        required this.filemanHost,
        required this.guestsSearchability,
        required this.language,
        required this.currency,
        required this.currencies,
        required this.languages,
        required this.userSignupSchema,
    });

    factory GetConfigurationsModel.fromJson(Map<String, dynamic> json) => GetConfigurationsModel(
        fileCenterDomain: json["fileCenterDomain"],
        logDomain: json["logDomain"],
        appEnv: json["AppEnv"],
        googlerecaptchaSiteKey: json["googlerecaptchaSiteKey"],
        searcherIdentity: json["searcherIdentity"],
        nodeId: json["nodeId"],
        searchBtnColor: json["search_btn_color"],
        homepageBannerImage: json["homepage_banner_image"],
        homepageBannerTitle: json["homepage_banner_title"],
        home1: json["home1"],
        home2: json["home2"],
        home3: json["home3"],
        flight: json["flight"],
        hotel: json["hotel"],
        package: json["package"],
        visa: json["visa"],
        event: json["event"],
        tour: json["tour"],
        flightResult: json["flight-result"],
        hotelResult: json["hotel-result"],
        packageResult: json["package-result"],
        visaResult: json["visa-result"],
        eventResult: json["event-result"],
        tourResult: json["tour-result"],
        loadingPage: json["loading-page"],
        flightResultAd: json["flight-result-ad"],
        hotelResultAdTop: json["hotel-result-ad-top"],
        hotelResultAdBottom: json["hotel-result-ad-bottom"],
        menuColor: json["menu-color"],
        hotelSearchGif: json["hotel-search-gif"],
        flightSearchGif: json["flight-search-gif"],
        packageSearchGif: json["package-search-gif"],
        eventSearchGif: json["event-search-gif"],
        tourSearchGif: json["tour-search-gif"],
        visaSearchGif: json["visa-search-gif"],
        twitterAccount: json["twitter-account"],
        youtubeAccount: json["youtube-account"],
        instegramAccount: json["instegram-account"],
        linkedinAccount: json["linkedin-account"],
        facebookAccount: json["facebook-account"],
        hotelProfileAd: json["hotel-profile-ad"],
        filterApplyBtn: json["filter-apply-btn"],
        filterResetBtn: json["filter-reset-btn"],
        filterHeaders: json["filter-headers"],
        filterText: json["filter-text"],
        flightResultTimes: json["flight-result-times"],
        resultText: json["result-text"],
        resultPrice: json["result-price"],
        baggageBtn: json["baggage-btn"],
        ruleBtn: json["rule-btn"],
        breakDownBtn: json["break-down-btn"],
        bookNowBtn: json["book-now-btn"],
        googleAnalytics: json["google-analytics"],
        customSectionOfFooter: json["custom-section-of-footer"],
        headerLogo: json["header-logo"],
        footerLogo: json["footer-logo"],
        voucherLogoBackground: json["voucher-logo-background"],
        headerLogoHeight: json["header-logo-height"],
        voucherLogo: json["voucher-logo"],
        home1Video: json["home1-video"],
        flightVideo: json["flight-video"],
        hotelVideo: json["hotel-video"],
        visaVideo: json["visa-video"],
        packageVideo: json["package-video"],
        tourVideo: json["tour-video"],
        eventVideo: json["event-video"],
        ticketBanner: json["ticket-banner"],
        ticketQr: json["ticket-QR"],
        suggestedVisaBackground: json["suggested-visa-background"],
        suggestedPackageBackground: json["suggested-package-background"],
        suggestedEventBackground: json["suggested-event-background"],
        suggestedTourBackground: json["suggested-tour-background"],
        suggestedBlogBackground: json["suggested-blog-background"],
        homePopularRouteBackground: json["home-popular-route-background"],
        flightPopularRouteBackground: json["flight-popular-route-background"],
        hotelTopDestinationsBackground: json["hotel-top-Destinations-background"],
        navColorInSlideShow: json["nav-color-in-slide-show"],
        ewalletGatewayChargingInstruction: json["Ewallet_gateway_charging_instruction"],
        homeMenuSelected: json["home-menu-selected"],
        themeMobileAppTitle: json["theme-mobile-app-title"],
        themeMobileAppTitleColor: json["theme-mobile-app-title-color"],
        homeMenuDefault: json["home-menu-default"],
        navLineColor: json["nav-line-color"],
        navLineDefaultColor: json["nav-line-default-color"],
        popularRouteTitleColor: json["popular-route-title-color"],
        suggestedVisaTitle: json["suggested-visa-title"],
        suggestedVisaTitleColor: json["suggested-visa-title-color"],
        suggestedTourTitleColor: json["suggested-tour-title-color"],
        suggestedPackageTitleColor: json["suggested-package-title-color"],
        travelInspirationsTitleColor: json["travel-inspirations-title-color"],
        travelInspirationsTitle: json["travel-inspirations-title"],
        suggestedEventTitleColor: json["suggested-event-title-color"],
        topDestinationColor: json["top-destination-color"],
        suggestionTitleColor: json["suggestion-title-color"],
        featureBackgroundColor: json["feature-background-color"],
        featureIconBackgroundColor: json["feature-icon-background-color"],
        suggestionCaptionColor: json["suggestion-caption-color"],
        captionItemTimeColor: json["caption-item-time-color"],
        captionDescriptionColor: json["caption-description-color"],
        captionTitleColor: json["caption-title-color"],
        captionDelimiterColor: json["caption-delimiter-color"],
        captionDelimiter: json["caption-delimiter"],
        featureBoxIcon1: json["feature-box-icon1"],
        featureBoxIcon2: json["feature-box-icon2"],
        featureBoxIcon3: json["feature-box-icon3"],
        featureBoxIcon4: json["feature-box-icon4"],
        featureBoxIcon5: json["feature-box-icon5"],
        popularRouteItem: json["popular-route-item"],
        popularRouteItemContent: json["popular-route-item-content"],
        popularRouteItemTitleSign: json["popular-route-item-title-sign"],
        popularRouteItemTitleSignColor: json["popular-route-item-title-sign-color"],
        nodeInformation: json["node-information"],
        featureDelimiter: json["feature-delimiter"],
        popularRouteBorderBottomActive: json["popular-route-border-bottom-active"],
        popularRouteBorderBottom: json["popular-route-border-bottom"],
        availableRoomsNoticeBackground: json["available-rooms-notice-background"],
        availableRoomsNoticeColor: json["available-rooms-notice-color"],
        popularRouteHeaderText: json["popular-route-header-text"],
        popularRouteHeaderTextColor: json["popular-route-header-text-color"],
        searchResultCheapestFlightsHeaderColor: json["search-result-cheapest-flights-header-color"],
        searchResultCheapestFlightsHeaderTextColor: json["search-result-cheapest-flights-header-text-color"],
        searchResultCheapestFlightsHeaderBackgroundColor: json["search-result-cheapest-flights-header-background-color"],
        popularRouteContentTextColor: json["popular-route-content-text-color"],
        popularRouteItemTitle: json["popular-route-item-title"],
        displayTheLastSectionOnThePage: json["display-the-last-section-on-the-page"],
        packageTitleColor: json["package-title-color"],
        packageSubtitleColor: json["package-subtitle-color"],
        visaTitleColor: json["visa-title-color"],
        visaSubtitleColor: json["visa-subtitle-color"],
        andVerLatest: json["and.ver.latest"],
        andVerAvailable: json["and.ver.available"],
        homeMenuDefaultMobileView: json["home-menu-default-mobile-view"],
        homeMenuSelectedMobileView: json["home-menu-selected-mobile-view"],
        menuColorMobileView: json["menu-color-mobile-view"],
        hamburgerMenuColor: json["hamburger-menu-color"],
        home1MobileView: json["home1-mobile-view"],
        appPrimaryColor: json["app-primary-color"],
        appAccentColor: json["app-accent-color"],
        primaryColor: json["primary-color"],
        secondColor: json["second-color"],
        test: json["test"],
        test1: json["test1"],
        secondaryColorDesk: json["secondary-color-desk"],
        primaryColorDesk: json["primary-color-desk"],
        bgFormsSearchSky: json["bg-forms-search-sky"],
        bgFormItem: json["bg-form-item"],
        bannerTitleColor: json["banner-title-color"],
        bgSubmitBtn: json["bg-submit-btn"],
        bgShiftButton: json["bg-shift-button"],
        searchIconDesktop: json["search-icon-desktop"],
        titleOfPopular: json["title-of-popular"],
        borderOfPopularItem: json["border-of-popular-item"],
        titleOfPopularItem: json["title-of-popular-item"],
        contentOfPopularItem: json["content-of-popular-item"],
        suggestedTitleColor: json["suggested-title-color"],
        subtitleOfBanner: json["subtitle-of-banner"],
        primaryColorVoucher: json["primary-color-voucher"],
        secondaryColorVoucher: json["secondary-color-voucher"],
        flightTabBg: json["flight-tab-bg"],
        flightTabBg2: json["flight-tab-bg2"],
        hotelTabBg: json["hotel-tab-bg"],
        hotelTabBg2: json["hotel-tab-bg2"],
        packageTabBg: json["package-tab-bg"],
        packageTabBg2: json["package-tab-bg2"],
        visaTabBg: json["visa-tab-bg"],
        visaTabBg2: json["visa-tab-bg2"],
        popularIcon: json["popular-icon"],
        visaLandingIcons: json["visa-landing-icons"],
        packageLandingIcons: json["package-landing-icons"],
        companyEmail: json["company-email"],
        filterIcon: json["filter-icon"],
        appltButtonFly4All: json["applt-button-fly4all"],
        applyButtonFly4All: json["apply-button-fly4all"],
        resetButtonsFly4All: json["reset-buttons-fly4all"],
        whatsappAccount: json["whatsapp-account"],
        borderOfSuggestion: json["border-of-suggestion"],
        bgSliderOfFly4All: json["bg-slider-of-fly4all"],
        bgFooter: json["bg-footer"],
        sidebarImgInPassengerInfo: json["sidebar-img-in-passenger-info"],
        adsBgFlightBanner1: json["ads-bg-flight-banner-1"],
        adsBgFlightBanner2: json["ads-bg-flight-banner-2"],
        adsBgFlightBanner3: json["ads-bg-flight-banner-3"],
        adsBgFlightTitle1: json["ads-bg-flight-title-1"],
        adsBgFlightTitle2: json["ads-bg-flight-title-2"],
        adsBgFlightTitle3: json["ads-bg-flight-title-3"],
        adsBgFlightSubtitle1: json["ads-bg-flight-subtitle-1"],
        adsFlightSubtitle1: json["ads-flight-subtitle-1"],
        adsFlightSubtitle2: json["ads-flight-subtitle-2"],
        adsFlightSubtitle3: json["ads-flight-subtitle-3"],
        adsBgHotelBanner1: json["ads-bg-hotel-banner-1"],
        adsBgHotelBanner2: json["ads-bg-hotel-banner-2"],
        adsBgHotelBanner3: json["ads-bg-hotel-banner-3"],
        adsBgHotelTitle1: json["ads-bg-hotel-title-1"],
        adsBgHotelTitle2: json["ads-bg-hotel-title-2"],
        adsBgHotelTitle3: json["ads-bg-hotel-title-3"],
        adsHotelSubtitle1: json["ads-hotel-subtitle-1"],
        adsHotelSubtitle2: json["ads-hotel-subtitle-2"],
        adsHotelSubtitle3: json["ads-hotel-subtitle-3"],
        adsBgPackageBanner1: json["ads-bg-package-banner-1"],
        adsBgPackageBanner2: json["ads-bg-package-banner-2"],
        adsBgVisaBanner1: json["ads-bg-visa-banner-1"],
        adsBgVisaBanner2: json["ads-bg-visa-banner-2"],
        adsBgPackageTitle1: json["ads-bg-package-title-1"],
        adsBgPackageTitle2: json["ads-bg-package-title-2"],
        adsBgVisaTitle1: json["ads-bg-visa-title-1"],
        adsBgVisaTitle2: json["ads-bg-visa-title-2"],
        adsPackageSubtitle1: json["ads-package-subtitle-1"],
        adsPackageSubtitle2: json["ads-package-subtitle-2"],
        adsVisaSubtitle1: json["ads-visa-subtitle-1"],
        adsVisaSubtitle2: json["ads-visa-subtitle-2"],
        adsInHomePage1: json["ads-in-home-page-1"],
        adsInHomePage2: json["ads-in-home-page-2"],
        adsInHomePageTitle1: json["ads-in-home-page-title1"],
        adsInHomePageTitle2: json["ads-in-home-page-title2"],
        adsInHomePageSubtitle1: json["ads-in-home-page-subtitle1"],
        adsInHomePageSubtitle2: json["ads-in-home-page-subtitle2"],
        adsLink1: json["ads-link-1"],
        adsLink2: json["ads-link-2"],
        popularThrDxb: json["popular-thr-dxb"],
        popularDxbIst: json["popular-dxb-ist"],
        hotelDestinationIst: json["hotel-destination-ist"],
        hotelDestinationDxb: json["hotel-destination-dxb"],
        iraqFlag: json["iraq-flag"],
        mobileHeaderLogo: json["mobile-header-logo"],
        resultLogo: json["result-logo"],
        mobileResultLogo: json["mobile-result-logo"],
        primaryColorDesktop: json["primary-color-desktop"],
        secondaryColorDesktop: json["secondary-color-desktop"],
        thirdColor: json["third-color"],
        thirdColorDesktop: json["third-color-desktop"],
        title: json["title"],
        mobile: json["mobile"],
        email: json["email"],
        city: City.fromJson(json["city"]),
        timezone: Timezone.fromJson(json["timezone"]),
        regNo: json["reg_no"],
        websiteUrl: json["website_url"],
        postalCode: json["postal_code"],
        address: json["address"],
        notifiedEmails: json["notified_emails"],
        status: json["status"],
        copyrightMessage: json["copyright_message"],
        footerDescription: json["footer_description"],
        marketplaceScript: json["marketplace_script"],
        defaultBuyerGroupId: json["default_buyer_group_id"],
        role: json["role"],
        favicon: json["favicon"],
        logo: json["logo"],
        langFolder: json["langFolder"],
        emailSender: json["Email_sender"],
        defaultStatus: json["defaultStatus"],
        marketplaceScriptConfirmed: json["marketplace_script_confirmed"],
        dateFormat: json["dateFormat"],
        qEsmsSender: json["QEsms_sender"],
        smsSender: json["Sms_sender"],
        bareedsmsSender: json["Bareedsms_sender"],
        filemanHost: json["FILEMAN_HOST"],
        guestsSearchability: json["guestsSearchability"],
        language: Language.fromJson(json["language"]),
        currency: Currency.fromJson(json["currency"]),
        currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        userSignupSchema: Map.from(json["userSignupSchema"]).map((k, v) => MapEntry<String, UserSignupSchema>(k, UserSignupSchema.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "fileCenterDomain": fileCenterDomain,
        "logDomain": logDomain,
        "AppEnv": appEnv,
        "googlerecaptchaSiteKey": googlerecaptchaSiteKey,
        "searcherIdentity": searcherIdentity,
        "nodeId": nodeId,
        "search_btn_color": searchBtnColor,
        "homepage_banner_image": homepageBannerImage,
        "homepage_banner_title": homepageBannerTitle,
        "home1": home1,
        "home2": home2,
        "home3": home3,
        "flight": flight,
        "hotel": hotel,
        "package": package,
        "visa": visa,
        "event": event,
        "tour": tour,
        "flight-result": flightResult,
        "hotel-result": hotelResult,
        "package-result": packageResult,
        "visa-result": visaResult,
        "event-result": eventResult,
        "tour-result": tourResult,
        "loading-page": loadingPage,
        "flight-result-ad": flightResultAd,
        "hotel-result-ad-top": hotelResultAdTop,
        "hotel-result-ad-bottom": hotelResultAdBottom,
        "menu-color": menuColor,
        "hotel-search-gif": hotelSearchGif,
        "flight-search-gif": flightSearchGif,
        "package-search-gif": packageSearchGif,
        "event-search-gif": eventSearchGif,
        "tour-search-gif": tourSearchGif,
        "visa-search-gif": visaSearchGif,
        "twitter-account": twitterAccount,
        "youtube-account": youtubeAccount,
        "instegram-account": instegramAccount,
        "linkedin-account": linkedinAccount,
        "facebook-account": facebookAccount,
        "hotel-profile-ad": hotelProfileAd,
        "filter-apply-btn": filterApplyBtn,
        "filter-reset-btn": filterResetBtn,
        "filter-headers": filterHeaders,
        "filter-text": filterText,
        "flight-result-times": flightResultTimes,
        "result-text": resultText,
        "result-price": resultPrice,
        "baggage-btn": baggageBtn,
        "rule-btn": ruleBtn,
        "break-down-btn": breakDownBtn,
        "book-now-btn": bookNowBtn,
        "google-analytics": googleAnalytics,
        "custom-section-of-footer": customSectionOfFooter,
        "header-logo": headerLogo,
        "footer-logo": footerLogo,
        "voucher-logo-background": voucherLogoBackground,
        "header-logo-height": headerLogoHeight,
        "voucher-logo": voucherLogo,
        "home1-video": home1Video,
        "flight-video": flightVideo,
        "hotel-video": hotelVideo,
        "visa-video": visaVideo,
        "package-video": packageVideo,
        "tour-video": tourVideo,
        "event-video": eventVideo,
        "ticket-banner": ticketBanner,
        "ticket-QR": ticketQr,
        "suggested-visa-background": suggestedVisaBackground,
        "suggested-package-background": suggestedPackageBackground,
        "suggested-event-background": suggestedEventBackground,
        "suggested-tour-background": suggestedTourBackground,
        "suggested-blog-background": suggestedBlogBackground,
        "home-popular-route-background": homePopularRouteBackground,
        "flight-popular-route-background": flightPopularRouteBackground,
        "hotel-top-Destinations-background": hotelTopDestinationsBackground,
        "nav-color-in-slide-show": navColorInSlideShow,
        "Ewallet_gateway_charging_instruction": ewalletGatewayChargingInstruction,
        "home-menu-selected": homeMenuSelected,
        "theme-mobile-app-title": themeMobileAppTitle,
        "theme-mobile-app-title-color": themeMobileAppTitleColor,
        "home-menu-default": homeMenuDefault,
        "nav-line-color": navLineColor,
        "nav-line-default-color": navLineDefaultColor,
        "popular-route-title-color": popularRouteTitleColor,
        "suggested-visa-title": suggestedVisaTitle,
        "suggested-visa-title-color": suggestedVisaTitleColor,
        "suggested-tour-title-color": suggestedTourTitleColor,
        "suggested-package-title-color": suggestedPackageTitleColor,
        "travel-inspirations-title-color": travelInspirationsTitleColor,
        "travel-inspirations-title": travelInspirationsTitle,
        "suggested-event-title-color": suggestedEventTitleColor,
        "top-destination-color": topDestinationColor,
        "suggestion-title-color": suggestionTitleColor,
        "feature-background-color": featureBackgroundColor,
        "feature-icon-background-color": featureIconBackgroundColor,
        "suggestion-caption-color": suggestionCaptionColor,
        "caption-item-time-color": captionItemTimeColor,
        "caption-description-color": captionDescriptionColor,
        "caption-title-color": captionTitleColor,
        "caption-delimiter-color": captionDelimiterColor,
        "caption-delimiter": captionDelimiter,
        "feature-box-icon1": featureBoxIcon1,
        "feature-box-icon2": featureBoxIcon2,
        "feature-box-icon3": featureBoxIcon3,
        "feature-box-icon4": featureBoxIcon4,
        "feature-box-icon5": featureBoxIcon5,
        "popular-route-item": popularRouteItem,
        "popular-route-item-content": popularRouteItemContent,
        "popular-route-item-title-sign": popularRouteItemTitleSign,
        "popular-route-item-title-sign-color": popularRouteItemTitleSignColor,
        "node-information": nodeInformation,
        "feature-delimiter": featureDelimiter,
        "popular-route-border-bottom-active": popularRouteBorderBottomActive,
        "popular-route-border-bottom": popularRouteBorderBottom,
        "available-rooms-notice-background": availableRoomsNoticeBackground,
        "available-rooms-notice-color": availableRoomsNoticeColor,
        "popular-route-header-text": popularRouteHeaderText,
        "popular-route-header-text-color": popularRouteHeaderTextColor,
        "search-result-cheapest-flights-header-color": searchResultCheapestFlightsHeaderColor,
        "search-result-cheapest-flights-header-text-color": searchResultCheapestFlightsHeaderTextColor,
        "search-result-cheapest-flights-header-background-color": searchResultCheapestFlightsHeaderBackgroundColor,
        "popular-route-content-text-color": popularRouteContentTextColor,
        "popular-route-item-title": popularRouteItemTitle,
        "display-the-last-section-on-the-page": displayTheLastSectionOnThePage,
        "package-title-color": packageTitleColor,
        "package-subtitle-color": packageSubtitleColor,
        "visa-title-color": visaTitleColor,
        "visa-subtitle-color": visaSubtitleColor,
        "and.ver.latest": andVerLatest,
        "and.ver.available": andVerAvailable,
        "home-menu-default-mobile-view": homeMenuDefaultMobileView,
        "home-menu-selected-mobile-view": homeMenuSelectedMobileView,
        "menu-color-mobile-view": menuColorMobileView,
        "hamburger-menu-color": hamburgerMenuColor,
        "home1-mobile-view": home1MobileView,
        "app-primary-color": appPrimaryColor,
        "app-accent-color": appAccentColor,
        "primary-color": primaryColor,
        "second-color": secondColor,
        "test": test,
        "test1": test1,
        "secondary-color-desk": secondaryColorDesk,
        "primary-color-desk": primaryColorDesk,
        "bg-forms-search-sky": bgFormsSearchSky,
        "bg-form-item": bgFormItem,
        "banner-title-color": bannerTitleColor,
        "bg-submit-btn": bgSubmitBtn,
        "bg-shift-button": bgShiftButton,
        "search-icon-desktop": searchIconDesktop,
        "title-of-popular": titleOfPopular,
        "border-of-popular-item": borderOfPopularItem,
        "title-of-popular-item": titleOfPopularItem,
        "content-of-popular-item": contentOfPopularItem,
        "suggested-title-color": suggestedTitleColor,
        "subtitle-of-banner": subtitleOfBanner,
        "primary-color-voucher": primaryColorVoucher,
        "secondary-color-voucher": secondaryColorVoucher,
        "flight-tab-bg": flightTabBg,
        "flight-tab-bg2": flightTabBg2,
        "hotel-tab-bg": hotelTabBg,
        "hotel-tab-bg2": hotelTabBg2,
        "package-tab-bg": packageTabBg,
        "package-tab-bg2": packageTabBg2,
        "visa-tab-bg": visaTabBg,
        "visa-tab-bg2": visaTabBg2,
        "popular-icon": popularIcon,
        "visa-landing-icons": visaLandingIcons,
        "package-landing-icons": packageLandingIcons,
        "company-email": companyEmail,
        "filter-icon": filterIcon,
        "applt-button-fly4all": appltButtonFly4All,
        "apply-button-fly4all": applyButtonFly4All,
        "reset-buttons-fly4all": resetButtonsFly4All,
        "whatsapp-account": whatsappAccount,
        "border-of-suggestion": borderOfSuggestion,
        "bg-slider-of-fly4all": bgSliderOfFly4All,
        "bg-footer": bgFooter,
        "sidebar-img-in-passenger-info": sidebarImgInPassengerInfo,
        "ads-bg-flight-banner-1": adsBgFlightBanner1,
        "ads-bg-flight-banner-2": adsBgFlightBanner2,
        "ads-bg-flight-banner-3": adsBgFlightBanner3,
        "ads-bg-flight-title-1": adsBgFlightTitle1,
        "ads-bg-flight-title-2": adsBgFlightTitle2,
        "ads-bg-flight-title-3": adsBgFlightTitle3,
        "ads-bg-flight-subtitle-1": adsBgFlightSubtitle1,
        "ads-flight-subtitle-1": adsFlightSubtitle1,
        "ads-flight-subtitle-2": adsFlightSubtitle2,
        "ads-flight-subtitle-3": adsFlightSubtitle3,
        "ads-bg-hotel-banner-1": adsBgHotelBanner1,
        "ads-bg-hotel-banner-2": adsBgHotelBanner2,
        "ads-bg-hotel-banner-3": adsBgHotelBanner3,
        "ads-bg-hotel-title-1": adsBgHotelTitle1,
        "ads-bg-hotel-title-2": adsBgHotelTitle2,
        "ads-bg-hotel-title-3": adsBgHotelTitle3,
        "ads-hotel-subtitle-1": adsHotelSubtitle1,
        "ads-hotel-subtitle-2": adsHotelSubtitle2,
        "ads-hotel-subtitle-3": adsHotelSubtitle3,
        "ads-bg-package-banner-1": adsBgPackageBanner1,
        "ads-bg-package-banner-2": adsBgPackageBanner2,
        "ads-bg-visa-banner-1": adsBgVisaBanner1,
        "ads-bg-visa-banner-2": adsBgVisaBanner2,
        "ads-bg-package-title-1": adsBgPackageTitle1,
        "ads-bg-package-title-2": adsBgPackageTitle2,
        "ads-bg-visa-title-1": adsBgVisaTitle1,
        "ads-bg-visa-title-2": adsBgVisaTitle2,
        "ads-package-subtitle-1": adsPackageSubtitle1,
        "ads-package-subtitle-2": adsPackageSubtitle2,
        "ads-visa-subtitle-1": adsVisaSubtitle1,
        "ads-visa-subtitle-2": adsVisaSubtitle2,
        "ads-in-home-page-1": adsInHomePage1,
        "ads-in-home-page-2": adsInHomePage2,
        "ads-in-home-page-title1": adsInHomePageTitle1,
        "ads-in-home-page-title2": adsInHomePageTitle2,
        "ads-in-home-page-subtitle1": adsInHomePageSubtitle1,
        "ads-in-home-page-subtitle2": adsInHomePageSubtitle2,
        "ads-link-1": adsLink1,
        "ads-link-2": adsLink2,
        "popular-thr-dxb": popularThrDxb,
        "popular-dxb-ist": popularDxbIst,
        "hotel-destination-ist": hotelDestinationIst,
        "hotel-destination-dxb": hotelDestinationDxb,
        "iraq-flag": iraqFlag,
        "mobile-header-logo": mobileHeaderLogo,
        "result-logo": resultLogo,
        "mobile-result-logo": mobileResultLogo,
        "primary-color-desktop": primaryColorDesktop,
        "secondary-color-desktop": secondaryColorDesktop,
        "third-color": thirdColor,
        "third-color-desktop": thirdColorDesktop,
        "title": title,
        "mobile": mobile,
        "email": email,
        "city": city.toJson(),
        "timezone": timezone.toJson(),
        "reg_no": regNo,
        "website_url": websiteUrl,
        "postal_code": postalCode,
        "address": address,
        "notified_emails": notifiedEmails,
        "status": status,
        "copyright_message": copyrightMessage,
        "footer_description": footerDescription,
        "marketplace_script": marketplaceScript,
        "default_buyer_group_id": defaultBuyerGroupId,
        "role": role,
        "favicon": favicon,
        "logo": logo,
        "langFolder": langFolder,
        "Email_sender": emailSender,
        "defaultStatus": defaultStatus,
        "marketplace_script_confirmed": marketplaceScriptConfirmed,
        "dateFormat": dateFormat,
        "QEsms_sender": qEsmsSender,
        "Sms_sender": smsSender,
        "Bareedsms_sender": bareedsmsSender,
        "FILEMAN_HOST": filemanHost,
        "guestsSearchability": guestsSearchability,
        "language": language.toJson(),
        "currency": currency.toJson(),
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "userSignupSchema": Map.from(userSignupSchema).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class City {
    final int id;
    final int countryId;
    final String en;
    final String abb;
    final int priority;
    final int status;
    final dynamic timezone;
    final String fa;
    final String ar;
    final dynamic ku;
    final dynamic tr;
    final String title;

    City({
        required this.id,
        required this.countryId,
        required this.en,
        required this.abb,
        required this.priority,
        required this.status,
        required this.timezone,
        required this.fa,
        required this.ar,
        required this.ku,
        required this.tr,
        required this.title,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        countryId: json["country_id"],
        en: json["en"],
        abb: json["abb"],
        priority: json["priority"],
        status: json["status"],
        timezone: json["timezone"],
        fa: json["fa"],
        ar: json["ar"],
        ku: json["ku"],
        tr: json["tr"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "country_id": countryId,
        "en": en,
        "abb": abb,
        "priority": priority,
        "status": status,
        "timezone": timezone,
        "fa": fa,
        "ar": ar,
        "ku": ku,
        "tr": tr,
        "title": title,
    };
}

class Currency {
    final int id;
    final String title;
    final String abb;
    final String symbol;
    final int decimalPlaces;

    Currency({
        required this.id,
        required this.title,
        required this.abb,
        required this.symbol,
        required this.decimalPlaces,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        title: json["title"],
        abb: json["abb"],
        symbol: json["symbol"],
        decimalPlaces: json["decimal_places"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "abb": abb,
        "symbol": symbol,
        "decimal_places": decimalPlaces,
    };
}

class Language {
    final int id;
    final String englishName;
    final String localName;
    final String isoCode;
    final int isLtr;
    final dynamic createdAt;
    final dynamic updatedAt;

    Language({
        required this.id,
        required this.englishName,
        required this.localName,
        required this.isoCode,
        required this.isLtr,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        englishName: json["english_name"],
        localName: json["local_name"],
        isoCode: json["iso_code"],
        isLtr: json["is_ltr"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "english_name": englishName,
        "local_name": localName,
        "iso_code": isoCode,
        "is_ltr": isLtr,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

class Timezone {
    final String countryCode;
    final String latitudeLongitude;
    final String name;
    final String status;
    final String utcDstOffset;
    final String utcOffset;
    final int id;

    Timezone({
        required this.countryCode,
        required this.latitudeLongitude,
        required this.name,
        required this.status,
        required this.utcDstOffset,
        required this.utcOffset,
        required this.id,
    });

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        countryCode: json["country_code"],
        latitudeLongitude: json["latitude_longitude"],
        name: json["name"],
        status: json["status"],
        utcDstOffset: json["utc_dst_offset"],
        utcOffset: json["utc_offset"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "latitude_longitude": latitudeLongitude,
        "name": name,
        "status": status,
        "utc_dst_offset": utcDstOffset,
        "utc_offset": utcOffset,
        "id": id,
    };
}

class UserSignupSchema {
    final String type;
    final String label;
    final String name;
    final String virtualclass;
    final String virtualname;

    UserSignupSchema({
        required this.type,
        required this.label,
        required this.name,
        required this.virtualclass,
        required this.virtualname,
    });

    factory UserSignupSchema.fromJson(Map<String, dynamic> json) => UserSignupSchema(
        type: json["type"],
        label: json["label"],
        name: json["name"],
        virtualclass: json["virtualclass"],
        virtualname: json["virtualname"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "name": name,
        "virtualclass": virtualclass,
        "virtualname": virtualname,
    };
}
