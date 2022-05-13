import 'dart:async';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interior_design_and_ar/components/error_screen.dart';
import 'package:interior_design_and_ar/components/loading_screen.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/theme.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'components/wrapper.dart';
import 'components/wrapper_builder.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(App());
}

class App extends StatefulWidget {
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_AppState>()!.restartApp();
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  // Set giá trị mặc định cho  `initialized` và `error` thành false
  bool initialized = false;
  bool error = false;

  // khai báo các biến hỗ trợ việc check internet
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectionStatus = result;
    });
  }

  // hàm initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // đợi Firebase init và set `initialized` thành true
      await Firebase.initializeApp();
      FirebaseAppCheck firebaseAppCheck = FirebaseAppCheck.instance;
      await firebaseAppCheck.activate();
      setState(() {
        initialized = true;
      });
    } catch (e) {
      // Set `error` thành true if Firebase init lỗi
      setState(() {
        error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();

    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    initializeFlutterFire();
  }

  @override
  void dispose() {
    super.dispose();
    connectivitySubscription.cancel();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars
  }

  @override
  Widget build(BuildContext context) {
    if (error) {
      return const MaterialApp(
          debugShowCheckedModeBanner: false, home: ErrorScreen());
    }

    if (connectionStatus == ConnectivityResult.none) {
      return const MaterialApp(
          debugShowCheckedModeBanner: false, home: ErrorScreen());
    }

    // hiển thị màn hình loading trong lúc init chưa xong
    if (!initialized) {
      return MaterialApp(home: const LoadingScreen());
    }

    return KeyedSubtree(
      key: key,
      child: MultiProvider(
        providers: [
          Provider(create: (_) {
            return AuthService();
          }),
        ],
        child: WrapperBuilder(
          builder: (context, userSnapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              home: Wrapper(
                userSnapshot: userSnapshot,
              ),
            );
          },
        ),
      ),
    );
  }

  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  // thực hiện tạo connection với internet để chec
}
