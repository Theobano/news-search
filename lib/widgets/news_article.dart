import 'package:flutter/material.dart';
import 'package:news_search/models/article.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArticleWidget extends StatelessWidget {
  final Article article;
  const NewsArticleWidget({Key? key, required this.article}) : super(key: key);

  void _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    Article article = this.article;
    return InkWell(
      // Make each article clickable
      onTap: () async {
        final url = Uri.parse(article.link);
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
          );
        }
      }, // Launch the article's link in the App
      child: Container(
        // Container for each article
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.black26,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              article.media != null && !article.media!.endsWith("null")
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: FadeInImage.memoryNetwork(
                          height: 200,
                          placeholder: kTransparentImage,
                          image: article.media ?? "",
                          fadeInDuration: const Duration(
                            milliseconds: 500,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 100,
                    ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    article.cleanUrl,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {
                      Share.share(article.link);
                    },
                    icon: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                      size: 20.0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
