import 'package:flutter/material.dart';
import 'package:flutter_bloc_mvvm_example/views/dashboard/home/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return  const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}


///we will wrap multi bloc provider widget if we have multiple blocs
