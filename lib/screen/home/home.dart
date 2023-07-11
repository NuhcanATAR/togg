import 'package:flutter/material.dart';

// pub dev
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// router page
import '../profile_screen/profile.dart';
import 'package:toggapp/screen/home/sub_widget/all_modelslist_subwidget.dart';
import 'package:toggapp/screen/home/sub_widget/carlist_subwidget.dart';
import 'package:toggapp/screen/home/sub_widget/charging_stationscard_subwidget.dart';
import 'package:toggapp/screen/home/sub_widget/search_filtersub_widget.dart';
import 'package:toggapp/screen/home/sub_widget/toggtrumore_cardsubwidget.dart';
import 'package:toggapp/screen/home/text_widget/body_medium_text.dart';
import 'package:toggapp/screen/home/text_widget/title_large_text.dart';
import 'package:toggapp/screen/home/text_widget/title_medium_text.dart';

// model & database
import '../../base/home_base/home_base.dart';

// part router
part '../home/home_view/home_strings.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends MainBaseHomeState<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const profileScreen(),
                ),
              ),
              child: SizedBox(
                width: 45,
                height: 45,
                child: Image.asset(
                    "assets/images/app_home_ico/icons8-user-96.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  // welcome text
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: bodyMediumTextGrey(
                      text: _homeStrings.welcomeText.text.toString(),
                    ),
                  ),
                  // name surname   1
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const profileScreen(),
                        ),
                      ),
                      child: FutureBuilder(
                        future: serviceDB.homeProfilDbRef
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .get(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                              "",
                              style: TextStyle(color: Colors.red),
                            );
                          }

                          if (snapshot.hasData && !snapshot.data!.exists) {
                            return const Text(
                              "",
                              style: TextStyle(color: Colors.red),
                            );
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return titleMediumText(
                              text: data['NAMESURNAME'].toString(),
                            );
                          }

                          return const Text(
                            "",
                            style: TextStyle(color: Colors.red),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: ListView(
          children: <Widget>[
            // main title widget
            buildMainTitleWidget,
            // search filter widget
            buildSearchFilterWidget,
            // all models list widget
            buildAllModelsListWidget,
            // charging stations card widget
            buildChargingStationsCardWidget,
            // car list
            buildCarListWidget,
            // togg trumore card widget
            buildToggTrumoreCardWidget,
          ],
        ),
      ),
    );
  }

  // main title get widget
  Widget get buildMainTitleWidget => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: titleLargeText(
          text: _homeStrings.mainHomeTitleText.text.toString(),
        ),
      );

  // search filter get widget
  Widget get buildSearchFilterWidget => const searchFilterSubWidget();

  // all models list get widget
  Widget get buildAllModelsListWidget => const allModelsListSubWidget();

  // charging stations card get widget
  Widget get buildChargingStationsCardWidget =>
      const chargingStationsCardSubWidget();

  // car list get widget
  Widget get buildCarListWidget => const carListSubWidget();

  // togg trumore card get widget
  Widget get buildToggTrumoreCardWidget => const toggTrumoreCardSubWidget();
}
