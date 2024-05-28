import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:salesbrozz/widgets/Common%20Widgets/Button.dart';
import 'package:salesbrozz/widgets/text/textbuilder.dart';
import '../../../imports.dart';
import '../../../main.dart';
import '../../main_view.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  Future<void> login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost/salesbrozz/loginn.php'), // Adjust the URL
      headers:{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'e_name': userName.text.trim(),
        'password': userPassword.text.trim(),
      }),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      if (data['status'] == 'success') {
        Provider.of<ValueProvider>(context, listen: false).setPermission(
          data['sale_Permission'],
          data['purchase_Permission'],
        );
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (_) => MainView(
                  initRoute: 0,
                  headTitle: "Home",
                )),
                (route) => false);
        print(response.body);
      } else {
        print(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'])),
        );
      }
    } else {
      throw Exception('Failed to load data');
    }
  }

  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final _formPageKey = GlobalKey<FormState>();
  final _pageKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    userName = TextEditingController(text: "");
    userPassword = TextEditingController(text: "");
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _pageKey,
      body: Form(
        key: _formPageKey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: const SizedBox(),
                      ),
                      TextBuilder(
                        text: "Welcome",
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(height: 50),
                      _emailPasswordWidget(),
                      const SizedBox(height: 20),
                      loginButton(
                          ontap: () => login(context),
                          width: MediaQuery.of(context).size.width,
                          text: "Login",
                          height: 50.0),
                      // _forgotPassword(),
                      const SizedBox(height: 20),
                      //_skipButton(),
                      _divider(),
                      Expanded(
                        flex: 2,
                        child: const SizedBox(),
                      ),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: _createAccountLabel(),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: TextBuilder(
            text: 'Forgot Password ?',
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      key: Key("Name"),
      controller: userName,
      validator: (value) => (value!.isEmpty) ? "Please Enter Name" : null,
      style: GoogleFonts.lato(fontSize: 20.0),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: "Name",
          border: OutlineInputBorder()),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      key: Key("userPassword"),
      controller: userPassword,
      obscureText: _obscureText,
      validator: (value) => (value!.isEmpty) ? "Please Enter Password" : null,
      style: GoogleFonts.lato(fontSize: 20.0),
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock),
          labelText: "Password",
          border: OutlineInputBorder()),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        const SizedBox(height: 10),
        _passwordField(),
        TextButton(
            onPressed: _togglePassword,
            child: TextBuilder(text: _obscureText ? "Show" : "Hide")),
      ],
    );
  }
}
