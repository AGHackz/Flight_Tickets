import 'package:flutter/material.dart';
import 'CustomShapeClipper.dart';

class SearchResultScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
        leading: Icon(Icons.keyboard_arrow_left, size: 40.0),
        backgroundColor: Colors.orange,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[FlightListTopPart(), FlightListBottomPart()],
        ),
      ),
    );
  }
}

class FlightListTopPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: CustomShapeClipper(),
            clipBehavior: Clip.antiAlias,
            child: Container(
              color: Colors.orange,
              height: 160.0,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text("Test 1 sdkfjan sdafhk hsdakhf sadhf sdf"),
                            Divider(color: Colors.grey),
                            Text(
                                "Test 2 asnfalds lksdnaflds clsndalc lnsladncl sf")
                          ],
                        ),
                        flex: 5,
                      ),
                      Spacer(),
                      Expanded(
                          child: Icon(Icons.import_export, size: 32.0), flex: 1)
                    ],
                  ),
                ),
              ),
              elevation: 2.0,
            ),
          )
        ],
      ),
    );
  }
}

class FlightListBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
