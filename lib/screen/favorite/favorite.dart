import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:cached_network_image_builder/cached_network_image_builder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';

// router page
import '../home/sub_widget/carlist_subwidget.dart';

// model & database
import '../../base/favorite_base/base_favorite.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends MainBaseFavoriteState<FavoriteScreen> {
  late String userId;

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Favoriler",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: getFavoriteCarsByUserIdStream(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loadingScreenWidget;
            } else if (snapshot.hasError) {
              return buildFavoriteErrorWidget;
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return buildNoFavoriteCarFoundWidget;
            } else {
              final favoriteCars = snapshot.data!;
              return ListView.builder(
                itemCount: favoriteCars.length,
                itemBuilder: (context, index) {
                  final car = favoriteCars[index];
                  return Card(
                    margin: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
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
                                    car['CARNAME'].toString(),
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
                                  height: dynamicHeight(0.4),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 75,
                                    ),
                                    child: CarouselSlider(
                                      items: [
                                        // car img 1
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG1'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 2
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG2'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 3
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG3'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 4
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG4'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 5
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG5'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 6
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG6'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 7
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG7'].toString(),
                                          builder: (image) => Image.file(image),
                                          placeHolder: const SizedBox(),
                                          errorWidget: const SizedBox(),
                                        ),
                                        // car img 8
                                        CachedNetworkImageBuilder(
                                          url: car['CARANADOLUIMG8'].toString(),
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
                                              car['BATTERYTYPE'].toString(),
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
                                              car['ENERGYCONSUMPTION']
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
                                            carDetailPage(data: car),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height: dynamicHeight(0.08),
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
              );
            }
          },
        ),
      ),
    );
  }

  // no favorite car found screen get widget
  Widget get buildNoFavoriteCarFoundWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                  "assets/images/app_favorite_ico/undraw_electric_car_b7hl.png"),
            ),
            // title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Henüz Favori Araç Eklemediniz!",
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
                "Favori TOGG Aracınızı Henüz Eklemediniz.",
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

  // favorite screen error screen get widget
  Widget get buildFavoriteErrorWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // image
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                  "assets/images/app_modellist_ico/undraw_Warning_re_eoyh.png"),
            ),
            // title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Bilinmeyen Bir Nedenden Dolayı Hata",
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
                "Lütfen daha sonra tekrar deneyiniz",
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

  // loading screen get widget
  Widget get loadingScreenWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // loading widget
            LoadingAnimationWidget.beat(
              color: themeMainColorData.colorScheme.background,
              size: 55,
            ),
            // title
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "Araçlar Yükleniyor",
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
                "Lütfen Bekleyiniz...",
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
