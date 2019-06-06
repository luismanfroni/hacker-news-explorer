import 'package:codexplorer/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class StoryEvent extends Equatable {
    StoryEvent([List props = const []]) : super(props);
}

class FetchStories extends StoryEvent {
    final ApiCategory category;

    FetchStories({@required this.category})
        : assert(category != null),
            super([category]);
}
class RefreshStories extends StoryEvent {
    final ApiCategory category;

    RefreshStories({@required this.category})
        : assert(category != null),
            super([category]);
}