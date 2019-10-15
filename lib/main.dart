import 'dart:developer';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:simple_moment/simple_moment.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KTAMOBI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'KtaMobi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> rotasFiltradas;

  List<String> rotas = [
    "Ana Carrara X Menezes",
    "Ana Carrara X Taquara Preta",
    "Ana Carrara X Cháraca Paraíso",
    "Bom Pastor x Guanabara",
    "Carijós x Canoa",
    "Chácara Paraíso x Justino",
    "Colinas x Taquara Preta",
    "Ana Carrara X Menezes",
    "Ana Carrara X Taquara Preta",
    "Ana Carrara X Cháraca Paraíso",
    "Bom Pastor x Guanabara",
    "Carijós x Canoa",
    "Chácara Paraíso x Justino",
    "Colinas x Taquara Preta",
    "Ana Carrara X Menezes",
    "Ana Carrara X Taquara Preta",
    "Ana Carrara X Cháraca Paraíso",
    "Bom Pastor x Guanabara",
    "Carijós x Canoa",
    "Chácara Paraíso x Justino",
    "Colinas x Taquara Preta",
  ];

  @override
  void initState() {
    rotasFiltradas = rotas;
    super.initState();
  }

  List<String> _filterRotas(String e) {
    setState(() {
      this.rotasFiltradas = rotas.where((rota) {
        return rota.toUpperCase().contains(e.toUpperCase());
      }).toList();
    });
    return this.rotasFiltradas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  onChanged: (value) {
                    _filterRotas(value);
                  },
                  autofocus: true,
                  style: TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                    border: OutlineInputBorder(),
                    labelText: "Qual bairro?",
                    labelStyle: TextStyle(fontSize: 20),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: rotasFiltradas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HorariosOnibus())),
                    title: Text(
                      '${rotasFiltradas[index]}',
                      style: TextStyle(fontSize: 22),
                    ),
                    trailing: Icon(Icons.directions_bus),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorariosOnibus extends StatefulWidget {
  @override
  _HorariosOnibusState createState() => _HorariosOnibusState();
}

class _HorariosOnibusState extends State<HorariosOnibus> {
  int _handleDay() {
    var now = new DateTime.now().weekday;

    if (now == DateTime.sunday) return 2;
    if (now == DateTime.saturday) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: _handleDay(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Card de horários"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "Dias úteis",
              ),
              Tab(
                text: "Feriados/Domingo",
              ),
              Tab(
                text: "Sábado",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.red,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                      Text("DASDASD"),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
