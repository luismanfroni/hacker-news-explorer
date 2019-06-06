import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codexplorer/models/models.dart';

class StoryApiClient {
    static const baseUrl = 'https://hacker-news.firebaseio.com/v0/';
    static const headers = { "Accept": "application/json" };
    final http.Client httpClient;

    StoryApiClient({@required this.httpClient}) : assert(httpClient != null);

    Future<Story> getStory(BigInt storyId) async {
        final storyUrl = '$baseUrl/item/$storyId.json';
        var storyResponse = await http.get(Uri.encodeFull(storyUrl), headers: headers);
            
        if (storyResponse.statusCode != 200)
            throw Exception('Error fetching story $storyId');

        final storyJson = jsonDecode(storyResponse.body);
        
        return Story.fromJson(storyJson);
    }

    Future<List<Story>> fetchStories(String endpoint) async {
        final storiesUrl = '$baseUrl/$endpoint';
        List<Story> stories = new List<Story>();
        var storiesResponse = 
            await http.get(Uri.encodeFull(storiesUrl), headers: headers)
                .timeout(Duration(seconds: 10));
            
        if (storiesResponse.statusCode != 200)
            throw Exception('Error fetching stories <$endpoint>');

        List<BigInt> storiesId = 
            (jsonDecode(storiesResponse.body) as List<dynamic>)
                .map<BigInt>((id) => BigInt.from(id))
                .toList();
        
        final futures = storiesId.map((BigInt id) =>
            getStory(id)
        );
        stories = await Future.wait(futures);
    
        return stories;
    }

    Future<List<Story>> fetchTopStories() async =>
        fetchStories("topstories.json");
    
    Future<List<Story>> fetchNewStories() async =>
        fetchStories("newstories.json");

    Future<List<Story>> fetchBestStories() async =>
        fetchStories("beststories.json");
}