import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnProvider extends StatefulWidget {
  @override
  _LearnProviderState createState() => _LearnProviderState();
}

class _LearnProviderState extends State<LearnProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return ProvOne();
        }),
        ChangeNotifierProvider(create: (context) {
          return MyModel();
        })
      ],
      child: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: ListView(
          children: [
            Consumer<ProvOne>(builder: (context, proveone, child) {
              print("consumer text1");
              return Text(proveone.showSomething1);
            }),

            Consumer<ProvOne>(builder: (context, proveone, child) {
              return ElevatedButton(
                onPressed: () {
                  proveone.dosomething1();
                },
                child: Text("Do Something"),
              );
            }),
            Consumer<MyModel>(builder: (context, mymodel, child) {
              print("consumer text1");
              return Text(mymodel.showSomething1);
            }),

            Consumer<MyModel>(builder: (context, mymodel, child) {
              return ElevatedButton(
                onPressed: () {
                  mymodel.dosomething1();
                },
                child: Text("Do Something"),
              );
            }),
            // Consumer<ProvOne>(builder: (context, proveone, child) {
            //   return RaisedButton(
            //     onPressed: () {
            //       proveone.dosomething2();
            //     },
            //     child: Text("Do Something"),
            //   );
            // })
            ButtonTwo(),
          ],
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier {
  var showSomething1 = "Show Something";
  var showSomething2 = "Show Something";

  dosomething1() {
    showSomething1 = "Changeddd..Prove..(1)";
    notifyListeners();
  }

  dosomething2() {
    showSomething2 = "Changeddd..Prove..(2)";
    notifyListeners();
  }
}

class MyModel with ChangeNotifier {
  var showSomething1 = "Show Something";
  var showSomething2 = "Show Something";

  dosomething1() {
    showSomething1 = "Changeddd..MyModel..(1)";
    notifyListeners();
  }

  dosomething2() {
    showSomething2 = "Changeddd..MyModel..(2)";
    notifyListeners();
  }
}

class ButtonTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveone = Provider.of<ProvOne>(context);
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            proveone.dosomething2();
          },
          child: Text("Do Something 2"),
        ),
        Text(proveone.showSomething2),
      ],
    );
  }
}

//Consumer Without Selector
// class _LearnProviderState extends State<LearnProvider> {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) {
//         return ProvOne();
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Provider'),
//         ),
//         body: ListView(
//           children: [
//             Consumer<ProvOne>(builder: (context, proveone, child) {
//               return Text(proveone.showSomething1);
//             }),
//             Consumer<ProvOne>(builder: (context, proveone, child) {
//               return Text(proveone.showSomething2);
//             }),
//             Consumer<ProvOne>(builder: (context, proveone, child) {
//               return RaisedButton(
//                 onPressed: () {
//                   proveone.dosomething1();
//                 },
//                 child: Text("Do Something"),
//               );
//             }),
//             Consumer<ProvOne>(builder: (context, proveone, child) {
//               return RaisedButton(
//                 onPressed: () {
//                   proveone.dosomething2();
//                 },
//                 child: Text("Do Something"),
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProvOne with ChangeNotifier {
//   var showSomething1 = "Show Something";
//   var showSomething2 = "Show Something";
//   dosomething1() {
//     showSomething1 = "Changeddd....(1)";
//     notifyListeners();
//   }

//   dosomething2() {
//     showSomething2 = "Changeddd....(2)";
//     notifyListeners();
//   }
// }

///Selector
/* 
class _LearnProviderState extends State<LearnProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProvOne();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: ListView(
          children: [
            Selector<ProvOne, int>(
                selector: (context, provs1) => provs1.showone,
                builder: (context, proveone, child) {
                  print("selector text1");
                  return Text("${proveone}");
                }),
            Selector<ProvOne, String>(
                selector: (context, provs2) => provs2.showtwo,
                builder: (context, proveone, child) {
                  print("selector text2");
                  return Text(proveone);
                }),
            Consumer<ProvOne>(builder: (context, proveone, child) {
              return RaisedButton(
                onPressed: () {
                  proveone.dosomething1();
                },
                child: Text("Do Something"),
              );
            }),
            Consumer<ProvOne>(builder: (context, proveone, child) {
              return RaisedButton(
                onPressed: () {
                  proveone.dosomething2();
                },
                child: Text("Do Something"),
              );
            })
          ],
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier {
  var showSomething1 = 1;
  var showSomething2 = "Show Something";

  get showone => showSomething1;
  get showtwo => showSomething2;
  dosomething1() {
    showSomething1++;
    notifyListeners();
  }

  dosomething2() {
    showSomething2 = "Changeddd....(2)";
    notifyListeners();
  }
}
*/

/**
 * Provider.of(listen:false)
 * 
 * class _LearnProviderState extends State<LearnProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProvOne();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: ListView(
          children: [
            Consumer<ProvOne>(builder: (context, proveone, child) {
              print("consumer text1");
              return Text(proveone.showSomething1);
            }),
            Consumer<ProvOne>(builder: (context, proveone, child) {
              print("consumer text2");
              return Text(proveone.showSomething2);
            }),
            Consumer<ProvOne>(builder: (context, proveone, child) {
              return ElevatedButton(
                onPressed: () {
                  proveone.dosomething1();
                },
                child: Text("Do Something"),
              );
            }),
            // Consumer<ProvOne>(builder: (context, proveone, child) {
            //   return RaisedButton(
            //     onPressed: () {
            //       proveone.dosomething2();
            //     },
            //     child: Text("Do Something"),
            //   );
            // })
            ButtonTwo(),
          ],
        ),
      ),
    );
  }
}

class ProvOne with ChangeNotifier {
  var showSomething1 = "Show Something";
  var showSomething2 = "Show Something";

  dosomething1() {
    showSomething1 = "Changeddd....(1)";
    notifyListeners();
  }

  dosomething2() {
    showSomething2 = "Changeddd....(2)";
    notifyListeners();
  }
}

class ButtonTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveone = Provider.of<ProvOne>(context, listen: false);
    return ElevatedButton(
      onPressed: () {
        proveone.dosomething2();
      },
      child: Text("Do Something" + proveone.showSomething2),
    );
  }
}
 */
