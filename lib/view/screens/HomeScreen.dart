import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/translations/locale_keys.g.dart';
import 'package:untitled1/view/shared/Network/remote/Productprovider.dart';
import 'package:untitled1/view/widgets/CategoriesWidget.dart';
import 'package:untitled1/view/widgets/ImageSlider.dart';
import 'package:untitled1/view/widgets/ProductsWidget.dart';
import 'package:untitled1/view/widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:untitled1/view_model/Profile_view_model.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    ProfileViewModel.getProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final statusBar = MediaQuery.of(context).padding.top;
    final appBar = AppBar().preferredSize.height;

    ProductProvider product = Provider.of<ProductProvider>(context);
    product.fetchproduct();


    return Scaffold(
      body: product.productResponse!=null
          ? SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - statusBar - appBar - 105,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: CarouselImage(context),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: CustomText(
                          text: '${LocaleKeys.Categories.tr()}',
                          fontweight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      CategoriesWidget(),
                      Divider(
                        thickness: 3,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 12,right: 8.0),
                          child: CustomText(
                            text: '${LocaleKeys.Recommended.tr()}',
                            fontweight: FontWeight.bold,
                            fontSize: 20,
                          )),
                      ProductsWidget(),
                    ],
                  ),
                ]),
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
