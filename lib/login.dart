import 'package:flutter/material.dart';
import 'package:myapp/Profile.dart';
import 'package:myapp/api/service/user_service.dart';

class LoginPage extends StatefulWidget {
  static final route = "/login";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userService = UserService();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _isLoading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                left: 750,
                right: 750,
                top: 250,
                bottom: 250,
              ),
              child: SizedBox(
                height: 400,
                child: Card(
                  elevation: 8,
                  child: Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 95,
                          right: 95,
                          top: 0,
                          bottom: 250,

                          // width: 150,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                        Container(
                          width: 300,
                          margin:
                              EdgeInsets.only(top: 130, left: 55, right: 55),
                          child: _isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : _buildForm(),
                        ),
                        Container(
                          width: 300,
                          margin: EdgeInsets.only(top: 300, left: 55),
                          child: RaisedButton(
                            color: Colors.lightBlue[700],
                            elevation: 0,
                            child: Container(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                 _login();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: 'Username',
                  focusColor: Colors.blue,
                  hintStyle: TextStyle(fontSize: 14),
                  labelText: 'Username'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please Enter Username';
                }
                return null;
              },
              //keep value Username
            ),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.only(
              top: 0,
            ),
            //Text form field Password
            child: TextFormField(
              controller: passwordController,
              obscureText: _passwordVisible,
              decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                    //click to change obscureText
                    onTap: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },

                    child: Icon(_passwordVisible
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                  labelText: 'Password'),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please Enter Password';
                }
                return null;
              },
              //keep value Password
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _login() async {
    try {
      print("Login ==>");
      setState(() {
        _isLoading = true;
      });

      final user = await userService.login(
        username: usernameController.text,
        password: usernameController.text,
      );
      print('User is : $user');
      if (user != null) {
        print("Login : $user");
        Navigator.of(context).pushReplacementNamed(
          ProfilePage.route,
          arguments: ProfileParam(
            user: user,
          ),
        );
      } else {
        print("Else: User");
      }
    } catch (e) {
      print("Error ==> $e");
      //TODO: wrong
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
