import 'dart:async';
import 'package:meta/meta.dart';
import 'package:codexplorer/repositories/story_api_client.dart';
import 'package:codexplorer/models/models.dart';

enum ApiCategory {
    Top,
    Best,
    New
}

class StoryRepository {
    final StoryApiClient storyApiClient;

    StoryRepository({@required this.storyApiClient})
        : assert(storyApiClient != null);

    Future<List<Story>> getStories(ApiCategory category) async {
        print("story_repository");
        switch(category) {
            case ApiCategory.Top:
                return await storyApiClient.fetchTopStories();

            case ApiCategory.Best:
                return await storyApiClient.fetchBestStories();

            case ApiCategory.New:
                return await storyApiClient.fetchNewStories();
                
            default:
                return null;
        }
    }
 
}