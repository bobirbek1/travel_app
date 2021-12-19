import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/data/resourses/colors.dart';
import 'package:travel_app/data/resourses/icons.dart';
import 'package:travel_app/data/resourses/images.dart';
import 'package:travel_app/widgets/divider.dart';
import 'package:travel_app/widgets/indicator.dart';

class EntranceScreen extends StatefulWidget {
  EntranceScreen({Key? key}) : super(key: key);

  final listImages = [
    {"image": AppImages.entranceLondon, "name": "London"},
    {"image": AppImages.entranceAmsterdam, "name": "Amsterdam"},
    {"image": AppImages.entranceAmsterdam, "name": "Amsterdam"},
    {"image": AppImages.entranceLondon, "name": "London"},
    {"image": AppImages.entranceLondon, "name": "London"},
    {"image": AppImages.entranceLondon, "name": "London"},
    {"image": AppImages.entranceAmsterdam, "name": "Amsterdam"},
  ];

  @override
  State<StatefulWidget> createState() => _EntranceScreenState();
}

class _EntranceScreenState extends State<EntranceScreen> {
  late final PageController _controller;
  var index = 0;
  Size? size;

  var isSearchActive = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void updatePage(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            getBackgroundImage(),
            Positioned(
              left: calcSizeWidth(29),
              top: calcSizeHeight(39),
              child: const Text(
                "Let's GO!",
                style: TextStyle(
                  color: Color(
                    AppColors.splashText1,
                  ),
                  fontFamily: "Roboto",
                  letterSpacing: 1.2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: calcSizeHeight(68),
              child: const AppDivider(
                Colors.white,
              ),
            ),
            Positioned(
              top: calcSizeHeight(86),
              left: calcSizeWidth(27),
              right: calcSizeWidth(100),
              child: Text(
                "Choose \nyour city",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: calcSizeHeight(48),
                  fontFamily: "PlayfairDisplay",
                ),
              ),
            ),
            getSearch(),
            getCenterCard(),
            getPageView(),
            Positioned(
              left: calcSizeWidth(41),
              right: calcSizeWidth(41),
              bottom: calcSizeHeight(152),
              child: Text(
                widget.listImages[index]["name"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 24,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            getIndicator(),
            Positioned(
              bottom: calcSizeHeight(33),
              left: calcSizeWidth(27),
              right: calcSizeWidth(27),
              child: getBluredButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBluredButton() {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            height: calcSizeHeight(64),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                5,
              ),
              color: Colors.white.withOpacity(0.2),
            ),
            child: const Text(
              "EXPLORE THE CITY",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 16,
                letterSpacing: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  calcSizeHeight(double height) {
    return size!.height / 812 * height;
  }

  calcSizeWidth(double width) {
    return size!.width / 375 * width;
  }

  getCenterCard() {
    return Container(
      width: double.infinity,
      height: calcSizeHeight(450),
      margin: EdgeInsets.only(
        left: calcSizeWidth(27),
        right: calcSizeWidth(27),
        top: calcSizeHeight(230),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget getBackgroundImage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: Container(
        key: ValueKey<String>(widget.listImages[index]["image"]!),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.listImages[index]["image"]!),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Container(),
        ),
      ),
    );
  }

  getPageView() {
    return Container(
      width: double.infinity,
      height: calcSizeHeight(369),
      margin: EdgeInsets.only(
        left: calcSizeWidth(41),
        right: calcSizeWidth(41),
        top: calcSizeHeight(246),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: PageView.builder(
          controller: _controller,
          itemCount: widget.listImages.length,
          onPageChanged: (index) {
            updatePage(index);
          },
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      widget.listImages[index]["image"]!,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(5),
              ),
            );
          }),
    );
  }

  getIndicator() {
    return Container(
      height: calcSizeHeight(21),
      margin: EdgeInsets.only(
        top: calcSizeHeight(669),
        left: calcSizeWidth(118),
        right: calcSizeWidth(118),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DotsIndicator(
        controller: _controller,
        itemCount: widget.listImages.length,
        onPageSelected: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(
              milliseconds: 1000,
            ),
            curve: Curves.ease,
          );
        },
        color: const Color(AppColors.dotColor),
      ),
    );
  }

  getSearch() {
    return InkWell(
      child: Container(
        width: calcSizeWidth(40),
        height: calcSizeHeight(40),
        margin: EdgeInsets.only(
          top: calcSizeHeight(46),
          left: calcSizeWidth(315),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: calcSizeWidth(10),
          vertical: calcSizeHeight(10),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          AppIcons.search,
        ),
      ),
      onTap: () {
        isSearchActive = true;
      },
    );
  }
}
