import '../../commons/commons.dart';

class H3 extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const H3(
      {super.key,
      required this.text,
      this.textStyle = const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato',
        color: kBlack1,
      ),
      this.textAlign,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}