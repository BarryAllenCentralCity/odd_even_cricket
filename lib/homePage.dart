import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odd_even_cricket/toss.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Odd Eve',
      home: HomePageLayout(),
    );
  }
}

class HomePageLayout extends StatefulWidget {
  const HomePageLayout({super.key});

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/bg/bg-home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Odd Eve', style: TextStyle(fontSize: 30, color: Colors.white),),
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Toss()));
                    },
                    child: Text('Vs Computer', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center, ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // alert dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Upcoming Feature'),
                            content: Text('This feature is not available yet'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text('Vs Player', style: TextStyle(fontSize: 20, color: Colors.black), textAlign: TextAlign.center, ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
    );
  }
}
