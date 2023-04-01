import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class home_provider extends ChangeNotifier
{
  List image = [
    "assets/images/n.png",
    "assets/images/ap.png",
    "assets/images/dh.png",
    "assets/images/olx.png",
    "assets/images/sl.jpg",
    "assets/images/fc.jpg",
    "assets/images/ms.png"
  ];

  List name = [
    "Netflix","Amazon Prime","Disney+","OLX","Sony LIV","Flipcart","Meesho"
  ];

  List url = [
    "https://www.netflix.com",
    "https://www.primevideo.com",
    "https://www.hotstar.com",
    "https://www.olx.in",
    "https://www.sonyliv.com",
    "https://www.flipkart.com",
    "https://www.meesho.com"
  ];

  WebViewController? webViewController;

  void loadlink(int index)
  {
    webViewController = WebViewController();
    webViewController!.loadRequest(Uri.parse("${url[index]}"));
    notifyListeners();
  }
}