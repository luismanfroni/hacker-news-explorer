import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoriesEmpty extends StatefulWidget {
    final Future<void> Function() onRefresh;
    StoriesEmpty({Key key, this.onRefresh}) : super(key: key);

    @override
    State<StoriesEmpty> createState() => _StoriesEmptyState();
}
    
class _StoriesEmptyState extends State<StoriesEmpty> {
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
                            color: Colors.black45,
                            size: 80
                        ),
                        Padding(padding: EdgeInsets.only(top: 20.0)),
                        Center(
                            child: Text(
                                "Conteúdo vazio",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black45
                                ),
                            ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40.0)),
                        Center(
                            child: Text(
                                "Puxe para baixo para atualizar!",
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
