import 'package:bloc/bloc.dart';
import 'package:codexplorer/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:codexplorer/widgets/widgets.dart';

class SimpleBlocDelegate extends BlocDelegate {
    @override
    void onEvent(Bloc bloc, Object event) {
        super.onEvent(bloc, event);
        print(event);
    }

    @override
    onTransition(Bloc bloc, Transition transition) {
        super.onTransition(bloc, transition);
        print(transition);
    }

    @override
    void onError(Bloc bloc, Object error, StackTrace stackTrace) {
        super.onError(bloc, error, stackTrace);
        print(error);
    }
}

void main() {
    BlocSupervisor.delegate = SimpleBlocDelegate();

    final StoryRepository storyRepository = StoryRepository(
        storyApiClient: StoryApiClient(
            httpClient: http.Client(),
        ),
    );

    runApp(
        App(
            storyRepository: storyRepository
        )
    );
}

class App extends StatelessWidget {
    final StoryRepository storyRepository;
    
    App({Key key, @required this.storyRepository})
        : assert(storyRepository != null),
            super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'CodExplorer',
            home: Stories(
                storyRepository: storyRepository,
            )
        );
    }
}
