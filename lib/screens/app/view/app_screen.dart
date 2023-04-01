import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../home/provider/home_provider.dart';

class app_screen extends StatefulWidget {
  const app_screen({Key? key}) : super(key: key);

  @override
  State<app_screen> createState() => _app_screenState();
}

class _app_screenState extends State<app_screen> {

  home_provider? ht,hf;
  @override
  Widget build(BuildContext context) {

    hf = Provider.of<home_provider>(context,listen: false);
    ht = Provider.of<home_provider>(context,listen: true);

    int i = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${hf!.name[i]}",style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: WebViewWidget(controller: ht!.webViewController!),
      ),
    );
  }
}
