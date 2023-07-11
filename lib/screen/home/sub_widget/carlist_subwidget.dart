import 'package:flutter/material.dart';

// pub dev
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kartal/kartal.dart';
import 'package:readmore/readmore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

// router page
import '../../carlist_screen/carlist_screen.dart';
import 'package:toggapp/screen/home/text_widget/body_large_text.dart';
// model & database
import 'package:toggapp/base/home_base/home_base.dart';
// theme data
import '../../../theme/mainthemecolor.dart';
// part router
part '../home_view/carlist_subwidget_strings.dart';

// ignore: camel_case_types
class carListSubWidget extends StatefulWidget {
  const carListSubWidget({super.key});

  @override
  State<carListSubWidget> createState() => _carListSubWidgetState();
}

// ignore: camel_case_types
class _carListSubWidgetState extends MainBaseHomeState<carListSubWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // top widget
        buildTopWidget,
        // body widget
        buildBodyWidget,
      ],
    );
  }

  // top get widget
  Widget get buildTopWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: bodyLargeText(
                  text: _carListSubWidgetStrings.topTitleText.text.toString(),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const maincarListScreen(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: themeMainColorData.colorScheme.background,
                  size: 21,
                ),
              ),
            ],
          ),
        ),
      );

  // body get widget
  Widget get buildBodyWidget => StreamBuilder<QuerySnapshot>(
        stream: serviceDB.carListQuery,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }

          return Column(
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
                            padding: const EdgeInsets.only(left: 35, right: 35),
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
                                          data['ENERGYCONSUMPTION'].toString(),
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
      );
}

