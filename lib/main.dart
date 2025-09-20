import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qr_code_scanner/app/constants/colours.dart';
import 'package:qr_code_scanner/app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: const Size(440, 971),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      theme: ThemeData(
        fontFamily: "Inter",
        bottomSheetTheme: const BottomSheetThemeData(backgroundColor: kWhite),
        scaffoldBackgroundColor: darkBackground,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
