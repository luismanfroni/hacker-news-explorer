import 'package:codexplorer/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_open_browser/flutter_open_browser.dart';
import 'package:flutter_open_browser/setting_model.dart';

class StoryItem extends StatefulWidget {
    final Story story;
    StoryItem({Key key, this.story}) : super(key: key);

    @override
    State<StoryItem> createState() => _StoryItemState();
}
    
class _StoryItemState extends State<StoryItem> {
    Story story;
    @override
    void initState() {
        super.initState();
        story = widget.story;
    }

    @override
    Widget build(BuildContext context) {
        
        return Card(
            elevation: 1.7,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                    children: [
                        Row(
                            children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(left: 4.0),
                                    child: Text(
                                        story.time.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[600],
                                        ),
                                    ),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                        story.by,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700],
                                        ),
                                    ),
                                ),
                            ],
                        ),
                        Row(
                            children: [
                                Expanded(
                                    child: GestureDetector(
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.0,
                                                        right: 8.0,
                                                        bottom: 8.0,
                                                        top: 8.0),
                                                    child: Text(
                                                        story.title,
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 20
                                                        ),
                                                    ),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 4.0,
                                                        right: 4.0,
                                                        bottom: 4.0),
                                                    child: Row(
                                                        children: <Widget>[
                                                            Text(
                                                                "Score: " + story.score.toString(),
                                                                style: TextStyle(
                                                                    color: Colors.grey[500],
                                                                ),
                                                            )
                                                        ],
                                                    ),
                                                ),
                                            ],
                                        ),
                                        onTap: () {
                                            SettingModel settingModel = SettingModel(
                                                    url: widget.story.url,//Your url
                                                    intCaseShowError: SettingModel.SHOW_TOAST,//Show dialog or toast if error
                                                    messageErrorShow: "Could not open link.");//Your error message.
                                            FlutterOpenBrowser.openBrowserSelect(settingModel: settingModel);
                                        },
                                    ),
                                ),
                            ],
                        )
                    ],
                ), ////
            ),
        );
    }
}