import 'package:flutter/material.dart';

class NewsDetail extends StatefulWidget {

  final String url;

  const NewsDetail({Key key, this.url}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Berita"),
      ),
      body: Container(
        child: Center(
          child: Text(widget.url),
        ),
      ),
    );
  }
}
