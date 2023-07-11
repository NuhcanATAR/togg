import 'package:flutter/material.dart';

// pub dev
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// router page
import 'package:toggapp/screen/firstscreen/firstscreen.dart';

// model & database
import 'base/firstrouterscreen_base/firstrouter_base.dart';

// theme data
import 'package:toggapp/theme/mainthemecolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const buildRouterMain(),
  );
}

// ignore: camel_case_types
class buildRouterMain extends StatelessWidget {
  const buildRouterMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "/firstRouterScreen",
      // routes: {
      //   "/firstRouterScreen": (context) => const firstRouterScreen(),
      // },
      home: firstRouterScreen(),
    );
  }
}

// ignore: camel_case_types
class firstRouterScreen extends StatefulWidget {
  const firstRouterScreen({super.key});

  @override
  State<firstRouterScreen> createState() => _firstRouterScreenState();
}

// ignore: camel_case_types
class _firstRouterScreenState
    extends MainBaseFirstRouterState<firstRouterScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const firstScreen(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            // logo widget
            buildlogoWidget,
            // loading widget
            buildLoadingWidget,
          ],
        ),
      ),
    );
  }

  // logo get widget
  Widget get buildlogoWidget => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(120),
              child: Image.asset("assets/images/app_logo/logo.png"),
            ),
          ],
        ),
      );
  // loading get widget
  Widget get buildLoadingWidget => Positioned(
        bottom: 0,
        left: 10,
        right: 10,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: dynamicHeight(0.1),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // loading widget
                LoadingAnimationWidget.beat(
                    color: themeMainColorData.colorScheme.background, size: 25),

                Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Text(
                    "Lütfen Bekleyiniz",
                    style: GoogleFonts.nunito(
                      textStyle: context.general.textTheme.bodyMedium!.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
