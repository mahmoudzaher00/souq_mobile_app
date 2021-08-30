import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view/widgets/custom_bottomNavigationTwo.dart';
import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController = TextEditingController();
  final TextEditingController _passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _ref = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'images/img1.png',
                      height: MediaQuery.of(context).size.height * 0.35,
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
                          if (value!.isEmpty) {
                            return "${LocaleKeys.enter_email.tr()}";
                          } else if (value.length < 3) {
                            return "${LocaleKeys.cannot_less.tr()}";
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
                            onTap: () =>
                               _ref.onclick(),
                            child: IconButton(
                              icon: Icon(
                                  _ref.passwordvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color.fromRGBO(42, 87, 128, 1)), onPressed: ()=>_ref.onclick(),
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
                          if (value!.isEmpty)
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
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: '${LocaleKeys.forgot.tr()}',
                            fontSize: 16,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color.fromRGBO(42, 87, 128, 1),
                        ),
                        onPressed: () {
                          if (_form.currentState!.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CustomBottomNavigationBarTwo()));
                          }
                        },
                        child: Text(
                          "${LocaleKeys.log.tr()}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: "${LocaleKeys.have_account.tr()}",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            child: CustomText(
                              text: '${LocaleKeys.Signup.tr()}',
                              fontSize: 16,
                              color: Color.fromRGBO(42, 87, 128, 1),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                          )
                        ],
                      ),
                    )
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
