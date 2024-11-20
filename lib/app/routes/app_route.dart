

import 'package:get/get.dart';
import 'package:lsandroid/app/pages/Ipgo/ipgo_binding.dart';
import 'package:lsandroid/app/pages/Ipgo/ipgo_page.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_binding.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_page.dart';
import 'package:lsandroid/app/pages/etcChulgo/etc_chulgo_binding.dart';
import 'package:lsandroid/app/pages/etcChulgo/etc_chulgo_page.dart';
import 'package:lsandroid/app/pages/etcIpgo/etc_ipgo_binding.dart';
import 'package:lsandroid/app/pages/etcIpgo/etc_ipgo_page.dart';
import 'package:lsandroid/app/pages/loginPage/login_binding.dart';
import 'package:lsandroid/app/pages/loginPage/login_page.dart';
import 'package:lsandroid/app/pages/main/main_binding.dart';
import 'package:lsandroid/app/pages/main/main_page.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_binding.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_page.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_binding.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_page.dart';
import 'package:lsandroid/app/pages/picking/picking_binding.dart';
import 'package:lsandroid/app/pages/picking/picking_page.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_binding.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_page.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_binding.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_page.dart';

import '../pages/splash/splash_binding.dart';
import '../pages/splash/splash_page.dart';

abstract class Routes {
  static const PERMISSION = _PathName.PERMISSION;
  static const MAIN = _PathName.MAIN;
  static const SPLASH = _PathName.SPLASH;
  static const FACILITY = _PathName.FACILITY;
  static const FACILITY_FIRST = _PathName.FACILITY_FIRST;
  static const PRODUCT_LOCATION = _PathName.PRODUCT_LOCATION;
  static const INVENTORY_COUNTING = _PathName.INVENTORY_COUNTING;
  static const PROCESS_TRANSFER = _PathName.PROCESS_TRANSFER;
  static const INVENTORY_CHECK= _PathName.INVENTORY_CHECK;
  static const PROCESS_CHECK= _PathName.PROCESS_CHECK;
  static const FACILITY_MONITORING= _PathName.FACILITY_MONITORING;
  static const PACKAGING_INSPEC= _PathName.PACKAGING_INSPEC;
  static const SCRAP_LABEL= _PathName.SCRAP_LABEL;
  static const LOGIN_PAGE= _PathName.LOGIN_PAGE;
  static const ALARM= _PathName.ALARM;
  static const BLUETOOTH_PRINTER = _PathName.BLUETOOTH_PRINTER;
  static const NOTICE = _PathName.NOTICE;
  static const GONGJUNG_CHHECK = _PathName.GONGJUNG_CHHECK;
  static const GAGONG_FACILITY = _PathName.GAGONG_FACILITY;
  static const IPGO = _PathName.IPGO;
  static const RACK_IPGO = _PathName.RACK_IPGO;
  static const SMALL_KIT = _PathName.SMALL_KIT;
  static const PICKING = _PathName.PICKING;
  static const OTHER_KIT = _PathName.OTHER_KIT;
  static const CHULGO = _PathName.CHULGO;
  static const MAIN_KIT = _PathName.MAIN_KIT;
  static const ETC_IPGO = _PathName.ETC_IPGO;
  static const ETC_CHULGO = _PathName.ETC_CHULGO;
}

abstract class _PathName {
  static const String PERMISSION = '/permission'; // 권한 요청 페이지
  static const String MAIN = '/main'; // MAIN 페이지
  static const String SPLASH = '/splash'; // SPLASH 페이지
  static const String LOGIN_PAGE = '/login'; // 로그인 페이지
  static const String FACILITY = '/facility'; // FACILITY 페이지
  static const String FACILITY_FIRST = '/facility_first'; // FACILITY 페이지
  static const String PRODUCT_LOCATION = '/product_location'; // 제품이동 페이지
  static const String INVENTORY_COUNTING = '/inventoty_counting'; // 재고실사 페이지
  static const String PROCESS_TRANSFER = '/process_transfer'; // 공정이동 페이지
  static const String INVENTORY_CHECK = '/inventory_check'; // 제품재고 조회 페이지
  static const String PROCESS_CHECK = '/process_check'; // 작업조회 페이지
  static const String FACILITY_MONITORING = '/facility_monitoring'; // 설비가동 모니터링 페이지
  static const String PACKAGING_INSPEC = '/packaging_inspec'; // 제품포장 검수 페이지
  static const String SCRAP_LABEL = '/scrap_label'; // 스크랩 라벨발행 페이지
  static const String ALARM = '/alarm'; // 알림 페이지
  static const String BLUETOOTH_PRINTER = '/bluetooth_printer'; // 프린트
  static const String NOTICE = '/notice'; // 프린트
  static const String GONGJUNG_CHHECK = '/gongjung_check'; // 공정조회 페이지
  static const String GAGONG_FACILITY = '/gagong_facility'; // 가공설 페이지
  static const String IPGO = '/ipgo'; // 입고 페이지
  static const String RACK_IPGO = '/rack_ipgo'; // 랙입고 페이지
  static const String SMALL_KIT = '/small_kit'; // 소박스 kit 페이지
  static const String PICKING = '/picking'; // picking 페이지
  static const String OTHER_KIT = '/other_kit'; // 별도박스 kit 페이지
  static const String CHULGO = '/chulgo'; // 출고등록 페이지
  static const String MAIN_KIT = '/main_kit'; // 메인 kit 페이지
  static const String ETC_IPGO = '/etc_ipgo'; // 기타입고 페이지
  static const String ETC_CHULGO = '/etc_chulgo'; // 기타출고 페이지



}

