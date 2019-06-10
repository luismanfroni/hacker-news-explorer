import 'package:codexplorer/models/models.dart';
import 'package:codexplorer/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StoriesLoaded extends StatefulWidget {
    final Future<void> Function() onRefresh;
    final List<Story> stories;
    StoriesLoaded({Key key, this.onRefresh, this.stories}) : super(key: key);

    @override
    State<StoriesLoaded> createState() => _StoriesLoadedState();
}
    
class _StoriesLoadedState extends State<StoriesLoaded> {
    @override
    Widget build(BuildContext context) {
        return RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: ListView(
                children: 
                    widget.stories.map(
                        (story) => StoryItem(story: story)
                    ).toList(),
            ),
        );
    }
}