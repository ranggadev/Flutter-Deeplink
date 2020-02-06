import 'package:deep_link/NewsDetail.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    initUniLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deep Link"),
      ),
    );
  }

  Future<Null> initUniLinks() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      //--- Cara 1 ---
//      List<String> listUrl = [];
//
//      String initialLink = await getInitialLink();
//      listUrl = initialLink.split("/");
//
//      for (var i=0; i < listUrl.length; i++) {
//        print("rangga link " + listUrl[i]);
//      }
//
//      Navigator.push(context, MaterialPageRoute(builder: (context) =>
//          NewsDetail(url: listUrl[listUrl.length-1],)
//      ));



      //--- Cara 2 ---
      List<String> listUrl2 = [];
      Uri initialUri = await getInitialUri();
      if (initialUri != null) {
        listUrl2 = initialUri.pathSegments;

        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            NewsDetail(url: listUrl2[listUrl2.length-1],)
        ));
      }
    } on PlatformException {
      // Handle exception by warning the user their action did not succeed
      // return?

      //Toast Terjadi Kesalahan
    }
  }
}
