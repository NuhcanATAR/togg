import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// router page
import 'filter/azlist_filter.dart';
import 'filter/chargingtype_filter.dart';
import 'package:toggapp/screen/main_bottommenu/main_main_bottommenu.dart';

// model & database
import '../../base/chargingstation_base/base_chargingstation.dart';
import '../../model/chargingstation_model/chargingstation_model.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// ignore: camel_case_types
class chargingStationsListScreen extends StatefulWidget {
  const chargingStationsListScreen({super.key});

  @override
  State<chargingStationsListScreen> createState() =>
      _chargingStationsListScreenState();
}

// ignore: camel_case_types
class _chargingStationsListScreenState
    extends MainBaseChargingStationState<chargingStationsListScreen> {
  String cityFirst = cityList.first;

  @override
  void initState() {
    super.initState();
    cModel.chargingController.addListener(searchCar);
  }

  @override
  void dispose() {
    super.dispose();
    cModel.chargingController.removeListener(searchCar);
    cModel.chargingController.dispose();
  }

  void searchCar() async {
    String searchTerm = cModel.chargingController.text;
    if (searchTerm.isEmpty) {
      setState(() {
        searchChargingList = [];
      });
      return null;
    }

    QuerySnapshot snapshot = await searchCharging(searchTerm);
    setState(() {
      searchChargingList = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const mainBottomMenuScreen(),
            ),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        title: Text(
          "Sarj İstasyonları",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          // charging station search widget
          buildChargingStationSearchWidget,
          // charging stations list
          buildChargingStationsListWidget,
        ],
      ),
    );
  }

  // charging station search get widget
  Widget get buildChargingStationSearchWidget => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            // search
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: TextFormField(
                    controller: cModel.chargingController,
                    onChanged: (_) => searchCar,
                    decoration: InputDecoration(
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                        size: 21,
                      ),
                      hintText: "İstyasyon ara",
                      hintStyle: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            // filter
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  context: context,
                  builder: (context) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: dynamicHeight(0.22),
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 10,
                        right: 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: ListView(
                        children: <Widget>[
                          // A-Z list filter button widget
                          buildAZListFilterButtonWidget,
                          // charge type 1 button widget
                          buildChargeType1ButtonWidget,
                          // charge type 2 button widget
                          buildChargeType2ButtonWidget,
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: SizedBox(
                width: 48,
                height: 48,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Image.asset(
                      "assets/images/app_home_ico/icons8-filter-100.png"),
                ),
              ),
            ),
          ],
        ),
      );

  // A-Z list filter button get widget
  Widget get buildAZListFilterButtonWidget => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const azListFilterScreen(),
            ),
          ).whenComplete(() => {
                Navigator.pop(context),
              });
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.abc,
                  color: Colors.grey,
                  size: 22,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "A-Z Sırlama yap",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // city filter button get widget
  Widget get buildChargeType1ButtonWidget => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const chargingType1ListScreen(),
            ),
          ).whenComplete(() => {
                Navigator.pop(context),
              });
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.electric_bolt_outlined,
                  color: Colors.lightBlue,
                  size: 22,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "DC Yüksek Hızlı Şarj",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // charging type filter button get widget
  Widget get buildChargeType2ButtonWidget => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const chargingType2ListScreen(),
            ),
          ).whenComplete(() => {
                Navigator.pop(context),
              });
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.electric_bolt_outlined,
                  color: Colors.yellow,
                  size: 22,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "AC Hızlı Şarj",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // charging stations get list
  Widget get buildChargingStationsListWidget => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: ListView.builder(
            itemCount: searchChargingList.length,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot document = searchChargingList[index];
              return Card(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        // charge type
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: SizedBox(
                            width: 55,
                            height: 55,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0, 1),
                                    blurRadius: 1.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(125),
                                ),
                              ),
                              child: document['CHARGINGTYPE'] == "AC Hızlı Sarj"
                                  ? const Icon(
                                      Icons.electric_bolt_outlined,
                                      color: Colors.yellow,
                                      size: 21,
                                    )
                                  : const Icon(
                                      Icons.electric_bolt_outlined,
                                      color: Colors.lightBlue,
                                      size: 21,
                                    ),
                            ),
                          ),
                        ),
                        // charging information widget
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // adress
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    document['ADRESS'].toString(),
                                    style: GoogleFonts.nunito(
                                      textStyle: context
                                          .general.textTheme.titleMedium
                                          ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // city
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    document['CITY'].toString(),
                                    style: GoogleFonts.nunito(
                                      textStyle: context
                                          .general.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // charging type
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    document['CHARGINGTYPE'].toString(),
                                    style: GoogleFonts.nunito(
                                      textStyle: context
                                          .general.textTheme.bodyMedium
                                          ?.copyWith(
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
