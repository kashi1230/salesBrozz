import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:salesbrozz/Nav_Screens/Invoice/pdf.dart';
import 'package:salesbrozz/view/init_screen/splash.dart';
import 'package:http/http.dart' as http;

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
        home:PDF()
      ),
    );
  }
}
class ValueProvider extends ChangeNotifier {
  List _value = [];
  String salePermission ="";
  String purchasePermission ="";

  List get value => _value;

  void setValue(List newValue) {
    _value = newValue;
    notifyListeners();
  }

  void setPermission(String salePerm, String purchasePerm) {
    salePermission = salePerm;
    purchasePermission = purchasePerm;
    notifyListeners();
    print(salePerm);
    print(purchasePerm);
  }
  Map<String, dynamic> _permissions = {};

  Map<String, dynamic> get permissions => _permissions;

  Future<void> fetchPermissions(String userId) async {
    final response = await http.get(Uri.parse('https://api.example.com/permissions/$userId'));
    if (response.statusCode == 200) {
      _permissions = json.decode(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed to load permissions');
    }
  }

  void updatePermissions(Map<String, dynamic> newPermissions) {
    _permissions = newPermissions;
    notifyListeners();
  }
}
