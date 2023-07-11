// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

// router page
import 'package:toggapp/screen/profile_screen/text_widget/body_medium_text.dart';
import 'package:toggapp/screen/profile_screen/text_widget/title_large_text.dart';

// model & database
import 'package:toggapp/base/profile_base/base_profile.dart';

// theme data
import '../../../theme/mainthemecolor.dart';

// part router
part '../profile_view/phonenumberpg_strings.dart';

class phoneUPDScreen extends StatefulWidget {
  const phoneUPDScreen({super.key});

  @override
  State<phoneUPDScreen> createState() => _phoneUPDScreenState();
}

class _phoneUPDScreenState extends MainBaseProfilState<phoneUPDScreen> {
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
          "Telefon Numarası Güncelle",
          style: GoogleFonts.nunito(
            textStyle: context.general.textTheme.bodyMedium?.copyWith(
              color: themeMainColorData.colorScheme.background,
            ),
          ),
        ),
      ),
      body: Form(
        key: pModel.formSaveKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              // main body widget
              buildMainBodyWidget,
              // button widget
              buildButtonWidget,
            ],
          ),
        ),
      ),
    );
  }

  // main body get widget
  Widget get buildMainBodyWidget => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            // title & sub title
            buildTitleSubTitleWidget,
            // input
            buildinputWidget,
          ],
        ),
      );

  // title & sub title get widget
  Widget get buildTitleSubTitleWidget => Column(
        children: <Widget>[
          // title
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: titleLargeText(
              text: _phoneNumberScreenStrings.titleText.text.toString(),
            ),
          ),
          // sub title
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: bodyMediumText(
              text: _phoneNumberScreenStrings.subTitleText.text.toString(),
            ),
          ),
        ],
      );
  // input get widget
  Widget get buildinputWidget => Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: <Widget>[
            // top
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: bodyMediumText(
                  text: _phoneNumberScreenStrings.inputTopText.text.toString(),
                ),
              ),
            ),
            // input
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: TextFormField(
                  controller: pModel.phoneNumberController,
                  validator: pModel.phoneNumberValidator,
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  // button get widget
  Widget get buildButtonWidget => Positioned(
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            if (pModel.formSaveKey.currentState!.validate()) {
              phoneNumberUPDdb();
            }
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: dynamicHeight(0.07),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: themeMainColorData.colorScheme.background,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: Text(
                "Güncelle",
                style: GoogleFonts.nunito(
                  textStyle: context.general.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
