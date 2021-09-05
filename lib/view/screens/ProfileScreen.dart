import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:untitled1/view/widgets/MainAppbar.dart';
import 'package:untitled1/view_model/Profile_view_model.dart';

// class ProfileScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//             CircleAvatar(
//              backgroundColor: Colors.black54,
//               child: Icon(
//                Icons.person,
//                color: Colors.white,
//             ),
//           ),
//               Text("${MySharedPreferences.getData(key: "token")}"),
//               Text("${ProfileViewModel.profileModel.data.name} "),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: MainAppBar(),
        body: ProfileViewModel.profileModel.data != null ? SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Card(
                  elevation: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Image.asset(
                                  'images/edit.png',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.brown[50],
                            ),
                            child: Center(
                                child: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 40,
                            )),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12),
                            child: TextFormField(
                              // controller: _passwordTextEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(23, 56, 88, 1)),
                                ),
                                border: UnderlineInputBorder(),
                                labelText:
                                    'Name : ${ProfileViewModel.profileModel.data.name}',
                              ),
                              // validator: (value) {
                              //   if (value.isEmpty)
                              //     return '${LocaleKeys.enter_password.tr()}';
                              //   if (value.length < 6)
                              //     return '${LocaleKeys.pass_cannot_less.tr()}';
                              //   else {
                              //     return null;
                              //   }
                              // },
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12),
                            child: TextFormField(
                              // controller: _passwordTextEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(23, 56, 88, 1)),
                                ),
                                border: UnderlineInputBorder(),
                                labelText:
                                    'Email : ${ProfileViewModel.profileModel.data.email}',
                              ),
                              // validator: (value) {
                              //   if (value.isEmpty)
                              //     return '${LocaleKeys.enter_password.tr()}';
                              //   if (value.length < 6)
                              //     return '${LocaleKeys.pass_cannot_less.tr()}';
                              //   else {
                              //     return null;
                              //   }
                              // },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12),
                            child: TextFormField(
                              // controller: _passwordTextEditingController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.black),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(23, 56, 88, 1)),
                                ),
                                border: UnderlineInputBorder(),
                                labelText:
                                    ' Phone : ${ProfileViewModel.profileModel.data.phone}',
                              ),
                              // validator: (value) {},
                            ),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Color.fromRGBO(42, 87, 128, 1),
                              ),
                              onPressed: () {

                              },
                              child: Text(
                                "Update",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ):Center(child: CircularProgressIndicator()),
    );
  }
}
