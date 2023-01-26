import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Fazendo override em método herdado do Stateless Widget
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
  bool _zeroperson = true;
  bool _fullperson = false;
  int person = 0;

  void decrement() {
    setState(() {
      if (!_zeroperson) {
        person--;
      }
    });
  }

  void increment() {
    setState(() {
      if (!_fullperson) {
        person++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (person == 0) {
      _zeroperson = true;
    } else {
      _zeroperson = false;
    }
    if (person >= 20) {
      _fullperson = true;
    } else {
      _fullperson = false;
    }
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/image2.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _fullperson ? 'Lotaado!!' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 35,
                color: _fullperson ? Colors.red : Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              '$person',
              style: const TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _zeroperson ? Colors.red : Colors.white,
                    fixedSize: const Size(120, 120),
                    foregroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: BorderSide(
                        width: 3,
                      ),
                    ),
                  ),
                  onPressed: _zeroperson ? null : decrement,
                  child: Text(
                    _zeroperson ? 'Empty' : 'Saiu',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: _fullperson ? Colors.red : Colors.white,
                    fixedSize: const Size(120, 120),
                    foregroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: BorderSide(
                        width: 3,
                      ),
                    ),
                  ),
                  onPressed: _fullperson ? null : increment,
                  child: Text(
                    _fullperson ? 'Full' : 'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
