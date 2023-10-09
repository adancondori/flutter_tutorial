import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final List<String> tasks;

  const TaskList(this.tasks, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return getDetail(index, tasks[index]);
      },
    );
  }

  Widget getDetail(int index, String name) {
    final image = const Center(
      child: Image(
        width: 100,
        image: NetworkImage('https://adancondori.github.io/images/qradm.jpg'),
      ),
    );

    final title = Container(
      margin: const EdgeInsets.only(
        top: 5,
        left: 10,
      ),
      child: Text(
        name,
        style: const TextStyle(
          fontFamily: "Roboto",
          fontSize: 18,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
      ),
    );
    final detail = Row(
      children: <Widget>[
        Expanded(
            child: Container(
          margin: const EdgeInsets.only(top: 0, left: 10, bottom: 25),
          child: Text(
            "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500",
            style: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        )),
        image,
      ],
    );

    final img2 = Center(child: Image.asset('assets/images/lake.jpeg'));
    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        img2,
        title,
        detail,
      ],
    );

    final container = Container(
      margin: const EdgeInsets.all(10.0),
      height: 350.0,
      child: info,
    );
    final card = Card(
      child: container,
      shadowColor: Colors.black,
      color: Colors.greenAccent[100],
    );
    return card;
  }

  /// ------

  Container cardContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.shade100.withOpacity(0.8),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: clipContainer(),
    );
  }

  ClipRRect clipContainer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              //gradient: color,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/hols"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 32.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          customText("designer.name", 16, true),
                          const SizedBox(
                            height: 4,
                          ),
                          customText("Title: sdfas dfsa", 14, false),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  customText('2343', 12, false),
                                  customText('Popularity', 12, false),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  customText('4736', 12, false),
                                  customText('Likes', 12, false),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  customText('136', 12, false),
                                  customText('Followed', 12, false),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customText("12", 18, true),
                      const SizedBox(
                        height: 4,
                      ),
                      customText('Ranking', 12, false),
                    ],
                  ),
                ],
              ),
            ),
          ),
          positionedIconButton(),
          positionedCircle(),
        ],
      ),
    );
  }

  Positioned positionedIconButton() {
    return Positioned(
      top: -6,
      right: 18,
      child: IconButton(
        icon: const Icon(Icons.more_horiz),
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }

  Widget customText(String cText, double cSize, bool type) {
    return Text(
      cText,
      style: TextStyle(
        fontSize: cSize,
        color: Colors.white,
        fontWeight: type ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Positioned positionedCircle() {
    return Positioned(
      top: -20,
      right: -125,
      child: Container(
        width: 210,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.grey.shade50.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
