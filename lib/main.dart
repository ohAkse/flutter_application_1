import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Builder(builder: (context) {
        DefaultTabController.of(context).addListener(() {
          setState(() {});
        });

        return Scaffold(
          body: Stack(
            children: [
              const TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: TabPageSelector(
                          color: DefaultTabController.of(context).index == 1
                              ? Colors.blue[300]
                              : Colors.grey[400],
                          selectedColor:
                              DefaultTabController.of(context).index == 1
                                  ? Colors.white
                                  : Colors.blue,
                          indicatorSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// 첫번째 페이지
class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const songs = [
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비1',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비2',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비3',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비4',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비5',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비6',
      },
    ];

    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Icon(Icons.settings),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30.0),
                child: Text("라이브러리",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Row(children: [
            SizedBox(height: 20),
            ImageIcon(NetworkImage("https://i.ibb.co/hxNbZ8p/shazam.png")),
            Text(
              "Shazam",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Row(children: [
            SizedBox(height: 20),
            Icon(Icons.person_rounded),
            Text(
              "아티스트",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Row(children: [
            SizedBox(height: 20),
            Icon(Icons.music_note),
            Text(
              "회원님을 위한 재생목록",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
          ]),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
          child: Row(
            children: [
              SizedBox(height: 20),
              Text(
                "최근 Shazam",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: songs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 2.3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, int index) {
              var song = songs[index];
              String imageUrl = song['imageUrl']!;
              String title = song['title']!;
              String artist = song['artist']!;

              return Container(
                // margin: const EdgeInsets.only(
                //   top: 4,
                //   bottom: 4,
                // ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text(artist,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Image.network(
                                "https://i.ibb.co/KG9m5QS/applemusic.png",
                                //   width: 70,
                                width: 50,
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}

// 두번째 페이지
class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[300]!, Colors.blue[900]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    leadingWidth: 100,
                    leading: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        onTap: () =>
                            {DefaultTabController.of(context).animateTo(0)},
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person),
                            Text('라이브러리', maxLines: 1),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () =>
                              {DefaultTabController.of(context).animateTo(2)},
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.chat_rounded),
                              Text('차트'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Padding(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Text(
                  "Shazam하려면 탭하세요",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  "https://i.ibb.co/hxNbZ8p/shazam.png",
                  color: Colors.white,
                  width: 130,
                  height: 130,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                ),
              )
            ],
          ),
        ));
  }
}

// 세번째 페이지
class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const chartData = {
      'korea': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite1',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite2',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite3',
          'artist': 'BTS',
        },
      ],
      'global': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'newyork': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
    };

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("차트",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: Colors.purple[800],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "국가 및 도시별 차트",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              "전 세계",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("대한민국 차트", style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Text("모두 보기", style: TextStyle(fontSize: 20))
                      ]),
                    ),
                    Row(
                      children: [
                        ...chartData['korea']!
                            .where((keyValue) =>
                                (keyValue['imageUrl'] != null &&
                                    keyValue['imageUrl'] != "") &&
                                keyValue['name'] != null &&
                                keyValue['name'] != "" &&
                                keyValue['artist'] != null &&
                                keyValue['artist'] != "")
                            .map(
                          //..chartData['korea']!.map((keyValue)){ ...}
                          (keyValue) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    keyValue['imageUrl']!,
                                    width: MediaQuery.of(context).size.width *
                                        0.29,
                                  ),
                                  Text(
                                    keyValue['name']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(keyValue['artist']!),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("글로벌차트", style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Text("모두 보기", style: TextStyle(fontSize: 20))
                      ]),
                    ),
                    Row(
                      children: [
                        ...chartData['global']!
                            .where((keyValue) =>
                                (keyValue['imageUrl'] != null &&
                                    keyValue['imageUrl'] != "") &&
                                keyValue['name'] != null &&
                                keyValue['name'] != "" &&
                                keyValue['artist'] != null &&
                                keyValue['artist'] != "")
                            .map(
                          (keyValue) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    keyValue['imageUrl']!,
                                    width: MediaQuery.of(context).size.width *
                                        0.29,
                                  ),
                                  Text(
                                    keyValue['name']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(keyValue['artist']!),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(children: [
                        Text("뉴욕 차트", style: TextStyle(fontSize: 20)),
                        Spacer(),
                        Text("모두 보기", style: TextStyle(fontSize: 20))
                      ]),
                    ),
                    Row(
                      children: [
                        ...chartData['newyork']!
                            .where((keyValue) =>
                                (keyValue['imageUrl'] != null &&
                                    keyValue['imageUrl'] != "") &&
                                keyValue['name'] != null &&
                                keyValue['name'] != "" &&
                                keyValue['artist'] != null &&
                                keyValue['artist'] != "")
                            .map(
                          (keyValue) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    keyValue['imageUrl']!,
                                    width: MediaQuery.of(context).size.width *
                                        0.29,
                                  ),
                                  Text(
                                    keyValue['name']!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(keyValue['artist']!),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
