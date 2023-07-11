import 'package:flutter/material.dart';

// pub dev
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image_builder/cached_network_image_builder.dart';

// router page
import '../home/sub_widget/carlist_subwidget.dart';
import 'package:toggapp/screen/main_bottommenu/main_main_bottommenu.dart';

// model & database
import 'package:toggapp/base/home_base/home_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

void main() async {
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const maincarListScreen(),
  );
}

// ignore: camel_case_types
class maincarListScreen extends StatelessWidget {
  const maincarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: carListScreen(),
    );
  }
}

// ignore: camel_case_types
class carListScreen extends StatefulWidget {
  const carListScreen({super.key});

  @override
  State<carListScreen> createState() => _carListScreenState();
}

// ignore: camel_case_types
class _carListScreenState extends MainBaseHomeState<carListScreen> {
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
        centerTitle: true,
        title: Text(
          "Araç Listesi",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 1,
          right: 1,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: serviceDB.carListQuery,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  margin: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: dynamicHeight(1.15),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          // car type
                          Positioned(
                            right: 25,
                            top: 25,
                            child: Icon(
                              Icons.electric_car_sharp,
                              color: themeMainColorData.colorScheme.background,
                              size: 25,
                            ),
                          ),
                          // car name
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 55,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 35, right: 35),
                              child: Center(
                                child: Text(
                                  data['CARNAME'].toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    textStyle: context
                                        .general.textTheme.titleLarge
                                        ?.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // car info
                          Column(
                            children: <Widget>[
                              // car image
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: dynamicHeight(0.75),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 75,
                                  ),
                                  child: CarouselSlider(
                                    items: [
                                      // car img 1
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG1'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 2
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG2'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 3
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG3'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 4
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG4'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 5
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG5'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 6
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG6'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 7
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG7'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                      // car img 8
                                      CachedNetworkImageBuilder(
                                        url: data['CARANADOLUIMG8'].toString(),
                                        builder: (image) => Image.file(image),
                                        placeHolder: const SizedBox(),
                                        errorWidget: const SizedBox(),
                                      ),
                                    ],
                                    options: CarouselOptions(
                                      height: dynamicHeight(0.70),
                                      autoPlay: false,
                                    ),
                                  ),
                                ),
                              ),
                              // car : battery value
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // battary type
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.local_gas_station_rounded,
                                            color: themeMainColorData
                                                .colorScheme.background,
                                            size: 21,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data['BATTERYTYPE'].toString(),
                                            style: GoogleFonts.nunito(
                                              textStyle: context
                                                  .general.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // energy value
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.energy_savings_leaf_sharp,
                                            color: themeMainColorData
                                                .colorScheme.background,
                                            size: 21,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            data['ENERGYCONSUMPTION']
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunito(
                                              textStyle: context
                                                  .general.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // details button
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          carDetailPage(data: data),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: dynamicHeight(0.14),
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: themeMainColorData
                                            .colorScheme.background,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: Text(
                                        "Detaylı bilgi",
                                        style: GoogleFonts.nunito(
                                          textStyle: context
                                              .general.textTheme.bodyMedium
                                              ?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
