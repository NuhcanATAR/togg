import 'package:flutter/material.dart';

// pub dev
import 'package:cached_network_image_builder/cached_network_image_builder.dart';

// router page
import '../text_widget/body_medium_text.dart';
import '../text_widget/headline_medium_text.dart';

// model & database
import 'package:toggapp/base/home_base/home_base.dart';

// router part
part '../home_view/toggtrumore_cardssubwidget_strings.dart';

// ignore: camel_case_types
class toggTrumoreCardSubWidget extends StatefulWidget {
  const toggTrumoreCardSubWidget({super.key});

  @override
  State<toggTrumoreCardSubWidget> createState() =>
      _toggTrumoreCardSubWidgetState();
}

// ignore: camel_case_types
class _toggTrumoreCardSubWidgetState
    extends MainBaseHomeState<toggTrumoreCardSubWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 25, bottom: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.85),
        child: CachedNetworkImageBuilder(
          url: "https://ares.shiftdelete.net/2023/01/togg-truemore-1.jpg",
          builder: (image) => Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // title widget
                buildTitleTextWidget,
                // sub title widget
                buildSubTitleTextWidget,
                // google play button widget
                buildGooglePlayWidget,
              ],
            ),
          ),
          placeHolder: const SizedBox(),
          errorWidget: const SizedBox(),
          imageExtensions: const ["jpg", "jpg", "vsf"],
        ),
      ),
    );
  }

  // title text get widget
  Widget get buildTitleTextWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: headlineMediumTextWhite(
          text: _toggtrumoreCardSubWidgetString.cardTitleText.text.toString(),
        ),
      );

  // sub title text get widget
  Widget get buildSubTitleTextWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: bodyMediumTextWhite(
          text: _toggtrumoreCardSubWidgetString.cardSubTitlText.text.toString(),
        ),
      );

  // google play button get widget
  Widget get buildGooglePlayWidget => Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
          top: 25,
        ),
        child: GestureDetector(
          onTap: () => launchURL(),
          child: SizedBox(
            width: 150,
            height: 50,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  // google play icon
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset(
                        "assets/images/app_home_ico/icons8-google-play-48.png"),
                  ),
                  //
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        // title
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: bodyMediumTextWhite(
                            text: _toggtrumoreCardSubWidgetString
                                .cardDownloadTitleText.text
                                .toString(),
                          ),
                        ),
                        // sub title
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: bodyMediumTextWhiteBold(
                            text: _toggtrumoreCardSubWidgetString
                                .cardDownloadSubTitleText.text
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
