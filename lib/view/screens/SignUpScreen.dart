import 'package:flutter/material.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view/screens/LoginScreen.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingControllerConfirm =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _ref = Provider.of<SignupViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    Text(
                      '${LocaleKeys.Signup.tr()}',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(42, 87, 128, 1)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _emailTextEditingController,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email,
                              color: Color.fromRGBO(42, 87, 128, 1)),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(23, 56, 88, 1)),
                          ),
                          border: UnderlineInputBorder(),
                          labelText: '${LocaleKeys.login.tr()}',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "${LocaleKeys.enter_email.tr()}";
                          } else if (value.length < 3) {
                            return "${LocaleKeys.cannot_less.tr()} ";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _passwordTextEditingController,
                        obscureText: _ref.passwordvisible ? true : false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_rounded,
                              color: Color.fromRGBO(42, 87, 128, 1)),
                          suffixIcon: InkWell(
                            onTap: () => _ref.onclick(),
                            child: IconButton(
                              icon: Icon(
                                  _ref.passwordvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromRGBO(42, 87, 128, 1)),
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(23, 56, 88, 1)),
                          ),
                          border: UnderlineInputBorder(),
                          labelText: '${LocaleKeys.password.tr()}',
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return '${LocaleKeys.enter_password.tr()}';
                          if (value.length < 6)
                            return '${LocaleKeys.pass_cannot_less.tr()}';
                          else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _passwordTextEditingControllerConfirm,
                        obscureText: _ref.passwordConfirm ? true : false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_rounded,
                              color: Color.fromRGBO(42, 87, 128, 1)),
                          suffixIcon: InkWell(
                            onTap: () => _ref.inClickConfirm(),
                            child: IconButton(
                              icon: Icon(
                                  _ref.passwordConfirm
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromRGBO(42, 87, 128, 1)),
                            ),
                          ),
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(23, 56, 88, 1)),
                          ),
                          border: UnderlineInputBorder(),
                          labelText: '${LocaleKeys.confirm_password.tr()}',
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return '${LocaleKeys.confirm_enter_password.tr()}';
                          if (value.length < 6)
                            return '${LocaleKeys.pass_cannot_less.tr()}';
                          else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(42, 87, 128, 1),
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.33,
                            right: MediaQuery.of(context).size.width * 0.33,
                            top: 10,
                            bottom: 10,
                          )),
                      onPressed: () {
                        if (_form.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      },
                      child: Text(
                        "${LocaleKeys.Signup.tr()}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
