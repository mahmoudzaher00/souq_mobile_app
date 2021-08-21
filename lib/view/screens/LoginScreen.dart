import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/screens/HomeScreen.dart';
import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:untitled1/view_model/Login_view_model.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

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
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please Enter Your Email";
                          } else if (value.length < 3) {
                            return "Email cannot be less than three characters! ";
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
                                context.read<LoginViewModel>().onclick(),
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
                          labelText: 'Password',
                        ),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Please Enter Your Password';
                          if (value.length < 6)
                            return 'The password cannot be less than six digits';
                          else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: 'Forgot password? ',
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
                          if (_form.currentState.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        },
                        child: Text(
                          "Login ",
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
                              text: "Don\'t have an account?",
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            child: CustomText(
                              text: ' Sign up ',
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
