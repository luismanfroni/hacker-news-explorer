import 'package:codexplorer/repositories/story_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:codexplorer/models/models.dart';

abstract class StoryState extends Equatable {
    final ApiCategory category;

    StoryState({@required this.category, List props = const []}) : super(props);
}

class StoryEmpty extends StoryState {
    StoryEmpty(category)
        : assert(category != null),
            super(category: category);
}

class StoryLoading extends StoryState {
    StoryLoading(category)
        : assert(category != null),
            super(category: category);
}

class StoryLoaded extends StoryState {
    final List<Story> stories;
    final ApiCategory category;

    StoryLoaded({@required this.stories,
                 @required this.category})
        : assert(stories != null && category != null),
            super(props: [stories], category: category);
}

class StoryError extends StoryState {
    StoryError(category)
        : assert(category != null),
            super(category: category);
}
