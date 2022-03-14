import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  double a = 0,
     b = 0,
      c = 0,
      bsq = 0, // vrijednost izraza ispod korijena
      x1 = 0,
      x2 = 0,
      res = 0,
      fra = 0, // razlomak b/2a
      inbr = 0; // korijen negativne vrijendosti (discr < 0)
  final formKey = GlobalKey<FormState>();
  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');
  TextEditingController t3 = TextEditingController(text: '');
  // postavljanje funkcije za rješavanje kvadratne jednadžbe
  rijesiJednadzbu() {
    setState(() {
      a = double.parse(t1.text);
      b = double.parse(t2.text);
      c = double.parse(t3.text);
      bsq = b * b - 4 * a * c;
      fra = -b / (2 * a);
      inbr = sqrt(-bsq) / (2 * a);
   // uvjet za izračun, ako je vrijednost izraza ispod korijena > 0 . izračun se ovrši na dolje definiran način
      if (bsq > 0) {
        x1 = ((-1 * b) + sqrt(bsq)) / (2 * a);
        x2 = ((-1 * b) - sqrt(bsq)) / (2 * a);
        // u slučaju da je vrijednosz izraza spod korijena < 0, izračun se vrši dolje definiran način
      } else {
        x1 = fra + inbr;
        x2 = fra - inbr;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffd7701),
        title: Text(
          'Rješenje kvadratne jednadžbe ' ,
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
              ),
      body: Container(
        // Widget za skrolanje
        child: SingleChildScrollView(
          key: formKey,
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 35, 15.0, 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'ax² + bx + c = 0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'x 1:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$x1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Arial',
                            color: Colors.deepPurple),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'x 2:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$x2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Arial',
                            color: Colors.deepPurple),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 20, color: Colors.green),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'a:  ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'koeficijent uz x²'),
                      controller: t1,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'b:  ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  SizedBox(
                    width: 270,
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'koeficijent uz x'),
                          controller: t2,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'c:  ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.green),
                  ),
                  SizedBox(
                    width: 299,
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: 'konstanta'),
                      controller: t3,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    elevation: 8,
                    onPressed: () {
                      //POZIVANJE FUNKCIJE
                      rijesiJednadzbu();
                      print('$x1 and $x2');
                    },
                    child: Text(
                      'Riješi',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Arial',
                      ),
                    ),
                    textColor: Colors.white,
                    color: Colors.green,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      RaisedButton(
                        elevation: 8,
                        onPressed: () {
                          controller:
                          t1.clear();
                          controller:
                          t2.clear();
                          controller:
                          t3.clear();
                        },
                        child: Text(
                          'Ponovi',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Arial',
                          ),
                        ),
                        textColor: Colors.white,
                        color: Colors.red,
                      ),
                      SizedBox(height: 90),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
