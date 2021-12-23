import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

final textTheme = GoogleFonts.latoTextTheme();

final lightTheme = FlexThemeData.light(scheme: FlexScheme.hippieBlue)
    .copyWith(textTheme: textTheme);

final darkTheme = FlexThemeData.dark(scheme: FlexScheme.hippieBlue)
    .copyWith(textTheme: textTheme);
