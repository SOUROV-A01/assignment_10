import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Profile';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primarySwatch: Colors.cyan),
    home: MainPage(title: title),
  );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: OrientationBuilder(
            builder: (context, orientation) =>
            deviceOrientation == Orientation.portrait
                ? buildPortrait()
                : buildLandscape(),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.rotate_left),
        //   onPressed: () {
        //     final isPortrait =
        //         MediaQuery.of(context).orientation == Orientation.portrait;
        //
        //     if (isPortrait) {
        //       setLandscape();
        //     } else {
        //       setPortrait();
        //     }
        //   },
        // ),
      );
}

  Future setPortrait() async => await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Future setLandscape() async => await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  Future setPortraitAndLandscape() =>
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);

  Widget buildPortrait() => ListView(
    children: [
      buildImage(),
      const SizedBox(height: 16),
      buildOthers(),
    ],
  );

  Widget buildLandscape() => Row(
    children: [
      buildImage(),
      const SizedBox(width: 16),
      Expanded(child: SingleChildScrollView(child: buildOthers())),
    ],
  );

  Widget buildImage() => CircleAvatar(
    radius: 220,
    backgroundImage: NetworkImage(
        'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600'),
  );

  Widget buildOthers() => Column(
    children: [
      // Container(
      //   // width: MediaQuery.of(context).size.width/2.5,
      //   // height: MediaQuery.of(context).size.height,
      //   child: CircleAvatar(
      //     radius: 220,
      //     backgroundImage: NetworkImage(
      //         'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600'),
      //   ),
      // ),
      SizedBox(height: 10),
      Column(
          children:[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'John Doe',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Photography is the art, application, and practice of creating images by recording light, either electronically by means of an image sensor, or chemically by means of a light-sensitive material such as photographic film',
                style: TextStyle(fontSize: 18, color: Colors.black),
                textDirection: TextDirection.ltr,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network(
                    'https://images.pexels.com/photos/2787216/pexels-photo-2787216.jpeg?auto=compress&cs=tinysrgb&w=600',
                    height: 120,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )])
    ],
  );
}