

import 'package:get/get.dart';
import 'package:lsandroid/app/pages/Ipgo/ipgo_binding.dart';
import 'package:lsandroid/app/pages/Ipgo/ipgo_page.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_binding.dart';
import 'package:lsandroid/app/pages/chulgo/chulgo_page.dart';
import 'package:lsandroid/app/pages/etcChulgo/etc_chulgo_binding.dart';
import 'package:lsandroid/app/pages/etcChulgo/etc_chulgo_page.dart';
import 'package:lsandroid/app/pages/etcIpgo/etc_ipgo_binding.dart';
import 'package:lsandroid/app/pages/etcIpgo/etc_ipgo_page.dart';
import 'package:lsandroid/app/pages/inventoryCnt/inventory_cnt_binding.dart';
import 'package:lsandroid/app/pages/inventoryCnt/inventory_cnt_page.dart';
import 'package:lsandroid/app/pages/loginPage/login_binding.dart';
import 'package:lsandroid/app/pages/loginPage/login_page.dart';
import 'package:lsandroid/app/pages/main/main_binding.dart';
import 'package:lsandroid/app/pages/main/main_page.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_binding.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_new_page.dart';
import 'package:lsandroid/app/pages/mainKit/main_kit_page.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_binding.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_new_page.dart';
import 'package:lsandroid/app/pages/otherKit/other_kit_page.dart';
import 'package:lsandroid/app/pages/picking/picking_binding.dart';
import 'package:lsandroid/app/pages/picking/picking_page.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_binding.dart';
import 'package:lsandroid/app/pages/rackIpgo/rack_ipgo_page.dart';
import 'package:lsandroid/app/pages/rackIpgoMulti/rack_ipgo_multi_binding.dart';
import 'package:lsandroid/app/pages/rackIpgoMulti/rack_ipgo_multi_page.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_binding.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_new_page.dart';
import 'package:lsandroid/app/pages/smallKit/small_kit_page.dart';

import '../pages/splash/splash_binding.dart';
import '../pages/splash/splash_page.dart';

abstract class Routes {
  static const PERMISSION = _PathName.PERMISSION;
  static const MAIN = _PathName.MAIN;
  static const SPLASH = _PathName.SPLASH;
  static const LOGIN_PAGE= _PathName.LOGIN_PAGE;
  static const IPGO = _PathName.IPGO;
  static const RACK_IPGO = _PathName.RACK_IPGO;
  static const RACK_IPGO_MULTI = _PathName.RACK_IPGO_MULTI;
  static const SMALL_KIT = _PathName.SMALL_KIT;
  static const PICKING = _PathName.PICKING;
  static const OTHER_KIT = _PathName.OTHER_KIT;
  static const CHULGO = _PathName.CHULGO;
  static const MAIN_KIT = _PathName.MAIN_KIT;
  static const ETC_IPGO = _PathName.ETC_IPGO;
  static const ETC_CHULGO = _PathName.ETC_CHULGO;
  static const INVENTORY_CNT = _PathName.INVENTORY_CNT;


}

abstract class _PathName {
  static const String PERMISSION = '/permission'; // 권한 요청 페이지
  static const String MAIN = '/main'; // MAIN 페이지
  static const String SPLASH = '/splash'; // SPLASH 페이지
  static const String LOGIN_PAGE = '/login'; // 로그인 페이지
  static const String IPGO = '/ipgo'; // 입고 페이지
  static const String RACK_IPGO = '/rack_ipgo'; // 랙입고 페이지
  static const String RACK_IPGO_MULTI = '/rack_ipgo_multi'; // 랙입고 다중처리 페이지
  static const String SMALL_KIT = '/small_kit'; // 소박스 kit 페이지
  static const String PICKING = '/picking'; // picking 페이지
  static const String OTHER_KIT = '/other_kit'; // 별도박스 kit 페이지
  static const String CHULGO = '/chulgo'; // 출고등록 페이지
  static const String MAIN_KIT = '/main_kit'; // 메인 kit 페이지
  static const String ETC_IPGO = '/etc_ipgo'; // 기타입고 페이지
  static const String ETC_CHULGO = '/etc_chulgo'; // 기타출고 페이지
  static const String INVENTORY_CNT = '/inventory_cnt'; // 재고실사 페이지


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
        name: _PathName.RACK_IPGO_MULTI, page: () => RackIpgoMultiPage(), binding: RackIpgoMultiBinding()),
    GetPage(
        name: _PathName.SMALL_KIT, page: () => SmallKitNewPage(), binding: SmallKitBinding()),
    GetPage(
        name: _PathName.PICKING, page: () => PickingPage(), binding: PickingBinding()),
    GetPage(
        name: _PathName.OTHER_KIT, page: () => OtherKitNewPage(), binding: OtherKitBinding()),
    GetPage(
        name: _PathName.CHULGO, page: () => ChulgoPage(), binding: ChulgoBinding()),
    GetPage(
        name: _PathName.MAIN_KIT, page: () => MainKitNewPage(), binding: MainKitBinding()),
    GetPage(
        name: _PathName.ETC_IPGO, page: () => EtcIpgoPage(), binding: EtcIpgoBinding()),
    GetPage(
        name: _PathName.ETC_CHULGO, page: () => EtcChulgoPage(), binding: EtcChulgoBinding()),
    GetPage(
        name: _PathName.INVENTORY_CNT, page: () => InventoryCntPage(), binding: InventoryCntBinding()),
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

