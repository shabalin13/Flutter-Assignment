import 'package:flutter/material.dart';
import 'package:chucknorris_app/pages/random_joke.dart';
import 'package:chucknorris_app/http/http_service.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  Future<List<String>>? categories;

  @override
  void initState() {
    super.initState();
    categories = HttpService.getCategories();
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
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: categories,
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
              return Scrollbar(
                  child: ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RandomJoke(
                                    category: data[index],
                                  ),
                                ));
                          },
                          child: Text(data[index]),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black38,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              textStyle: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider()));
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          },
        ),
      ),
    );
  }
}
