import 'package:codexplorer/repositories/story_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:codexplorer/models/models.dart';

abstract class StoryState extends Equatable {
    final ApiCategory category;

    StoryState({@required this.category, List props = const []}) 
        : assert(category != null),
            super(props);
}

class StoryEmpty extends StoryState {
    StoryEmpty({ApiCategory category})
        : assert(category != null),
            super(category: category);
}

class StoryLoading extends StoryState {
    StoryLoading({ApiCategory category})
        : assert(category != null),
            super(category: category);
}

class StoryLoaded extends StoryState {
    final List<Story> stories;

    StoryLoaded({@required this.stories,
                 ApiCategory category})
        : assert(stories != null && category != null),
            super(props: [stories], category: category);
}

class StoryError extends StoryState {
    final Exception exception;

    StoryError({@required this.exception, ApiCategory category})
        : super(category: category);
}
