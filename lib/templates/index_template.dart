import 'package:testapp0225/organisms/article_body.dart';
import 'package:flutter/material.dart';

class IndexTemplate extends StatefulWidget {
  const IndexTemplate({Key? key, this.data}) : super(key: key);
  final Map? data;

  @override
  _IndexTemplateState createState() => _IndexTemplateState();
}

class _IndexTemplateState extends State<IndexTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data!['title']),
        ),
        body: Container(
          // child: Text("test"),
            child: ArticleBodyOrganisms(data: widget.data!['body']['articles'],)
        )
    );

        // body: Container(
        //     width: double.infinity,
        //     child: ListView.builder(
        //         itemCount: widget.data!['body']["articles"] == null ? 0 : widget.data!['body']["articles"].length,
        //         itemBuilder: (BuildContext context, int index) {
        //           return ArticleBodyOrganisms();
        //         }
        //     )
        // )

        // body: Container(
        //     width: double.infinity,
        //     child: ListView(children: ArticleBodyOrganisms())));
  }
}
