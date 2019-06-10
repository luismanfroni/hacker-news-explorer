import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoriesError extends StatefulWidget {
    final Future<void> Function() onRefresh;
    final Exception exception;
    StoriesError({Key key, this.exception, this.onRefresh}) : super(key: key);

    @override
    State<StoriesError> createState() => _StoriesErrorState();
}
    
class _StoriesErrorState extends State<StoriesError> {
    @override
    Widget build(BuildContext context) {
        return RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: Center(
                child: ListView(
                    children: [
                        Padding(padding: EdgeInsets.only(top: 80.0)),
                        Icon(
                            Icons.warning,
                            color: Colors.amber[800],
                            size: 80
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Center(
                            child: Text(
                                "Error!",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.amber[800]
                                ),
                            ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40.0)),
                        Center(
                            child: Text(
                                widget.exception.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black
                                ),
                            ),
                        )
                    ]
                )
            )
        );
    }
}
