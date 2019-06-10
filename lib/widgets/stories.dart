import 'package:codexplorer/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:codexplorer/repositories/repositories.dart';
import 'package:codexplorer/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'widgets.dart';

class Stories extends StatefulWidget {
    final StoryRepository storyRepository;

    Stories({Key key, @required this.storyRepository})
        : assert(storyRepository != null),
            super(key: key);

    @override
    State<Stories> createState() => _StoryState();
}

class _StoryState extends State<Stories> {
    StoryBloc _storyBloc;
    Completer<void> _refreshCompleter;

    @override
    void initState() {
        super.initState();
        _refreshCompleter = Completer<void>();
        _storyBloc = StoryBloc(storyRepository: widget.storyRepository);
    }

    @override
    void dispose() {
        _storyBloc.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("CodExplorer"),
            ),
            bottomNavigationBar: BottomBar(
                onItemSelected: (ApiCategory cat) {
                    _storyBloc.dispatch(FetchStories(category: cat));
                }
            ),
            body: BlocListener(
                bloc: _storyBloc,
                listener: (BuildContext context, StoryState state) {
                    if (state is StoryLoaded) {
                        _refreshCompleter?.complete();
                        _refreshCompleter = Completer();
                    }
                },
                child: BlocBuilder(
                    bloc: _storyBloc,
                    builder: (_, StoryState state) {
                        final category = state.category;
                        if (state is StoryEmpty)
                            return StoriesEmpty(
                                onRefresh: () {
                                    _storyBloc.dispatch(RefreshStories(category: category));
                                    return _refreshCompleter.future;
                                }
                            );
                        
                        if (state is StoryLoading)
                            return StoriesLoading();
                            
                        if (state is StoryLoaded)     
                            return StoriesLoaded(
                                onRefresh: () {
                                    _storyBloc.dispatch(RefreshStories(category: category));
                                    return _refreshCompleter.future;
                                },
                                stories: state.stories,
                            );
                        

                        if (state is StoryError) {
                            final exception = state.exception;
                            return StoriesError(
                                exception: exception,
                                onRefresh: () {
                                    _storyBloc.dispatch(RefreshStories(category: category));
                                    return _refreshCompleter.future;
                                }
                            );
                        }
                    }
                )
            ,)
        );
    }
}
