import 'package:flutter/material.dart';

// pub dev
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:kartal/kartal.dart';

// router page
import '../log_reg_pas/login/login.dart';
import 'package:toggapp/screen/log_reg_pas/register/register.dart';

// base
import '../../base/firstscreen_base/firstscreen_base.dart';

// ignore: camel_case_types
class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

// ignore: camel_case_types
class _firstScreenState extends MainBaseFirstScreenState<firstScreen> {
  @override
  void initState() {
    super.initState();
    _controller = CachedVideoPlayerController.asset('assets/videos/video.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setVolume(0);
        _controller.setLooping(true);

        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  late CachedVideoPlayerController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            // background video
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: buildBackVideoWidget,
            ),
            // build body widget
            buildMainBodyWidget,
          ],
        ),
      ),
    );
  }

  // build body get widget
  Widget get buildBackVideoWidget => SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size.width,
            height: _controller.value.size.height,
            child: CachedVideoPlayer(
              _controller,
            ),
          ),
        ),
      );

  // build main body get widget
  Widget get buildMainBodyWidget => Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 0,
        child: Container(
          color: Colors.black54.withOpacity(0.4),
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              buildTitleSubTitleWidget,
              buildLoginRegButtonWidget,
            ],
          ),
        ),
      );

  // title sub title get widget
  Widget get buildTitleSubTitleWidget => Column(
        children: <Widget>[
          const SizedBox(
            height: 45,
          ),
          // title widget
          FadeInUp(
            duration: const Duration(seconds: 1),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "TOGG'un Teknolojik Dünyasına Hoşgeldiniz!",
                  style: GoogleFonts.nunito(
                    textStyle:
                        context.general.textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, 1),
                          blurRadius: 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // sub title widget
          FadeInUp(
            duration: const Duration(seconds: 1),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "TOGG hakkında detaylı bilgi almak ve incelemek için giriş yapınız.",
                  style: GoogleFonts.nunito(
                    textStyle: context.general.textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, 1),
                          blurRadius: 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  // buil login / register button get widget
  Widget get buildLoginRegButtonWidget => Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Column(
          children: <Widget>[
            // // login button
            FadeInUp(
              duration: const Duration(seconds: 1),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const loginScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: dynamicHeight(0.08),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/app_imgback/loginbutton_img.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: dynamicHeight(0.08),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black54.withOpacity(0.3),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        "Giriş yap",
                        style: GoogleFonts.nunito(
                          textStyle:
                              context.general.textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                            shadows: const [
                              Shadow(
                                color: Colors.black,
                                offset: Offset(0, 1),
                                blurRadius: 0.1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // register button
            FadeInUp(
              duration: const Duration(seconds: 2),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const mainRegisterFirstScreen(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: dynamicHeight(0.08),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      "Hesap Oluştur",
                      style: GoogleFonts.nunito(
                        textStyle:
                            context.general.textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      );
}
