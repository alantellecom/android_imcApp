import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController aux1 = TextEditingController();
  TextEditingController aux2 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _total = "";

  void _resetCampos() {
    setState(() {
      aux1.text = "";
      aux2.text = "";
      _total = "";
    });
  }

  void _multiplicaCampos() {
    setState(() {
      _total = (double.parse(aux1.text) * double.parse(aux2.text)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetCampos,
          )
        ],
      ),
      body: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: new Form(
          key: _formKey,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  child: new Icon(Icons.insert_emoticon,
                      color: const Color(0xFF000000), size: 48.0),
                  padding: const EdgeInsets.all(24.0),
                ),
                new Padding(
                  child: new TextFormField(
                    style: new TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0)),
                    textAlign: TextAlign.center,
                    controller: aux1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira seu Peso!";
                      }
                    },
                  ),
                  padding: const EdgeInsets.all(24.0),
                ),
                new Padding(
                  child: new TextFormField(
                    style: new TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura (Cm)",
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20.0)),
                    textAlign: TextAlign.center,
                    controller: aux2,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira sua altura!";
                      }
                    },
                  ),
                  padding: const EdgeInsets.all(24.0),
                ),
                new Container(
                  child: new RaisedButton(
                      key: null,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          buttonPressed();
                        }
                      },
                      color: Colors.blue,
                      child: new Text(
                        "Calcular",
                        style: new TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto"),
                      )),
                  padding: const EdgeInsets.fromLTRB(15.0, 9.0, 17.0, 9.0),
                  alignment: Alignment.center,
                ),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Text(
                        _total,
                        style: new TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ])
              ]),
        ),
      ),
    );
  }

  void buttonPressed() {
    _multiplicaCampos();
  }
}