// ignore: camel_case_types
class carDetailPage extends StatefulWidget {
  const carDetailPage({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  State<carDetailPage> createState() => _carDetailPageState();
}

// ignore: camel_case_types
class _carDetailPageState extends MainBaseHomeState<carDetailPage> {
  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  Future<void> checkFavoriteStatus() async {
    final collectionRef = FirebaseFirestore.instance.collection("FAVORITE");

    final querySnapshot = await collectionRef
        .where('USERID', isEqualTo: serviceDB.userID)
        .where('CARID', isEqualTo: widget.data['ID'])
        .get();

    setState(() {
      modelService.isFavoriteStatus = querySnapshot.docs.isNotEmpty;
    });
  }

  void favoriteADD() async {
    final collectionRef = FirebaseFirestore.instance.collection("FAVORITE");

    final querySnapshot = await collectionRef
        .where('USERID', isEqualTo: serviceDB.userID)
        .where('CARID', isEqualTo: widget.data['ID'])
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Belge mevcutsa, belgeyi kaldırın
      final docID = querySnapshot.docs.first.id;
      await collectionRef.doc(docID).delete();

      setState(() {
        modelService.isFavoriteStatus = false;
      });
    } else {
      // Favori değilse, belgeyi ekleyin
      final newDocumentRef = await collectionRef.add({
        'ID': null,
        'USERID': serviceDB.userID,
        'CARID': widget.data['ID'],
      });
      final docID = newDocumentRef.id;

      await newDocumentRef.update({'ID': docID});

      setState(() {
        modelService.isFavoriteStatus = true;
      });
    }
  }

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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () => favoriteADD(),
              child: Icon(
                modelService.isFavoriteStatus
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: modelService.isFavoriteStatus
                    ? Colors.redAccent
                    : Colors.red,
                size: 21,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          // car image widget
          buildcarimgsWidget,
          // acceleration value &  motor power value widget
          buildAccelerationAndMotoPowerValueWidget,
          // car name widget
          buildCarNameWidget,
          // the car about explanation  widget
          carAboutExplanationWidget,
          // vehicle features widget
          buildVehicleFeaturesWidget,
        ],
      ),
    );
  }

  // car image get widget
  Widget get buildcarimgsWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.65),
        child: ContainedTabBarView(
          tabs: [
            // anadolu
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#BE645C"),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ),
            // gemlik
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#637982"),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ),
            // kapadokya
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#CCBCB5"),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ),
            // kula
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#757575"),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ),
            // oltu
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#5A5A5A"),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ),
            // pamukkale
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                width: 25,
                height: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: HexColor("#FFFFFF"),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.5,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ),
          ],
          views: [
            // anadolu widget
            anadoluSliderCardWidget,
            // gemlik widget
            gemlikSliderCardWidget,
            // kapadokya widget
            kapadokyaSliderCardWidget,
            // kula widget
            kulaSliderCardWidget,
            // oltu widget
            oltuSliderCardWidget,
            // pamukkale widget
            pamukkaleSliderCardWidget,
          ],
          tabBarProperties: const TabBarProperties(
            indicatorColor: Colors.transparent,
          ),
        ),
      );

  // anadolu color slider card get widget
  Widget get anadoluSliderCardWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.45),
        child: CarouselSlider(
          items: [
            // car img 1
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG1'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 2
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG2'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 3
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG3'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 4
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG4'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 5
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG5'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 6
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG6'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 7
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG7'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 8
            CachedNetworkImageBuilder(
              url: widget.data['CARANADOLUIMG8'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
          ],
          options: CarouselOptions(
            height: dynamicHeight(0.45),
            autoPlay: false,
          ),
        ),
      );

  // gemlik color slider card get widget
  Widget get gemlikSliderCardWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.45),
        child: CarouselSlider(
          items: [
            // car img 1
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG1'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 2
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG2'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 3
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG3'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 4
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG4'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 5
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG5'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 6
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG6'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 7
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG7'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 8
            CachedNetworkImageBuilder(
              url: widget.data['CARGEMLIKIMG8'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
          ],
          options: CarouselOptions(
            height: dynamicHeight(0.45),
            autoPlay: false,
          ),
        ),
      );

  // kapadokya color slider card get widget
  Widget get kapadokyaSliderCardWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.45),
        child: CarouselSlider(
          items: [
            // car img 1
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG1'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 2
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG2'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 3
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG3'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 4
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG4'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 5
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG5'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 6
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG6'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 7
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG7'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 8
            CachedNetworkImageBuilder(
              url: widget.data['CARKAPADOKYAIMG8'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
          ],
          options: CarouselOptions(
            height: dynamicHeight(0.45),
            autoPlay: false,
          ),
        ),
      );

  // kula color slider card get widget
  Widget get kulaSliderCardWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.45),
        child: CarouselSlider(
          items: [
            // car img 1
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG1'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 2
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG2'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 3
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG3'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 4
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG4'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 5
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG5'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 6
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG6'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 7
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG7'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 8
            CachedNetworkImageBuilder(
              url: widget.data['CARKULAIMG8'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
          ],
          options: CarouselOptions(
            height: dynamicHeight(0.45),
            autoPlay: false,
          ),
        ),
      );

  // oltu color slider card get widget
  Widget get oltuSliderCardWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.45),
        child: CarouselSlider(
          items: [
            // car img 1
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG1'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 2
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG2'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 3
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG3'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 4
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG4'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 5
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG5'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 6
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG6'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 7
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG7'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 8
            CachedNetworkImageBuilder(
              url: widget.data['CAROLTUIMG8'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
          ],
          options: CarouselOptions(
            height: dynamicHeight(0.45),
            autoPlay: false,
          ),
        ),
      );

  // pamukkale color slider card get widget
  Widget get pamukkaleSliderCardWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.45),
        child: CarouselSlider(
          items: [
            // car img 1
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG1'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 2
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG2'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 3
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG3'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 4
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG4'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 5
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG5'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 6
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG6'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 7
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG7'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
            // car img 8
            CachedNetworkImageBuilder(
              url: widget.data['CARPAMUKKALEIMG8'].toString(),
              builder: (image) => Image.file(image),
              placeHolder: const SizedBox(),
              errorWidget: const SizedBox(),
            ),
          ],
          options: CarouselOptions(
            height: dynamicHeight(0.45),
            autoPlay: false,
          ),
        ),
      );

  // acceleration value &  motor power value get widget
  Widget get buildAccelerationAndMotoPowerValueWidget => Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: <Widget>[
            // acceleration value widget
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.data['ACCELERATION'],
                    style: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Hızlanma",
                    style: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // veritical line widget
            Container(
              height: 55,
              width: 1,
              decoration: const BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),

            // motor power value widget
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.data['MOTORPOWER'],
                    style: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Motor Gücü",
                    style: GoogleFonts.nunito(
                      textStyle:
                          context.general.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  // car name get widget
  Widget get buildCarNameWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
          child: Text(
            widget.data['CARNAME'].toString(),
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );

  // the car about explanation get widget
  Widget get carAboutExplanationWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: ReadMoreText(
            'Araç gücünü lityum iyon pillerden almaktadır. Tek şarj ile batarya kapasitesine göre 300 km ve 500 km menzile sahip iki farklı güç paketi sunulacaktır. Aracın bataryalarının 30 dakikadan kısa sürede %80 şarj edilebilmesi planlanmaktadır.[15] Araçta yer alacak rejeneratif fren sistemi ile yavaşlamalarda motorların dinamo gibi çalışması ve pili tekrar şarj ederek menzili %20 ye kadar uzatması planlanmaktadır. ',
            trimLines: 4,
            style: GoogleFonts.nunito(
              textStyle: context.general.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
              ),
            ),
            colorClickableText: Colors.black54,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Daha fazla',
            trimExpandedText: 'Daha az',
            moreStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      );

  // vehicle features get widget
  Widget get buildVehicleFeaturesWidget => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: dynamicHeight(4.0),
          child: ContainedTabBarView(
            tabs: const [
              Text("Teknik Özellikler"),
              Text("Donanım"),
            ],
            views: [
              // technical specifications widget
              technicalSpecificationsWidget,
              // hardware specifications widget
              hardwareSpecificationsWidget,
            ],
            tabBarProperties: TabBarProperties(
              unselectedLabelColor: Colors.black54,
              labelColor: Colors.black,
              indicatorColor: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      );

  // Technicial Specifications get widget
  Widget get technicalSpecificationsWidget => Column(
        children: <Widget>[
          // vehicle features card
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Araç Model Yılı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['MODELYEAR'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Araç Tipi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['CARTYPE'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Kasa Tipi / Kapı Sayısı ",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['CASETYPE'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Motor Tipi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['ENGINETYPE'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Üretim Yılı  (İlk / Son)",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['YEAROFPRODUCTION'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Motor Gücü",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['MOTORPOWER'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Şanzıman",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['TRANSMISSION'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Hızlanma 0-100 km/saat",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['ACCELERATION'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Azami Sürat",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['SPEEDLIMIT'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Tork",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['TORQUE'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Koltuk Sayısı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['NUMBEROFSEATS'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Uzunluk",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['LENGTH'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Genişlik",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['WIDTH'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Yükseklik",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['HEIGHT'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Net Ağırlık",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['NETWEIGHT'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Bagaj Kapasitesi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['LUGGAGECAPACITY'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Menzil",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['RANGE'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Batarya Tipi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['BATTERYTYPE'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Text(
                      "Enerji Tüketimi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Text(
                      widget.data['ENERGYCONSUMPTION'].toString(),
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  // hardware specifications get widget
  Widget get hardwareSpecificationsWidget => Column(
        children: <Widget>[
          // vehicle features card
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "ABS",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['ABS'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Çarpışma Uyarı Sistemi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['COLLISIONWARNINGLOWSPEEDBRAKE'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Geri Görüş Aynası",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['REARWINDOW'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Şerit Takip Sistemi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['LANEFOLLOW'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Yokuşta Kalkış Desteği",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['HILLSTARTSUPPORT'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Arka Çapraz Trafik Uyarısı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['REARCROSSTRAFFICWARNING'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Isofix Hazırlığı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['ISOFIXPREPARATION'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Yan Hava Yastığı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['SIDEAIRBAG'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Mobil Telefon Hazırlığı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['MOBILEPHONEPREPARATION'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Navigasyon",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['NAVIGATION'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Sesli Kumanda Sistemi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['VOICECONTROL'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Portatif Müzik Cihazları Bağlantısı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['PORTABLEMUSICDEVICES'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Ön Koltuk Kol Dayaması",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['FRONTSEATARMREST'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Arka Koltuk Kol Dayaması",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['REASEATARMREST'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Ön Sis Farları",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['PRECISPHERES'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Ön Cam Silecekleri - Yağmur Sensörü",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['WINDSCREENWIPERRAINSENSOR'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Yan Aynalar - Isıtmalı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['SIDEMIRRORSHEATED'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Elektrikli Katlanabilen Aynalar",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['ELECTRICFOLDINGMIRROR'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Yan Aynalar - Sinyaller",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['SIDEMIRRORSSIGNAL'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Hidrolik Direksiyon",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['HYDROLICWHEEL'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Yenileyici Frenler",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['REFRESHINGBRAKES'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "ESP (Denge Kontrolü)",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['ESPBALANCECONTROL'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Ön Far Ayarlama - Otomatik Yanan Farlar",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['HEADBEAMADJUSTMENTAUTOHIGHBEAM'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Dahili uygulamalar",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['INTERNALAPPLICATION'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Bluetooth",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['BLUETOOTH'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Elektrikli Camlar",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['ELECTRICWINDOWS'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Ön Koltuk - Isıtmalı",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['FRONTSEATARMREST'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Park Mesafe Sensörü",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['PARKDISTANCESENSOR'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Klima",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['AIRCONDITIONING'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.11),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Koltuk Döşemesi - Döşeme Malzemesi",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: widget.data['SEATFLOOR'] == true
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-tick-60.png"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                "assets/images/app_cardetail_pageico/icons8-close-96.png"),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
