import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:codexplorer/repositories/story_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
    final Null Function(ApiCategory item) onItemSelected;
    BottomBar({Key key, this.onItemSelected}) : super(key: key);

    @override
    State<BottomBar> createState() => _BottomBarState();
}
    
class _BottomBarState extends State<BottomBar> {

    @override
    Widget build(BuildContext context) {
        return BottomNavyBar(
            currentIndex: 0,
            onItemSelected: (int index) {
                switch (index) {
                    case 0:
                        widget.onItemSelected(ApiCategory.New);
                        break;
                    case 1:
                        widget.onItemSelected(ApiCategory.Top);
                        break;
                    case 2:
                        widget.onItemSelected(ApiCategory.Best);
                        break;
                }
            },
            items: [
                BottomNavyBarItem(
                    icon: Icon(Icons.new_releases),
                    title: Text('Novo'),
                    activeColor: Colors.blue,
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.trending_up),
                    title: Text('Top'),
                    activeColor: Colors.red
                ),
                BottomNavyBarItem(
                    icon: Icon(Icons.star),
                    title: Text('Melhores'),
                    activeColor: Colors.green
                ),
            ],
        );
    }
}
