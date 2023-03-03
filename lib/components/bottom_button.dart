import 'package:flutter/cupertino.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {

  const BottomButton({super.key, this.onPressed, required this.buttonTittle});


  final void Function()? onPressed;
  final String buttonTittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kBottomContainerColour,
        margin: const EdgeInsets.only(top:10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            buttonTittle,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}