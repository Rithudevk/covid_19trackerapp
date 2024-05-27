import 'dart:async';

import 'package:covid_19_tracker/view/screens/global_countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math'as math;

import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with TickerProviderStateMixin {

  late final AnimationController _controller=AnimationController(vsync: this,
  duration: Duration(seconds: 10)
  )..repeat();
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () { 
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const GlobalView(),));
    });
    super.initState();
  }

  @override
  void dispose() {
  _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(animation:_controller ,
             builder: (context, child) {
               return Transform.rotate(angle: _controller.value*2.0*math.pi,
               child: child,
               );
        
             },
             child: Container(
              height: 250,
              width: 250,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asstes/images/png.png'),fit: BoxFit.cover)
              ),
             ),
             ),
             SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
             ),
             Text('COVID-19',
             style:TextStyle(
              fontSize: 30,
             fontFamily: GoogleFonts.ramaraja().fontFamily,
              fontWeight: FontWeight.w600,
              color:const Color.fromARGB(255, 60, 159, 63)
             ),
             ),
               Opacity(
                opacity: 0.5,
                 child: Text('TRACKER',
                              style:TextStyle(
                               fontSize: 30,
                              fontFamily: GoogleFonts.righteous().fontFamily,
                               fontWeight: FontWeight.w600,
                               color:const Color.fromARGB(255, 60, 159, 63)
                              ),
                              ),
               )
          ],
        ),
      ),
    );
  }
}