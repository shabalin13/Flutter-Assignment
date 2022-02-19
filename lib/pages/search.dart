import 'package:flutter/material.dart';
import 'package:chucknorris_app/http/http_service.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _query = '';
  Future<List<List<String>>>? searchResult;

  @override
  void initState() {
    super.initState();
    searchResult = HttpService.search('qwerty');
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
        backgroundColor: Colors.black54,
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: searchResult,
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
              var data = snapshot.data as List<List<String>>;
              return Scrollbar(
                thickness: 3,
                isAlwaysShown: true,
                radius: const Radius.circular(10),
                child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Card(
                          color: Colors.black26,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 30)),
                              ListTile(
                                leading: Image.network(data[index][0]),
                                title: Text(
                                  data[index][1],
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(bottom: 30)),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider()),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content:
                      TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                      ),
                      labelStyle: TextStyle(color: Colors.black54),
                      labelText: 'Enter text to search',
                    ),
                    onChanged: (String value) {
                      _query = value;
                    },
                  ),
                  actions: [
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if ((_query != '') &&
                                (_query.length >= 3) &&
                                (_query.length <= 120)) {
                              searchResult = HttpService.search(_query);
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: const Text('Search'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[900],
                        ),
                      ),
                    )
                  ],
                );
              });
        },
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
