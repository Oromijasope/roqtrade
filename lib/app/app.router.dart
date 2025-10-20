// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:roqtrade/ui/views/dashboard/copy_trading/confirm_transaction/confirm_transaction_view.dart'
    as _i10;
import 'package:roqtrade/ui/views/dashboard/copy_trading/copy_trading_dashboard/copy_trading_dashboard_view.dart'
    as _i7;
import 'package:roqtrade/ui/views/dashboard/copy_trading/copy_trading_view.dart'
    as _i5;
import 'package:roqtrade/ui/views/dashboard/copy_trading/enter_amount/enter_amount_view.dart'
    as _i9;
import 'package:roqtrade/ui/views/dashboard/copy_trading/enter_pin/enter_pin_view.dart'
    as _i11;
import 'package:roqtrade/ui/views/dashboard/copy_trading/intro/intro_view.dart'
    as _i6;
import 'package:roqtrade/ui/views/dashboard/copy_trading/my_dasboard/my_dasboard_view.dart'
    as _i13;
import 'package:roqtrade/ui/views/dashboard/copy_trading/trading_details/trading_details_view.dart'
    as _i8;
import 'package:roqtrade/ui/views/dashboard/dashboard_view.dart' as _i4;
import 'package:roqtrade/ui/views/dashboard/listed_coins/listed_coins_view.dart'
    as _i14;
import 'package:roqtrade/ui/views/home/home_view.dart' as _i2;
import 'package:roqtrade/ui/views/startup/startup_view.dart' as _i3;
import 'package:roqtrade/ui/views/success/success_view.dart' as _i12;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const dashboardView = '/dashboard-view';

  static const copyTradingView = '/copy-trading-view';

  static const introView = '/intro-view';

  static const copyTradingDashboardView = '/copy-trading-dashboard-view';

  static const tradingDetailsView = '/trading-details-view';

  static const enterAmountView = '/enter-amount-view';

  static const confirmTransactionView = '/confirm-transaction-view';

  static const enterPinView = '/enter-pin-view';

  static const successView = '/success-view';

  static const myDasboardView = '/my-dasboard-view';

  static const listedCoinsView = '/listed-coins-view';

  static const all = <String>{
    homeView,
    startupView,
    dashboardView,
    copyTradingView,
    introView,
    copyTradingDashboardView,
    tradingDetailsView,
    enterAmountView,
    confirmTransactionView,
    enterPinView,
    successView,
    myDasboardView,
    listedCoinsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.dashboardView,
      page: _i4.DashboardView,
    ),
    _i1.RouteDef(
      Routes.copyTradingView,
      page: _i5.CopyTradingView,
    ),
    _i1.RouteDef(
      Routes.introView,
      page: _i6.IntroView,
    ),
    _i1.RouteDef(
      Routes.copyTradingDashboardView,
      page: _i7.CopyTradingDashboardView,
    ),
    _i1.RouteDef(
      Routes.tradingDetailsView,
      page: _i8.TradingDetailsView,
    ),
    _i1.RouteDef(
      Routes.enterAmountView,
      page: _i9.EnterAmountView,
    ),
    _i1.RouteDef(
      Routes.confirmTransactionView,
      page: _i10.ConfirmTransactionView,
    ),
    _i1.RouteDef(
      Routes.enterPinView,
      page: _i11.EnterPinView,
    ),
    _i1.RouteDef(
      Routes.successView,
      page: _i12.SuccessView,
    ),
    _i1.RouteDef(
      Routes.myDasboardView,
      page: _i13.MyDasboardView,
    ),
    _i1.RouteDef(
      Routes.listedCoinsView,
      page: _i14.ListedCoinsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.DashboardView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.DashboardView(),
        settings: data,
      );
    },
    _i5.CopyTradingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.CopyTradingView(),
        settings: data,
      );
    },
    _i6.IntroView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.IntroView(),
        settings: data,
      );
    },
    _i7.CopyTradingDashboardView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.CopyTradingDashboardView(),
        settings: data,
      );
    },
    _i8.TradingDetailsView: (data) {
      final args = data.getArgs<TradingDetailsViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i8.TradingDetailsView(
            key: args.key,
            traderName: args.traderName,
            traderInitials: args.traderInitials,
            followers: args.followers,
            coinId: args.coinId),
        settings: data,
      );
    },
    _i9.EnterAmountView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.EnterAmountView(),
        settings: data,
      );
    },
    _i10.ConfirmTransactionView: (data) {
      final args = data.getArgs<ConfirmTransactionViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ConfirmTransactionView(
            key: args.key, copyTradingAmount: args.copyTradingAmount),
        settings: data,
      );
    },
    _i11.EnterPinView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.EnterPinView(),
        settings: data,
      );
    },
    _i12.SuccessView: (data) {
      final args = data.getArgs<SuccessViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.SuccessView(
            titleText: args.titleText,
            subText: args.subText,
            buttonLabel: args.buttonLabel,
            amount: args.amount,
            buttonOnTapFunction: args.buttonOnTapFunction,
            key: args.key),
        settings: data,
      );
    },
    _i13.MyDasboardView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.MyDasboardView(),
        settings: data,
      );
    },
    _i14.ListedCoinsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ListedCoinsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TradingDetailsViewArguments {
  const TradingDetailsViewArguments({
    this.key,
    required this.traderName,
    required this.traderInitials,
    required this.followers,
    required this.coinId,
  });

  final _i15.Key? key;

  final String traderName;

  final String traderInitials;

  final String followers;

  final String coinId;

  @override
  String toString() {
    return '{"key": "$key", "traderName": "$traderName", "traderInitials": "$traderInitials", "followers": "$followers", "coinId": "$coinId"}';
  }

  @override
  bool operator ==(covariant TradingDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.traderName == traderName &&
        other.traderInitials == traderInitials &&
        other.followers == followers &&
        other.coinId == coinId;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        traderName.hashCode ^
        traderInitials.hashCode ^
        followers.hashCode ^
        coinId.hashCode;
  }
}

