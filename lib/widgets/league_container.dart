import 'package:flutter/material.dart';

class LeagueContainer extends StatelessWidget {
  final String image;
  final GestureTapCallback onTap;

  LeagueContainer({@required this.image, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(image),
      ),
    );
  }
}
