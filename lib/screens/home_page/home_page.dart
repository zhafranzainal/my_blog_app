import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackButton(color: Colors.transparent),
            title: const Text(
              "My Blog",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            radius: 21,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 20,
                              child: Image(
                                image: NetworkImage(
                                    "https://images.unsplash.com/photo-1557862921-37829c790f19?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("Person Name")
                        ],
                      ),
                      Image(
                        width: 200,
                        height: 200,
                        image: NetworkImage(
                          "https://c4.wallpaperflare.com/wallpaper/108/140/869/digital-digital-art-artwork-fantasy-art-drawing-hd-wallpaper-thumb.jpg",
                        ),
                      ),
                      Text(
                        "Title 1",
                        textAlign: TextAlign.start,
                      ),
                      Text("The sunset filled")
                    ],
                  ),
                );
              }),
        ));
  }
}
