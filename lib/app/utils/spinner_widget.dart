import 'package:casso/app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CustomSpinner extends StatefulWidget {
  const CustomSpinner({Key? key}) : super(key: key);

  @override
  CustomSpinnerState createState() => CustomSpinnerState();
}

class CustomSpinnerState extends State<CustomSpinner>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController fifthController;
  late Animation<double> fifthAnimation;

  @override
  void initState() {
    /// animasi 1
    firstController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    firstAnimation = Tween<double>(begin: -pi, end: pi).animate(firstController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });
    ////////////////////////////// animasi 2
    secondController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    secondAnimation =
        Tween<double>(begin: -pi, end: pi).animate(secondController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              secondController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              secondController.forward();
            }
          });

    /// animasi 3
    thirdController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    thirdAnimation = Tween<double>(begin: -pi, end: pi).animate(thirdController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    /// animasi 4
    fourthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );

    fourthAnimation =
        Tween<double>(begin: -pi, end: pi).animate(fourthController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              fourthController.repeat();
            } else if (status == AnimationStatus.dismissed) {
              fourthController.forward();
            }
          });

    /// animasi 5
    fifthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    fifthAnimation = Tween<double>(begin: -pi, end: pi).animate(fifthController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fifthController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          fifthController.forward();
        }
      });

    firstController.forward();
    secondController.forward();
    thirdController.forward();
    fourthController.forward();
    fifthController.forward();

    super.initState();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    fifthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 40,
        child: CustomPaint(
          painter: SpinnerPainter(
            firstAngle: firstAnimation.value,
            secondAngle: secondAnimation.value,
            thridAngle: thirdAnimation.value,
            fourthAngle: fourthAnimation.value,
            fifthAngle: fifthAnimation.value,
          ),
        ),
      ),
    );
    // );
  }
}

class SpinnerPainter extends CustomPainter {
  final double firstAngle;
  final double secondAngle;
  final double thridAngle;
  final double fourthAngle;
  final double fifthAngle;

  SpinnerPainter({
    required this.firstAngle,
    required this.secondAngle,
    required this.thridAngle,
    required this.fourthAngle,
    required this.fifthAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint myArc = Paint()
      ..color = darkColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    /// yang ke 1
    canvas.drawArc(Rect.fromLTRB(0, 0, size.width, size.height), firstAngle, 2,
        false, myArc);

    /// yang ke 2
    canvas.drawArc(
        Rect.fromLTRB(size.width * .1, size.height * .1, size.width * .9,
            size.height * .9),
        secondAngle,
        2,
        false,
        myArc);

    /// yang ke 3
    canvas.drawArc(
        Rect.fromLTRB(size.width * .2, size.height * .2, size.width * .8,
            size.height * .8),
        thridAngle,
        2,
        false,
        myArc);

    /// yang ke 4

    canvas.drawArc(
        Rect.fromLTRB(size.width * .3, size.height * .3, size.width * .7,
            size.height * .7),
        fourthAngle,
        2,
        false,
        myArc);

    /// yang ke 5
    canvas.drawArc(
        Rect.fromLTRB(size.width * .4, size.height * .4, size.width * .6,
            size.height * .6),
        fifthAngle,
        2,
        false,
        myArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
