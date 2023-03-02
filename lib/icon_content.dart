import 'package:flutter/cupertino.dart';

const labelTextStyle = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF8D8E98)
);

class IconContent extends StatelessWidget {
  const IconContent({super.key, this.icon, required this.label});

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 70.0,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            label,
            style: labelTextStyle
          )
        ],
      ),
    );
  }
}