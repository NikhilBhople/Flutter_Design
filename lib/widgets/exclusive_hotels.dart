import 'package:firstapp/models/hotel_model.dart';
import 'package:firstapp/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExclusiveHotels extends StatelessWidget {
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
              Text("Exclusive Hotels", style: appStyles.textStyle22BlackBold(),),
              GestureDetector(
                onTap: () {
                  print("see all exclusive hotel tapped");
                },
                child: Text("See all", style: appStyles.textLinkStyle(),))
            ],
          ),
        ),
        Container(
          height: 260,
          child: buildTopDestinationList(),
        )
      ],
    );
  }

  ListView buildTopDestinationList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: hotels.length,
      itemBuilder: (context,position) {
        Hotel hotel = hotels[position];
        return Container(
          width: 280,
          margin: EdgeInsets.only(left: 6),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                bottom: 15,
                child: Card(
                  child: Container(
                    width: 260,
                    height: 120,
                    padding: EdgeInsets.only(left: 16,bottom: 10,right: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ) ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("${hotel.name}", style: appStyles.textStyle18BlackBold(),),
                        SizedBox(height: 5,),
                        Text(hotel.address, style: appStyles.textStyleDescription(),),
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
                        image: AssetImage(hotel.imageUrl),
                        height: 180,
                        width: 260,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 5,top: 5,bottom: 5),
                          child:  Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.dollarSign,
                                color: Colors.black,
                                size: 12,
                              ),
                              Text("${hotel.price}", style: appStyles.textStyle14BlackBold(),)],
                          )
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
