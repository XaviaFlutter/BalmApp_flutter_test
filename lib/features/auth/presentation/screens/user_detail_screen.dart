import 'package:auto_route/auto_route.dart';
import 'package:balm_test/core/style/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class UserDetailScreen extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String lat;
  final String lng;
  final String phone;
  final String website;
  final String companyName;
  final String companyPhrase;
  final String bs;

  const UserDetailScreen({
    Key? key,
    required this.username,
    required this.name,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.lat,
    required this.lng,
    required this.phone,
    required this.website,
    required this.companyName,
    required this.companyPhrase,
    required this.bs,
  }) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerName;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _slideAnimationName;
  late Animation<Offset> _slideAnimationBg;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controllerName = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _slideAnimationBg = Tween<Offset>(
      begin: const Offset(2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCirc,
    ));

    _slideAnimationName = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controllerName,
      curve: Curves.easeInQuad,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
    _controllerName.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Positioned(
            top: 200,
            left: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideTransition(
                    position: _slideAnimationName,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.name
                              .split(' ')
                              .map((word) => Text(
                                    word,
                                    style: const TextStyle(
                                      letterSpacing: 5,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    )),
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.email),
                        Text(widget.website),
                        Text("city ${widget.city}\nstreet ${widget.street}"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SlideTransition(
              position: _slideAnimationBg,
              child: SizedBox(
                width: 400,
                height: 450,
                child: SvgPicture.asset(AppImages.detailBackElement),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
