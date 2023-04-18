import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:super_chat/firebase_options.dart';

import 'common/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) =>
          GetMaterialApp(
            title: 'Super Chat',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            // home: Center(
            //     child: Container(
            //         child: const Text('Project Started')),
            // ),
          ),
    );
  }
}