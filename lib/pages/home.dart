import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
        title: const Text('Chuck Norris app'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/chucknorris_logo.png',
                height: 200,
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/random_joke');
                    },
                    child: const Text('Random Jokes'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/categories');
                  },
                  child: const Text('Categories'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/search');
                  },
                  child: const Text('Search'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.deepOrangeAccent,
                            title: const Text('About me'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: const [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/avatar.jpg'),
                                      radius: 25,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(right: 10)),
                                    Text(
                                      'Dmitrii Shabalin',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Times New Roman'),
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 20)),
                                const Text(
                                    'I\'m a 3rd year student at Innopolis University.\nI\'m learning to develop mobile applications. At the moment I\'m taking Flutter and Swift courses.'),
                                const Padding(
                                    padding: EdgeInsets.only(top: 30)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.mail_outline,
                                      size: 25,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Flexible(
                                        child: Text(
                                            'd.shabalin@innopolis.university')),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Icon(
                                      Icons.chat,
                                      size: 25,
                                    ),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text('@shabalin13'),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black45,
                                  )),
                            ],
                          );
                        });
                  },
                  child: const Text('About'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              // Text('Likes: $_count'),
            ],
          ),
        ],
      )),
    );
  }
}
