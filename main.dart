import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  var arr = ['', '', '', '', '', '', '', '', ''];
  var result = '';
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      initializeGame();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tic Tac Toe',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (arr[index] == '') {
                            arr[index] = count % 2 == 0 ? 'X' : 'O';
                            count++;
                          }
                        });
                        if (count > 4) {
                          if (arr[0] == 'X' && arr[1] == 'X' && arr[2] == 'X' ||
                              arr[3] == 'X' && arr[4] == 'X' && arr[5] == 'X' ||
                              arr[6] == 'X' && arr[7] == 'X' && arr[8] == 'X' ||
                              arr[0] == 'X' && arr[4] == 'X' && arr[8] == 'X' ||
                              arr[2] == 'X' && arr[4] == 'X' && arr[6] == 'X' ||
                              arr[2] == 'X' && arr[5] == 'X' && arr[8] == 'X' ||
                              arr[0] == 'X' && arr[3] == 'X' && arr[6] == 'X' ||
                              arr[1] == 'X' && arr[4] == 'X' && arr[7] == 'X') {
                            result = player1Wins();
                          } else if (arr[0] == 'O' &&
                                  arr[1] == 'O' &&
                                  arr[2] == 'O' ||
                              arr[3] == 'O' && arr[4] == 'O' && arr[5] == 'O' ||
                              arr[6] == 'O' && arr[7] == 'O' && arr[8] == 'O' ||
                              arr[0] == 'O' && arr[4] == 'O' && arr[8] == 'O' ||
                              arr[2] == 'O' && arr[4] == 'O' && arr[6] == 'O' ||
                              arr[2] == 'O' && arr[5] == 'O' && arr[8] == 'O' ||
                              arr[0] == 'O' && arr[3] == 'O' && arr[6] == 'O' ||
                              arr[1] == 'O' && arr[4] == 'O' && arr[7] == 'O') {
                            result = player2Wins();
                          } else if (count == 9) {
                            result = draw();
                          }
                        }
                      },
                      child: Container(
                        color: Colors.grey[400],
                        child: Center(
                          child: Text(
                            arr[index],
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
            ),
            Text(
              result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  initializeGame();
                },
                child: const Text('Restart'))
          ],
        ));
  }

  void initializeGame() {
    setState(() {
      count = 0;
      arr = ['', '', '', '', '', '', '', '', ''];
      result = '';
    });
  }

  String player1Wins() {
    return 'Player 1 Wins';
  }

  String player2Wins() {
    return 'Player 2 Wins';
  }

  String draw() {
    return 'Match Drawn';
  }
}
