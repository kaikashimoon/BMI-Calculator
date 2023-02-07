import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
    fontSize: 18.0, color: Color(0xFF8D8E98)
);

class IconContent extends StatelessWidget {

  IconContent({required this.icon, this.label1});
  final IconData? icon;
  final String? label1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label1!,
          style: labelTextStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour, this.cardChild});
  final Color? colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}
