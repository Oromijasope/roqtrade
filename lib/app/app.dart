import 'package:roqtrade/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:roqtrade/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:roqtrade/ui/views/home/home_view.dart';
import 'package:roqtrade/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:roqtrade/ui/views/dashboard/dashboard_view.dart';
import 'package:roqtrade/ui/views/dashboard//copy_trading/copy_trading_view.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//intro/intro_view.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//copy_trading_dashboard/copy_trading_dashboard_view.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//trading_details/trading_details_view.dart';
import 'package:roqtrade/ui/bottom_sheets/important_message/important_message_sheet.dart';
import 'package:roqtrade/ui/bottom_sheets/risks/risks_sheet.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//enter_amount/enter_amount_view.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//confirm_transaction/confirm_transaction_view.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//enter_pin/enter_pin_view.dart';
import 'package:roqtrade/ui/views//success/success_view.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading//my_dasboard/my_dasboard_view.dart';
import 'package:roqtrade/services/api_service.dart';
import 'package:roqtrade/services/utils_service.dart';
import 'package:roqtrade/ui/views/dashboard//listed_coins/listed_coins_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: DashboardView),
    MaterialRoute(page: CopyTradingView),
    MaterialRoute(page: IntroView),
    MaterialRoute(page: CopyTradingDashboardView),
    MaterialRoute(page: TradingDetailsView),
    MaterialRoute(page: EnterAmountView),
    MaterialRoute(page: ConfirmTransactionView),
    MaterialRoute(page: EnterPinView),
    MaterialRoute(page: SuccessView),
    MaterialRoute(page: MyDasboardView),
    MaterialRoute(page: ListedCoinsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: UtilsService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: ImportantMessageSheet),
    StackedBottomsheet(classType: RisksSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
