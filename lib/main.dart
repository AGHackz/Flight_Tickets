import 'package:flutter/material.dart';
import 'CustomShapeClipper.dart';
import 'CustomBottomNavigationBar.dart';
import 'SearchResultScreen.dart';

void main() => runApp(MyApp());

List<String> locations = ["Boston (BTN)", "New York"];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo",
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      home: SearchResultScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[HomeScreenTopPart(), HomeScreenBottomPart()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  final firstColor = Colors.orange;
  final secondColor = Colors.orange[600];
  var _searchText = locations[1];
  var isFlightSelected = true;
  var selectedCity = locations[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 400.0,
          ),
          ClipPath(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [firstColor, secondColor],
              )),
              height: 400.0,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 6.0),
                              child:
                                  Icon(Icons.location_on, color: Colors.white),
                            ),
                            PopupMenuButton(
                              child: Text(selectedCity,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15.0)),
                              onSelected: (value) {
                                setState(() {
                                  selectedCity = locations[value];
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry>[
                                    PopupMenuItem(
                                      child: Text(locations[0],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      value: 0,
                                    ),
                                    PopupMenuItem(
                                      child: Text(locations[1],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      value: 1,
                                    )
                                  ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Icon(Icons.settings, color: Colors.white),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 45.0, right: 45.0, top: 50.0),
                        child: Text("Where would you want to go?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Material(
                            elevation: 5.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(45.0 / 2)),
                            child: TextField(
                              controller:
                                  TextEditingController(text: _searchText),
                              onChanged: (newValue) {
                                _searchText = newValue;
                              },
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                              decoration: InputDecoration(
                                  hintText: "Search Destination",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 14.0),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 14.0),
                                  suffixIcon: Material(
                                    elevation: 1.35,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(45.0 / 2.0)),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 20.0,
                                    ),
                                  )),
                            )),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InkWell(
                            child: ChoiceChip(Icons.flight_takeoff, "Flights",
                                isFlightSelected),
                            onTap: () {
                              setState(() {});
                              isFlightSelected = true;
                            },
                          ),
                          InkWell(
                            child: ChoiceChip(
                                Icons.hotel, "Hotels", !isFlightSelected),
                            onTap: () {
                              setState(() {});
                              isFlightSelected = false;
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            clipper: CustomShapeClipper(),
          )
        ],
      ),
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String title;
  bool isSelected = false;

  ChoiceChip(this.icon, this.title, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(children: <Widget>[
            Icon(widget.icon, color: Colors.white),
            SizedBox(
              width: 6.0,
            ),
            Text(
              widget.title,
              style: _getTextStyle(),
            )
          ]),
        ),
        decoration: BoxDecoration(
            color: _getChipBgColor(),
            shape: BoxShape.rectangle,
            border: _getBorder(),
            borderRadius: BorderRadius.all(Radius.circular(35.0))),
      ),
    );
  }

  TextStyle _getTextStyle() {
    if (widget.isSelected) {
      return TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
    } else {
      return TextStyle(color: Colors.white);
    }
  }

  Color _getChipBgColor() {
    if (widget.isSelected) {
      return Colors.white.withOpacity(0.35);
    } else {
      return Colors.white.withOpacity(0.25);
    }
  }

  Border _getBorder() {
    if (widget.isSelected) {
      return Border.all(width: 1.0, color: Colors.white);
    } else {
      return null;
    }
  }
}

class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Currenty Watched Items"),
                Text(
                  "View All (12)",
                  style: TextStyle(color: Colors.orange),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 200.0,
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              PlaceListItem(
                  "New York", "assets/images/new_york.jpg", Colors.blue),
              PlaceListItem(
                  "Los Vegas", "assets/images/los_vegas.jpg", Colors.red),
              PlaceListItem("China", "assets/images/china.jpg", Colors.green)
            ]),
          )
        ]),
      ),
    );
  }
}

class PlaceListItem extends StatefulWidget {
  final String title;
  final String image;
  final Color color;
  final String discount = "45%";

  PlaceListItem(this.title, this.image, this.color);

  @override
  _PlaceListItemState createState() => _PlaceListItemState();
}

class _PlaceListItemState extends State<PlaceListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        child: Container(
          width: 160.0,
          height: 200.0,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(widget.image, fit: BoxFit.cover),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: 70.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.black12],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                ),
              ),
              Positioned(
                  left: 10.0,
                  right: 10.0,
                  bottom: 10.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                          Text("data",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 4.0),
                          child: Text(
                            widget.discount,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
