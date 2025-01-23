import '../../commons/commons.dart';

class CustomGradientStyle {
  static BoxDecoration boxDecorationGradientBlue = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        kBlue1,
        kBlue1,
      ],
      stops: [0.0, 1.0],
    ),
    borderRadius: BorderRadius.circular(15),
  );
  static BoxDecoration boxDecorationGradientWhite = BoxDecoration(
    color: kWhite1,
    border: Border.all(
      color: kBlue1,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(15),
  );
}
