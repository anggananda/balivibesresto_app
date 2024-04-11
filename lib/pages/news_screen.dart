import 'package:flutter/material.dart';
import 'package:balivibesresto_app/dto/news.dart';
import 'package:balivibesresto_app/services/data_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  Future<List<News>>? _news;

  @override
  void initState() {
    super.initState();
    _news = DataService.fetchNews();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan API Data News'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: FutureBuilder<List<News>>(
            future: _news,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.5), // Warna bayangan
                              spreadRadius: 2, // Jarak bayangan dari objek
                              blurRadius: 5, // Besarnya "blur" pada bayangan
                              offset: Offset(0,
                                  3), // Posisi bayangan relatif terhadap objek
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(post.photo),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                ListTile(
                                  title: Text(
                                    post.title,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  subtitle: Text(
                                    post.body,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                  // trailing: TextButton(
                                  //   onPressed: () => _deleteNews(post.id),
                                  //   child: Icon(Icons.delete),
                                  // ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // Show a loading indicator while waiting for data
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
