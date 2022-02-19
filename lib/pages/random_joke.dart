import 'package:flutter/material.dart';
import 'package:chucknorris_app/http/http_service.dart';
import 'package:url_launcher/url_launcher.dart';

class RandomJoke extends StatefulWidget {
  final String? category;

  const RandomJoke({Key? key, this.category}) : super(key: key);

  @override
  _RandomJokeState createState() => _RandomJokeState(category);
}

class _RandomJokeState extends State<RandomJoke> {
  Future<List<String>>? imageAndJoke;
  String? category;

  _RandomJokeState(this.category);

  @override
  void initState() {
    super.initState();
    imageAndJoke = HttpService.getRandomJoke(category: category);
  }

  String getTitle() {
    return (category == null) ? 'Random Joke' : 'Joke ($category category)';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(Icons.home))
          ],
          backgroundColor: Colors.black45,
          title: Text(getTitle()),
          centerTitle: true,
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: imageAndJoke,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text(snapshot.error.toString()),
                    );
                  },
                );
              } else if (snapshot.hasData) {
                var data = snapshot.data as List<String>;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Card(
                        color: Colors.black26,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 30)),
                            ListTile(
                              leading: Image.network(data[0]),
                              title: Text(
                                data[1],
                              ),
                            ),
                            TextButton.icon(
                              icon: const Icon(
                                Icons.link,
                                color: Colors.black54,
                              ),
                              onPressed: () => launchURL(data[2]),
                              label: Text(
                                data[2],
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black54,
                                    fontSize: 11),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 5)),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          imageAndJoke =
                              HttpService.getRandomJoke(category: category);
                        });
                      },
                      child: const Text('Get New Joke'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black45,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    )
                  ],
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              ));
            },
          ),
        ));
  }
}

void launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
