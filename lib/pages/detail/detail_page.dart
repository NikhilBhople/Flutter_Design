import 'package:firstapp/models/destination_model.dart';
import 'package:firstapp/pages/detail/widgets/activity_list_item.dart';
import 'package:firstapp/pages/detail/widgets/image_stack.dart';
import 'package:flutter/material.dart';

class DestinationDetailPage extends StatelessWidget {
  final Destination destination;

  DestinationDetailPage({Key key, this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            ImageStack(destination: destination),
            Expanded(
              child: MediaQuery.removePadding(
                // for removing top default padding of listview
                removeTop: true,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int position) {
                    return ActivityListItem(activity: activities[position]);
                  },
                  itemCount: destination.activities.length,
                ),
                context: context,
              ),
            )
          ],
        )
    );
  }
}
