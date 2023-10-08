import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:solinx_code_test/Core/Core_View/no_internet_connection.dart';
import '../Core_Config/config_util.dart';
import '../Core_Util/network_provider.dart';

//Thaw Zin Naing Soe
class CoreScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? bottomNavigationBar;
  final DragStartBehavior? drawerDragStartBehavior;
  final Widget? bottomSheet;
  final List<Widget>? persistentFooterButtons;
  final Function(bool)? onDrawerChanged;
  final Function(bool)? onEndDrawerChanged;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool? primary;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final bool? willPopScope;

  const CoreScaffold(
      {Key? key,
      this.appBar,
      this.body,
      this.drawer,
      this.endDrawer,
      this.floatingActionButton,
      this.floatingActionButtonAnimator,
      this.floatingActionButtonLocation,
      this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
      this.bottomNavigationBar,
      this.drawerDragStartBehavior = DragStartBehavior.start,
      this.bottomSheet,
      this.persistentFooterButtons,
      this.onDrawerChanged,
      this.onEndDrawerChanged,
      this.backgroundColor,
      this.resizeToAvoidBottomInset,
      this.primary = true,
      this.extendBody = false,
      this.extendBodyBehindAppBar = false,
      this.drawerScrimColor,
      this.drawerEdgeDragWidth,
      this.drawerEnableOpenDragGesture = true,
      this.endDrawerEnableOpenDragGesture = true,
      this.restorationId,
      this.willPopScope})
      : assert((body != null)),
        super(key: key);

  Future<bool> willpopscope() {
    return Future.value(willPopScope ?? true);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ConfigUtil.hideKeyboard(context),
      child: WillPopScope(
        onWillPop: willpopscope,
        child: Scaffold(
            // key: key,
            appBar: appBar,
            body: myBody(),
            drawer: drawer,
            endDrawer: endDrawer,
            backgroundColor: backgroundColor,
            floatingActionButton: floatingActionButton,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            resizeToAvoidBottomInset: false),
      ),
    );
  }

// Need to check login or not
  Widget myBody() {
    return StreamBuilder<ConnectivityResult>(
        stream: NetworkProvider().networkStatusController.stream,
        builder: ((context, snapshot) {
          if (snapshot.data == ConnectivityResult.none ||
              snapshot.data == ConnectivityResult.other) {
            return const NoInternetConnection();
          } else if (snapshot.data == ConnectivityResult.mobile ||
              snapshot.data == ConnectivityResult.wifi) {
            return body ?? Container();
          }
          return Container();
        }));
  }
}
