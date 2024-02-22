library breathing_glowing_button;

import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';

/// A Breathing Glowing Button widget.
///
/// If properties are not given, default value is used.
class BreathingGlowingBox extends StatefulWidget {
  /// Width of the button.
  ///
  /// Default value: 60.0.
  final double? width;

  /// Height of the button.
  ///
  /// Default value: 60.0.
  final double? height;

  /// The color for button background.
  ///
  /// Default value: Color(0xFF373A49).
  final Color? buttonBackgroundColor;

  /// The color of the breathing glow animation.
  ///
  /// Default value: Color(0xFF777AF9).
  final Color? glowColor;

  /// Icon inside the button.
  ///
  /// Default value: Icons.mic.
  final IconData? icon;

  /// The color of the icon.
  ///
  /// Default [iconColor] value: Colors.white.
  final Color? iconColor;

  /// Function to be executed onTap.
  ///
  /// Default [onTap] value: null
  final VoidCallback? onTap;

  const BreathingGlowingBox({/*super.key,*/ 
    this.width,
    this.height,
    this.buttonBackgroundColor,
    this.glowColor,
    this.icon,
    this.iconColor,
    this.onTap,
  });

  @override
  _BreathingGlowingBoxState createState() => _BreathingGlowingBoxState();
}

class _BreathingGlowingBoxState extends State<BreathingGlowingBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    tenet();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.removeListener(() {});
    super.dispose();
  }

  /// Core animation control is done here.
  /// Animation completes in 2 seconds then repeat by reversing.
  void tenet() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 10.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    //final double _width = widget.width ?? 60;
    //final double _height = widget.height ?? 60;
    final Color _buttonBackgroundColor =
        widget.buttonBackgroundColor ?? Colors.transparent;
    final Color _glowColor = widget.glowColor ?? Color(0xFF777AF9);
    final IconData _icon = widget.icon ?? Icons.mic;
    final Color _iconColor = widget.iconColor ?? Colors.white;
    final Function _onTap = widget.onTap ?? () {};

    /// A simple breathing glowing button.
    /// Built using [Container] and [InkWell].
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.white,
      highlightColor: Colors.white,
      child: Container(
        // width: _width,
        // height: _height,
        // child: Icon(
        //   _icon,
        //   color: _iconColor,
        // ),
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          color: _buttonBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: _glowColor,
              blurRadius: _animation.value,
              spreadRadius: _animation.value,
            ),
          ],
        ),
        // width: _width,
        // height: _height,
        // child: Icon(
        //   _icon,
        //   color: _iconColor,
        // ),
        child: Container(
          child: Image(image: 
          AssetImage("images/mobile_banking/Screenshot_2023-02-16_095546-removebg-preview.png")
          ),
        )
      //onTap: () => _onTap(),
    ));
  }
}

_firstchild(BuildContext context) {
  return Column(
    children:  [
      const Text("Christmas Sales", style: TextStyle(color: Colors.white,fontSize: 25,fontStyle: FontStyle.normal)),
      const SizedBox(height: 5,),
      const Text("10%", style: TextStyle(color: Colors.red,fontSize: 20,fontStyle: FontStyle.italic)),
      Row(
        children: [
            Image(image: AssetImage("Assestes/Capturee2-removebg-preview.png"),
            
            )
        ],
      )
    ],
  );
}

_secondchild(BuildContext context) {
  return const Text("Flat 10 % discount", style: TextStyle(color: Colors.white,fontSize: 30,fontStyle: FontStyle.italic));
}
