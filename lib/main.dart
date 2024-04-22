import 'package:device_preview/device_preview.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:salesbrozz/view/init_screen/splash.dart';

import 'imports.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_)=>ValueProvider(),child:  kIsWeb ? DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()) : MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ValueProvider(),
      child: GetMaterialApp(
        title: 'SalesBroz',
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        home:Splash(),
      ),
    );
  }
}
class ValueProvider extends ChangeNotifier {
  List _value = [];
  String _permission = '';

  List get value => _value;

  void setValue(List newValue) {
    _value = newValue;
    notifyListeners();
  }
  String get permission => _permission;

  void setPermission(String value) {
    _permission = value;
    notifyListeners(); // Notify listeners of changes
  }
}
