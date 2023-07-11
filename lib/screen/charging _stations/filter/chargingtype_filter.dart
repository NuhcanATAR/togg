import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// model & database
import 'package:toggapp/base/chargingstation_base/base_chargingstation.dart';

// theme data
import '../../../theme/mainthemecolor.dart';

// ignore: camel_case_types
class chargingType1ListScreen extends StatefulWidget {
  const chargingType1ListScreen({super.key});

  @override
  State<chargingType1ListScreen> createState() =>
      _chargingType1ListScreenState();
}

// ignore: camel_case_types
class _chargingType1ListScreenState
    extends MainBaseChargingStationState<chargingType1ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        centerTitle: true,
        title: Text(
          "DC Yüksek Hızlı Sarj",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: cDb.charginType1Query,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const SizedBox();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox();
              }

              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
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
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
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
                                    child:
                                        data['CHARGINGTYPE'] == "AC Hızlı Sarj"
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
                                          data['ADRESS'].toString(),
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
                                          data['CITY'].toString(),
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
                                          data['CHARGINGTYPE'].toString(),
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
                  }).toList(),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                            "assets/images/app_modellist_ico/undraw_Warning_re_eoyh.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Sarj Bulunamadı",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.titleLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Aradığınız Sarj Türüne uygun istasyon \nbulunamadı!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.bodyLarge?.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class chargingType2ListScreen extends StatefulWidget {
  const chargingType2ListScreen({super.key});

  @override
  State<chargingType2ListScreen> createState() =>
      _chargingType2ListScreenState();
}

// ignore: camel_case_types
class _chargingType2ListScreenState
    extends MainBaseChargingStationState<chargingType2ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        centerTitle: true,
        title: Text(
          "AC Hızlı Sarj",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<QuerySnapshot>(
            stream: cDb.charginType2Query,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const SizedBox(
                  child: Text("hata"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  child: Text("hata"),
                );
              }

              if (snapshot.hasData &&
                  snapshot.data != null &&
                  snapshot.data!.docs.isNotEmpty) {
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
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
                                padding:
                                    const EdgeInsets.only(right: 15, left: 15),
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
                                    child:
                                        data['CHARGINGTYPE'] == "AC Hızlı Sarj"
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
                                          data['ADRESS'].toString(),
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
                                          data['CITY'].toString(),
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
                                          data['CHARGINGTYPE'].toString(),
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
                  }).toList(),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Image.asset(
                            "assets/images/app_modellist_ico/undraw_Warning_re_eoyh.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Sarj Bulunamadı",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.titleLarge?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "Aradığınız Sarj Türüne uygun istasyon \nbulunamadı!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            textStyle:
                                context.general.textTheme.bodyLarge?.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