class AppRoute {
  static final routes = [
    GetPage(
        name: _PathName.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: _PathName.MAIN, page: () => MainPage(), binding: MainBinding()),
    GetPage(
        name: _PathName.LOGIN_PAGE, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: _PathName.IPGO, page: () => IpgoPage(), binding: IpgoBinding()),
    GetPage(
        name: _PathName.RACK_IPGO, page: () => RackIpgoPage(), binding: RackIpgoBinding()),
    GetPage(
        name: _PathName.SMALL_KIT, page: () => SmallKitPage(), binding: SmallKitBinding()),
    GetPage(
        name: _PathName.PICKING, page: () => PickingPage(), binding: PickingBinding()),
    GetPage(
        name: _PathName.OTHER_KIT, page: () => OtherKitPage(), binding: OtherKitBinding()),
    GetPage(
        name: _PathName.CHULGO, page: () => ChulgoPage(), binding: ChulgoBinding()),
    GetPage(
        name: _PathName.MAIN_KIT, page: () => MainKitPage(), binding: MainKitBinding()),
    GetPage(
        name: _PathName.ETC_IPGO, page: () => EtcIpgoPage(), binding: EtcIpgoBinding()),
    GetPage(
        name: _PathName.ETC_CHULGO, page: () => EtcChulgoPage(), binding: EtcChulgoBinding()),
  /*    GetPage(
        name: _PathName.FACILITY, page: () => FacilityPage(), binding: FacilityBinding()),
    GetPage(
        name: _PathName.FACILITY_FIRST, page: () => FacilityFirstStep1Page(), binding: FacilityFirstBinding()),
    GetPage(
        name: _PathName.PRODUCT_LOCATION, page: () => ProductLocationPage(), binding: ProductLocationBinding()),
    GetPage(
        name: _PathName.INVENTORY_COUNTING, page: () => InventoryCountingPage(), binding: InventoryCountingBinding()),
    GetPage(
        name: _PathName.PROCESS_TRANSFER, page: () => ProcessTransferPage(), binding: ProcessTransferBinding()),
    GetPage(
        name: _PathName.INVENTORY_CHECK, page: () => InventoryCheckPage(), binding: InventoryCheckBinding()),
    GetPage(
        name: _PathName.PROCESS_CHECK, page: () => ProcessCheckPage(), binding: ProcessCheckBinding()),
    GetPage(
        name: _PathName.FACILITY_MONITORING, page: () => FacilityMonitoringPage(), binding: FacilityMonitoringBinding()),
    GetPage(
        name: _PathName.PACKAGING_INSPEC, page: () => PackagingInspecPage(), binding: PackagingInspecBinding()),
    GetPage(
        name: _PathName.SCRAP_LABEL, page: () => ScrapLabelPage(), binding: ScrapLabelBinding()),
    GetPage(
        name: _PathName.LOGIN_PAGE, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(
        name: _PathName.ALARM, page: () => AlarmPage(), binding: AlarmBinding()),
   *//* GetPage(
        name: _PathName.BLUETOOTH_PRINTER, page: () => BluetoothPrinter(), binding: ScrapLabelBinding()),*//*
    GetPage(
        name: _PathName.NOTICE, page: () => NoticePage(), binding: NoticeBinding()),
    GetPage(
        name: _PathName.GONGJUNG_CHHECK, page: () => GongjungCheckPage(), binding:  GongjungCheckBinding()),
    GetPage(
        name: _PathName.GAGONG_FACILITY, page: () => GagongFacilityPage(), binding:  GagongFacilityBinding()),
*/
  ];
}

