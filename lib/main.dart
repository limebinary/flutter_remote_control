import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_remote_control/widgets/remote_control.dart';
import 'package:flutter_remote_control/res/colors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'widgets/draggable_button_menu.dart';

void main() {
  runApp(MyApp());
  // 透明状态栏
  if (!kIsWeb && Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      showSemanticsDebugger: true,
      title: 'Flutter Remote Control',
      theme: ThemeData(
        primaryColor: Colours.app_main,
        scaffoldBackgroundColor: Colours.app_main,
      ),
      home: MyHomePage(title: '万能遥控器'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: RemoteControl()
            ),
            Divider(
              height: 1.0,
              color: Colours.line,
            ),
            SizedBox(
              // 底部菜单高度为屏幕宽度的五分之二加底部指示器高度20。
              height: MediaQuery.of(context).size.width / 5 * 2 + 20,
              child: Swiper(
                containerWidth: double.infinity,
                itemCount: 4,
                curve: Curves.linear,
                loop: false,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.white,
                    color: Colours.line,
                    size: 6.0,
                    activeSize: 6.0,
                    space: 2.0
                  )
                ),
                itemBuilder: (_, index) {
                  return DraggableButtonMenu(index: index,);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
