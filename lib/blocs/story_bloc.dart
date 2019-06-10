import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:codexplorer/repositories/repositories.dart';
import 'package:codexplorer/models/models.dart';
import 'package:codexplorer/blocs/blocs.dart';


class StoryBloc extends Bloc<StoryEvent, StoryState> {
    final StoryRepository storyRepository;
    
    StoryBloc({@required this.storyRepository})
        : assert(storyRepository != null);

    @override
    StoryState get initialState => StoryEmpty(category: ApiCategory.New);

    @override
    Stream<StoryState> mapEventToState(StoryEvent event) async* {
        if (event is FetchStories) {
            try {
                yield StoryLoading(category: event.category);
                List<Story> stories = await storyRepository.getStories(event.category);
                yield StoryLoaded(stories: stories, category: event.category);
            } catch (ex) {
                yield StoryError(exception: ex, category: event.category);
            }
        } else if (event is RefreshStories) {
            try {
                yield StoryLoading(category: event.category);
                final List<Story> stories = await storyRepository.getStories(event.category);
                yield StoryLoaded(stories: stories, category: event.category);
            } catch (ex) {
                yield StoryError(exception: ex, category: event.category);
            }
        }
    }
}