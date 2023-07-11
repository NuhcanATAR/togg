import 'package:flutter/material.dart';

// pub dev
import 'package:kartal/kartal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image_builder/cached_network_image_builder.dart';

// router page
import 'carlist_subwidget.dart';
import 'package:toggapp/screen/home/text_widget/body_medium_text.dart';

// model & database
import 'package:toggapp/base/home_base/home_base.dart';
// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

// part router
part '../../home/home_view/suballmodels_subwidget_strings.dart';

// ignore: camel_case_types
class allModelsListSubWidget extends StatefulWidget {
  const allModelsListSubWidget({super.key});

  @override
  State<allModelsListSubWidget> createState() => _allModelsListSubWidgetState();
}

// ignore: camel_case_types
class _allModelsListSubWidgetState
    extends MainBaseHomeState<allModelsListSubWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: buildBodyListWidget,
    );
  }

  // body list get widget
  Widget get buildBodyListWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.09),
        child: StreamBuilder<QuerySnapshot>(
          stream: serviceDB.modelListQuery,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("d");
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("a");
            }

            return ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => modelCarSegmentScreen(
                          data: data,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: bodyMediumTextBlack(
                      text: data['MODELNAME'].toString(),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      );
}

// ignore: camel_case_types
class modelCarSegmentScreen extends StatefulWidget {
  const modelCarSegmentScreen({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<modelCarSegmentScreen> createState() => _modelCarSegmentScreenState();
}

// ignore: camel_case_types
class _modelCarSegmentScreenState
    extends MainBaseHomeState<modelCarSegmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        title: Text(
          widget.data['MODELNAME'].toString(),
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("CARS")
              .where("MODELID", isEqualTo: widget.data['ID'])
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return snapshotHasErrorWidget;
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return snapshotConnectionWaitingWidget;
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
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
                                color:
                                    themeMainColorData.colorScheme.background,
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
                                          url:
                                              data['CARANADOLUIMG1'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 2
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG2'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 3
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG3'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 4
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG4'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 5
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG5'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 6
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG6'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 7
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG7'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 8
                                        CachedNetworkImageBuilder(
                                          url:
                                              data['CARANADOLUIMG8'].toString(),
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
                                                textStyle: context.general
                                                    .textTheme.bodyMedium
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
                                                textStyle: context.general
                                                    .textTheme.bodyMedium
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
            } else {
              return carNotFoundScreenWidget;
            }
          },
        ),
      ),
    );
  }

  // car not found screen get widget
  Widget get carNotFoundScreenWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                  "assets/images/app_modellist_ico/undraw_Warning_re_eoyh.png"),
            ),
            // title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                _homeSubAllModelsSubWidgetStrings.errorTitleText.text
                    .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                _homeSubAllModelsSubWidgetStrings.errorSubTitleText.text
                    .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  // snapshot has error get widget
  Widget get snapshotHasErrorWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                  "assets/images/app_modellist_ico/undraw_Warning_re_eoyh.png"),
            ),
            // title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                _homeSubAllModelsSubWidgetStrings.snapshotHasErrorTitleText.text
                    .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                _homeSubAllModelsSubWidgetStrings
                    .snapshotHasErrorSubTitleText.text
                    .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  // snapshot connection waiting get widget
  Widget get snapshotConnectionWaitingWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            LoadingAnimationWidget.beat(
              color: themeMainColorData.colorScheme.background,
              size: 65,
            ),
            // title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                _homeSubAllModelsSubWidgetStrings
                    .snapshotConnectionWaitingTitleText.text
                    .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // sub title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                _homeSubAllModelsSubWidgetStrings
                    .snapshotConnectionWaitingSubTitleText.text
                    .toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
