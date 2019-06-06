import 'package:equatable/equatable.dart';

enum ItemType {
    Job,
    Story,
    Comment,
    Poll,
    PollOpt,
    Unknown
}

class Story extends Equatable {
    final BigInt id;
    final String url;
    final String title;
    final ItemType type;
    final String by;
    final int score;
    final DateTime time;

    Story({
        this.id,
        this.url,
        this.title,
        this.type,
        this.by,
        this.score,
        this.time
    }) : super([
            id,
            url,
            title,
            type,
            by,
            score,
            time
        ]);

    static Story fromJson(dynamic json) {
        return Story(
            id: BigInt.from(json['id']),
            url: json['url'],
            title: json['title'],
            type: _mapStringToItemType(json['type']),
            by: json['by'],
            score: json['score'] as int,
            time: DateTime.fromMillisecondsSinceEpoch(
                ((json['time'] as int) * 1000), isUtc: true
            )
        );
    }

    static ItemType _mapStringToItemType(String input) {
        switch (input) {
            case 'job':
                return ItemType.Job;
            case 'story':
                return ItemType.Story;
            case 'comment':
                return ItemType.Comment;
            case 'poll':
                return ItemType.Poll;
            case 'pollOpt':
                return ItemType.PollOpt;
            default:
                return ItemType.Unknown;
        }
    }
}