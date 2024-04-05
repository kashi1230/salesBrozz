import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';
import 'package:salesbrozz/view/init_screen/splash.dart';

import 'imports.dart';

void main() {
  runApp(
    kIsWeb ? DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()) : MyApp(),
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
      child: MaterialApp(
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

  List get value => _value;

  void setValue(List newValue) {
    _value = newValue;
    notifyListeners();
  }
}