class ConfirmTransactionViewArguments {
  const ConfirmTransactionViewArguments({
    this.key,
    required this.copyTradingAmount,
  });

  final _i15.Key? key;

  final String copyTradingAmount;

  @override
  String toString() {
    return '{"key": "$key", "copyTradingAmount": "$copyTradingAmount"}';
  }

  @override
  bool operator ==(covariant ConfirmTransactionViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.copyTradingAmount == copyTradingAmount;
  }

  @override
  int get hashCode {
    return key.hashCode ^ copyTradingAmount.hashCode;
  }
}

class SuccessViewArguments {
  const SuccessViewArguments({
    required this.titleText,
    required this.subText,
    required this.buttonLabel,
    this.amount,
    required this.buttonOnTapFunction,
    this.key,
  });

  final String titleText;

  final String subText;

  final String buttonLabel;

  final String? amount;

  final void Function() buttonOnTapFunction;

  final _i15.Key? key;

  @override
  String toString() {
    return '{"titleText": "$titleText", "subText": "$subText", "buttonLabel": "$buttonLabel", "amount": "$amount", "buttonOnTapFunction": "$buttonOnTapFunction", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.titleText == titleText &&
        other.subText == subText &&
        other.buttonLabel == buttonLabel &&
        other.amount == amount &&
        other.buttonOnTapFunction == buttonOnTapFunction &&
        other.key == key;
  }

  @override
  int get hashCode {
    return titleText.hashCode ^
        subText.hashCode ^
        buttonLabel.hashCode ^
        amount.hashCode ^
        buttonOnTapFunction.hashCode ^
        key.hashCode;
  }
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCopyTradingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.copyTradingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToIntroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.introView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCopyTradingDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.copyTradingDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTradingDetailsView({
    _i15.Key? key,
    required String traderName,
    required String traderInitials,
    required String followers,
    required String coinId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tradingDetailsView,
        arguments: TradingDetailsViewArguments(
            key: key,
            traderName: traderName,
            traderInitials: traderInitials,
            followers: followers,
            coinId: coinId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterAmountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.enterAmountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmTransactionView({
    _i15.Key? key,
    required String copyTradingAmount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.confirmTransactionView,
        arguments: ConfirmTransactionViewArguments(
            key: key, copyTradingAmount: copyTradingAmount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEnterPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.enterPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessView({
    required String titleText,
    required String subText,
    required String buttonLabel,
    String? amount,
    required void Function() buttonOnTapFunction,
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.successView,
        arguments: SuccessViewArguments(
            titleText: titleText,
            subText: subText,
            buttonLabel: buttonLabel,
            amount: amount,
            buttonOnTapFunction: buttonOnTapFunction,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMyDasboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.myDasboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToListedCoinsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.listedCoinsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.dashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCopyTradingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.copyTradingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithIntroView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.introView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCopyTradingDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.copyTradingDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTradingDetailsView({
    _i15.Key? key,
    required String traderName,
    required String traderInitials,
    required String followers,
    required String coinId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tradingDetailsView,
        arguments: TradingDetailsViewArguments(
            key: key,
            traderName: traderName,
            traderInitials: traderInitials,
            followers: followers,
            coinId: coinId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnterAmountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.enterAmountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmTransactionView({
    _i15.Key? key,
    required String copyTradingAmount,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.confirmTransactionView,
        arguments: ConfirmTransactionViewArguments(
            key: key, copyTradingAmount: copyTradingAmount),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEnterPinView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.enterPinView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessView({
    required String titleText,
    required String subText,
    required String buttonLabel,
    String? amount,
    required void Function() buttonOnTapFunction,
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.successView,
        arguments: SuccessViewArguments(
            titleText: titleText,
            subText: subText,
            buttonLabel: buttonLabel,
            amount: amount,
            buttonOnTapFunction: buttonOnTapFunction,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMyDasboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.myDasboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithListedCoinsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.listedCoinsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
