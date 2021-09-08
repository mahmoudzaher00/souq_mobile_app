import 'package:flutter/material.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/view/shared/components/components.dart';
import 'package:untitled1/view_model/Profile_view_model.dart';
import 'package:untitled1/view_model/Resgister_View_Model.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  final TextEditingController _emailTextEditingController = TextEditingController();

  final TextEditingController _nameTextEditingController = TextEditingController();

  final TextEditingController _passwordTextEditingController = TextEditingController();

  final TextEditingController _passwordTextEditingControllerconfirm = TextEditingController();

  final TextEditingController _phoneTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
     final _model = Provider.of<SignupViewModel>(context);


     Future<void> sendRegisterData() async {
       if (await checkInternetConnectivity()) {
         _model.userRegister(
           name: _nameTextEditingController.text,
           email: _emailTextEditingController.text,
           password: _passwordTextEditingController.text,
           phone: _phoneTextEditingController.text,
           context: context
         );
        // ref.getProfileData();
       } else {
         //print("No internet ");
         makeToast('${LocaleKeys.Nointernet.tr()}');

       }

     }
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
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
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
                            controller: _nameTextEditingController,
                            obscureText: false,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person,
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
                              labelText: '${LocaleKeys.Name.tr()}',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "${LocaleKeys.enter_name.tr()}";
                              } else if (value.length < 3) {
                                return "${LocaleKeys.cannot_less_name.tr()} ";
                              } else {
                                return null;
                              }
                            },
                          ),
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
                              } else if (value.length < 6) {
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
                            obscureText:_model.passwordvisible,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_rounded,
                                  color: Color.fromRGBO(42, 87, 128, 1)),
                              suffixIcon: IconButton(
                                  onPressed: () {return _model.onclick();},
                                  icon: Icon(
                                      _model.passwordvisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color.fromRGBO(42, 87, 128, 1)),
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
                            controller: _passwordTextEditingControllerconfirm,
                            obscureText: _model.passwordConfirm ? true : false,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_rounded,
                                  color: Color.fromRGBO(42, 87, 128, 1)),
                              suffixIcon:  IconButton(
                                onPressed:() =>_model.inClickConfirm(),
                                  icon: Icon(
                                      _model.passwordConfirm
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Color.fromRGBO(42, 87, 128, 1)),
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
                              if (value.isEmpty ||
                                  value !=
                                      _passwordTextEditingController.text) {
                                return '${LocaleKeys.confirm_enter_password.tr()}';

                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _phoneTextEditingController,
                            obscureText: false,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone,
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
                              labelText: '${LocaleKeys.phone.tr()}',
                            ),
                            validator: (value) {
                              if (value.isEmpty)
                                return '${LocaleKeys.enter_phone.tr()}';
                              if (value.length < 11 || value.length > 11)
                                return '${LocaleKeys.cannot_less_phone.tr()}';
                              else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
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
                                sendRegisterData();
                                //ref.getProfileData();
                              }
                            },
                            child: Text(
                              "${LocaleKeys.Signup.tr()}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
    );

  }
}
