import 'package:flutter/material.dart';

// pub dev
import 'package:cached_network_image_builder/cached_network_image_builder.dart';

// router page
import '../../charging _stations/chargingstations_list.dart';
import '../text_widget/body_medium_text.dart';
import '../text_widget/headline_small_text.dart';

// model & database
import 'package:toggapp/base/home_base/home_base.dart';

// part router
part '../home_view/chargingstationsubcard_strings.dart';

// ignore: camel_case_types
class chargingStationsCardSubWidget extends StatefulWidget {
  const chargingStationsCardSubWidget({super.key});

  @override
  State<chargingStationsCardSubWidget> createState() =>
      _chargingStationsCardSubWidgetState();
}

// ignore: camel_case_types
class _chargingStationsCardSubWidgetState
    extends MainBaseHomeState<chargingStationsCardSubWidget> {
  final String backimgURL =
      "https://www.donanimhaber.com/images/images/haber/150246/src/togg-kendi-sarj-istasyonu-agini-kurmak-icin-lisans-aldi150246_0.jpg";
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: dynamicHeight(0.40),
        child: CachedNetworkImageBuilder(
          url: backimgURL.toString(),
          builder: (image) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54.withOpacity(0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Row(
                children: <Widget>[
                  // title text & sub title widget
                  cardbackimgBuildTitleSubTitleWidget,
                  // details button widget
                  cardbackimgBuildDetailsPageButtonWidget,
                ],
              ),
            ),
          ),
          placeHolder: backimgPlaceHolderWidget,
          errorWidget: backimgErrorWidget,
          imageExtensions: const ["jpg", "png", "vsf"],
        ),
      ),
    );
  }

  // card back image build title & sub title get widget
  Widget get cardbackimgBuildTitleSubTitleWidget => Expanded(
        flex: 6,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // title widget
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: headlineSmallWhiteText(
                    text: _charginstationCardStrings.cardTitleText.text
                        .toString(),
                  ),
                ),
              ),
              // sub title widget
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: bodyMediumTextWhite(
                    text: _charginstationCardStrings.cardSubTitleText.text
                        .toString(),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  // details button get widget
  Widget get cardbackimgBuildDetailsPageButtonWidget => Flexible(
        fit: FlexFit.tight,
        flex: 1,
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const chargingStationsListScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 35,
              shadows: [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 1),
                  blurRadius: 1.0,
                ),
              ],
            ),
          ),
        ),
      );
  // card back image placeholder get widget
  Widget get backimgPlaceHolderWidget => Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      );

  // card back image error get widget
  Widget get backimgErrorWidget => Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      );
}
