import 'package:firstapp/models/hotel_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExclusiveHotels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 8, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Exclusive Hotels",
                style: Theme.of(context).textTheme.headline1,
              ),
              GestureDetector(
                onTap: () {
                  print("see all exclusive hotel tapped");
                },
                child: Text(
                  "See all",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.blue, fontWeight: FontWeight.normal),
                ),
              ),
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
      itemBuilder: (context, position) {
        Hotel hotel = hotels[position];
        return Container(
          width: 280,
          margin: EdgeInsets.only(left: 6),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                bottom: 5,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    width: 260,
                    height: 100,
                    padding: EdgeInsets.only(left: 16, bottom: 10, right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "${hotel.name}",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          hotel.address,
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              .copyWith(color: Colors.grey),
                        ),
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
                        width: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 5, top: 5, bottom: 5),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.dollarSign,
                                color: Colors.black,
                                size: 12,
                              ),
                              Text(
                                "${hotel.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(color: Colors.black),
                              )
                            ],
                          ),
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
