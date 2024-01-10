import 'dart:math';

import 'package:flutter/material.dart';
import 'package:whatsapp/pages/userdatalist.dart';

import 'all_class.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Icon iconSet = const Icon(Icons.message);
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    double orjWidth = MediaQuery.of(context).size.width;
    double cameraWidth = orjWidth / 24;
    double yourWidth = (orjWidth - cameraWidth) / 5;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff075e54),
          title: Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 0, top: 10),
                child: Text(
                  "WhatsApp",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Spacer(),
              Icon(
                Icons.search,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 25,
              ),
            ],
          ),
          toolbarHeight: 60,
          bottom: TabBar(
            onTap: (val) {},
            indicatorWeight: 3,
            labelPadding: EdgeInsets.symmetric(
                horizontal: (orjWidth - (cameraWidth + yourWidth * 3)) / 8,
                vertical: 5),
            labelColor: Colors.white,
            //indicatorSize: TabBarIndicatorSize.label,
            unselectedLabelColor: Colors.white54,
            tabs: [
              SizedBox(width: cameraWidth, child: const Icon(Icons.camera_alt)),
              SizedBox(
                  width: yourWidth,
                  child: const Text(
                    "CHATS",
                    style: TextStyle(fontSize: 14),
                  )),
              SizedBox(
                  width: yourWidth,
                  child: const Text(
                    "STATUS",
                    style: TextStyle(fontSize: 14),
                  )),
              SizedBox(
                  width: yourWidth,
                  child: const Text(
                    "CALLS",
                    style: TextStyle(fontSize: 14),
                  )),
            ],
            isScrollable: true,
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            //1 screen
            const Center(
              child: Text("Coming soon"),
            ),
            //2 screen
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: userdata.map((e) => user(e)).toList(),
                    ),
                  ),
                ],
              ),
            ),
            //3 screen
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: const NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRERUQbrIvI5VH_wcb7rkqiQlr4NudBEzI2PQ&usqp=CAU"),
                          child: Container(
                            alignment: const Alignment(1.5, 1.5),
                            child: const CircleAvatar(
                              backgroundColor: Color(0xff075e54),
                              radius: 12,
                              child: Icon(
                                Icons.add,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "My status",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Tap to add status update",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Recent updates",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: userdata.map((e) => statusPage(e)).toList(),
                    ),
                  ],
                ),
              ),
            ),
            //4 screen
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: userdata.map((e) => callPage(e)).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff075e54),
          onPressed: () {},
          child: iconSet,
        ),
      ),
    );
  }

  Widget user(Userdata data) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("page_2", arguments: data);
        },
        splashColor: Colors.blue,
        child: Row(
          children: [
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.black,
              maxRadius: 25,
              backgroundImage: NetworkImage(
                data.image,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Text(
                        data.name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(width: 80),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        data.time,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        data.chat,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
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

  Widget statusPage(e) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(e.image),
                  ),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${random.nextInt(59)} minutes ago",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget callPage(e) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(e.image),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  e.name,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "April ${random.nextInt(30)} , ${random.nextInt(12)}:${random.nextInt(59)},AM",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              (random.nextInt(10) % 2 == 0) ? Icons.call : Icons.video_call,
              color: const Color(0xff075e54),
            )
          ],
        ),
      ),
    );
  }
}
