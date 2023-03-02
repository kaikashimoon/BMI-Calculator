import 'package:flutter/cupertino.dart';
import 'constants.dart';



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
            style: kLabelTextStyle
          )
        ],
      ),
    );
  }
}