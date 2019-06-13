import 'package:flutter_web/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController controller = PageController();
  var currentPage = 0.0;

  @override
  Widget build(BuildContext context) {
    Offset offset = Offset(0.4,0.7);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    List<Widget> getContainer() {
      List<Widget> container = new List();
      container.add(Container(margin: EdgeInsets.all(8), color: Colors.teal));
      container.add(Container(
        margin: EdgeInsets.all(8),
        color: Colors.orangeAccent,
      ));
      container.add(Container(
        margin: EdgeInsets.all(8),
        color: Colors.blueAccent,
      ));
      container.add(Container(
        margin: EdgeInsets.all(8),
        color: Colors.greenAccent,
      ));
      return container;
    }

    return Scaffold(
      backgroundColor: Color(0xFF37474F),
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text('Dashboard'),
//      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: DrawerHeader(
                  child: CircleAvatar(
                backgroundImage: AssetImage('dp.jpg'),
              )),
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Dashboard',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Messages',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
//            child: PageView(
//              children: <Widget>[
//
//              ],
//              controller: controller,
//              scrollDirection: Axis.horizontal,
//              pageSnapping: true,
//
//            ),

            child: PageView.builder(
                controller: controller,
                itemCount: 4,
                itemBuilder: (context, position) {
                  if (position == currentPage.floor()) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateY(position - currentPage)
                        ..rotateX(position - currentPage),
                      alignment: FractionalOffset.center,
                      child: Container(
                        child: getContainer().elementAt(position.floor()),
                      ),
                    );
                  } else if (position == currentPage.floor()+1) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..rotateY(position - currentPage)
                        ..rotateX(position - currentPage),
                      alignment: FractionalOffset.center,
                      child: Container(
                        child: getContainer().elementAt(position.floor()),
                      ),
                    );
                  } else {
                   return Transform(
                      transform: Matrix4.identity()
                        ..rotateY(position - currentPage)
                        ..rotateX(position - currentPage),
                      alignment: FractionalOffset.center,
                      child: Container(
                        child: getContainer().elementAt(position.floor()),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );

    //Center(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: 20,
    //           itemBuilder: (BuildContext context, int index) {
    //             return ListTile(
    //               title: Text("Item $index"),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // )
    // );
  }
}
