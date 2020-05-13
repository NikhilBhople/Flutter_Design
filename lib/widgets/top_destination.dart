import 'package:firstapp/models/destination_model.dart';
import 'package:firstapp/styles/text_styles.dart';
import 'package:firstapp/widgets/detination_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopDestination extends StatelessWidget {
  final AppStyles appStyles = AppStyles();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Destination", style: appStyles.textStyle22BlackBold(),),
              GestureDetector(
                  onTap: () {
                    print("see all exclusive hotel tapped");
                  },
                  child: Text("See all", style: appStyles.textLinkStyle(),))
            ],
          ),
        ),
        Container(
          height: 280,
          child: buildTopDestinationList(),
        )
      ],
    );
  }

  ListView buildTopDestinationList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: destinations.length,
      padding: EdgeInsets.only(left: 6),
      itemBuilder: (context, position) {
        Destination destination = destinations[position];
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DestinationDetailPage(destination))),
          child: Hero( // Used for animation (Shared element transaction)
            tag: destination.imageUrl, // tag should be same at both parent and child
            child: Container(
              width: 220,
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Positioned(
                    bottom: 5,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Container(
                        width: 200,
                        height: 120,
                        padding: EdgeInsets.only(left: 16, bottom: 10, right: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${destination.activities.length} Activitites", style: appStyles.textStyle18BlackBold()),
                            SizedBox(height: 5,),
                            Text(destination.description, style: appStyles.textStyleDescription(),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage(destination.imageUrl),
                            height: 180,
                            width: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(destination.city, style: appStyles.textStyle18WhiteBold(),),
                                SizedBox(height: 2,),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      FontAwesomeIcons.locationArrow,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(destination.country, style: appStyles.textStyle14White(),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
