import 'package:firstapp/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageStack extends StatelessWidget {
  final Destination destination;

  ImageStack({Key key, this.destination}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width, // it will take half screen
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)
            ],
          ),
          child: Hero(
            // Hero is used for shared animation transaction
            tag: destination.imageUrl, // tag should be same as parent
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
              child: Image.asset(
                destination.imageUrl,
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
                destination.city,
                style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),
              ),
              SizedBox(height: 2),
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.locationArrow,
                    color: Colors.white,
                    size: 12,
                  ),
                  SizedBox(width: 10),
                  Text(
                    destination.country,
                    style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white),
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
    );
  }
}
