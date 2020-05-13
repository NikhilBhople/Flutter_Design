import 'package:firstapp/models/activity_model.dart';
import 'package:firstapp/models/destination_model.dart';
import 'package:firstapp/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DestinationDetailPage extends StatefulWidget {
  final Destination destination;
  final AppStyles appStyles = AppStyles();

  DestinationDetailPage(this.destination);

  @override
  _DestinationDetailPageState createState() => _DestinationDetailPageState();
}

class _DestinationDetailPageState extends State<DestinationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context)
                    .size
                    .width, // it will take half screen
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6)
                  ],
                ),
                child: Hero(
                  // Hero is used for shared animation transaction
                  tag: widget
                      .destination.imageUrl, // tag should be same as parent
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      widget.destination.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context)),
                      Expanded(
                        child: SizedBox.shrink(),
                        flex: 1,
                      ),
                      IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          icon: Icon(Icons.photo_filter),
                          onPressed: () => Navigator.pop(context)),
                      IconButton(
                          iconSize: 30,
                          color: Colors.white,
                          icon: Icon(Icons.search),
                          onPressed: () => Navigator.pop(context)),
                    ]),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.destination.city,
                      style: widget.appStyles.textStyle22WhiteBold(),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          color: Colors.white,
                          size: 12,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.destination.country,
                          style: widget.appStyles.textStyle14White(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                child: Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.white,
                ),
                right: 20,
                bottom: 20,
              )
            ],
          ),
          Expanded(
            child: MediaQuery.removePadding(
              // for removing top default padding of listview
              removeTop: true,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int position) {
                  return getBottomActivityList(
                      widget.destination.activities[position],
                      widget.appStyles);
                },
                itemCount: widget.destination.activities.length,
              ),
              context: context,
            ),
          )
        ],
      ),
    );
  }
}

Widget getBottomActivityList(Activity activity, AppStyles appStyles) {
  return Stack(children: <Widget>[
    Container(
      height: 170,
      width: double.infinity, // match_parent in android
      margin: EdgeInsets.only(left: 50, right: 16, top: 5),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          margin: EdgeInsets.only(left: 85, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: 120,
                      child: Text(
                        activity.name,
                        style: appStyles.textStyle18BlackBold(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Column(
                    children: <Widget>[
                      Text(
                        "\$${activity.price}",
                        style: appStyles.textStyle22BlackBold(),
                      ),
                      Text(
                        "per pax",
                        style: appStyles.style14Grey(),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                activity.type,
                style: appStyles.style14Grey(),
              ),
              SizedBox(
                height: 5,
              ),
              getRatingView(activity.rating),
              SizedBox(
                height: 7,
              ),
              getStringTimeRow(activity.startTimes)
            ],
          ),
        ),
      ),
    ),
    Positioned(
      left: 16,
      top: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          activity.imageUrl,
          height: 140,
          width: 110,
          fit: BoxFit.cover,
        ),
      ),
    )
  ]);
}

Row getStringTimeRow(List<String> startTimes) {
  return Row(
    children: startTimes
        .asMap()
        .entries
        .map((MapEntry key) => _buildContainer(key.value))
        .toList(),
  );
}

Row _buildContainer(String value) {
  return Row(children: <Widget>[
    Container(
      width: 70,
      height: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueAccent[100]),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    ),
    SizedBox(
      width: 15,
    )
  ]);
}

Text getRatingView(int rating) {
  String ratingString = "";
  for (int i = 0; i < rating; i++) {
    ratingString += "⭐";
  }
  return Text(ratingString);
}
