import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class StoriesLoading extends StatefulWidget {
    StoriesLoading({Key key}) : super(key: key);

    @override
    State<StoriesLoading> createState() => _StoriesLoadingState();
}
    
class _StoriesLoadingState extends State<StoriesLoading> {
    @override
    Widget build(BuildContext context) {
        return ListView(
            children: <Widget>[
                Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: Column(
                        children: new List<int>.generate(20, (int index) => index)
                            .map((_) => Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Container(
                                                        width: double.infinity,
                                                        height: 8.0,
                                                        color: Colors.white,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                    ),
                                                    Container(
                                                        width: double.infinity,
                                                        height: 8.0,
                                                        color: Colors.white,
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                    ),
                                                    Container(
                                                        width: 40.0,
                                                        height: 8.0,
                                                        color: Colors.white,
                                                    ),
                                                ],
                                            ),
                                        )
                                    ],
                                ),
                            ))
                        .toList(),
                    )   
                ),
            ]
        );            
    }
}
