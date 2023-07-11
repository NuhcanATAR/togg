import 'package:flutter/material.dart';

// pub dev
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import 'carlist_subwidget.dart';

// theme data
import '../../../theme/mainthemecolor.dart';

// model & database
import '../../../base/home_base/home_base.dart';

// ignore: camel_case_types
class searchFilterSubWidget extends StatefulWidget {
  const searchFilterSubWidget({super.key});

  @override
  State<searchFilterSubWidget> createState() => _searchFilterSubWidgetState();
}

// ignore: camel_case_types
class _searchFilterSubWidgetState
    extends MainBaseHomeState<searchFilterSubWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: buildSearchWidget,
      ),
    );
  }

  // search get widget
  Widget get buildSearchWidget => Expanded(
        flex: 5,
        child: Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Row(
            children: <Widget>[
              const Icon(
                Icons.search,
                color: Colors.grey,
                size: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const mainSearchScreen(),
                    ),
                  ),
                  child: Text(
                    "Arama yapınız",
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

// ignore: camel_case_types
class mainSearchScreen extends StatefulWidget {
  const mainSearchScreen({super.key});

  @override
  State<mainSearchScreen> createState() => _mainSearchScreenState();
}

// ignore: camel_case_types
class _mainSearchScreenState extends MainBaseHomeState<mainSearchScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    searchController.addListener(searchCar);
  }

  @override
  void dispose() {
    super.dispose();
    searchController.removeListener(searchCar);
    searchController.dispose();
  }

  void searchCar() async {
    String searchTerm = searchController.text;
    if (searchTerm.isEmpty) {
      setState(() {
        searchCarList = [];
      });
      return null;
    }

    QuerySnapshot snapshot = await searchCars(searchTerm);
    setState(() {
      searchCarList = snapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: themeMainColorData.colorScheme.background,
            size: 21,
          ),
        ),
        title: Text(
          "Araç Arama",
          style: GoogleFonts.nunito(
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: themeMainColorData.colorScheme.background,
                ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          // search filter widget
          buildSearchFilterWidget,
          // car list
          buildCarListWidget,
        ],
      ),
    );
  }

  Widget get buildSearchFilterWidget => Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (_) => searchCar,
                        style: GoogleFonts.nunito(
                          textStyle:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black54,
                                  ),
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          icon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 20,
                          ),
                          hintText: "Araç adı giriniz",
                          hintStyle: GoogleFonts.nunito(
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.black54,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      );

  Widget get buildCarListWidget => Expanded(
        child: ListView.builder(
          itemCount: searchCarList.length,
          itemBuilder: (context, index) {
            QueryDocumentSnapshot document = searchCarList[index];

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
                              document['CARNAME'].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                textStyle: context.general.textTheme.titleLarge
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
                                    url: document['CARANADOLUIMG1'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 2
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG2'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 3
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG3'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 4
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG4'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 5
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG5'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 6
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG6'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 7
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG7'].toString(),
                                    builder: (image) => Image.file(image),
                                    placeHolder: const SizedBox(),
                                    errorWidget: const SizedBox(),
                                  ),
                                  // car img 8
                                  CachedNetworkImageBuilder(
                                    url: document['CARANADOLUIMG8'].toString(),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        document['BATTERYTYPE'].toString(),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        document['ENERGYCONSUMPTION']
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
                                  builder: (context) => carDetailPage(
                                      data: document.data()
                                          as Map<String, dynamic>),
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
          },
        ),
      );
}
