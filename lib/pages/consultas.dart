import 'package:flutter/material.dart';
import 'package:queue_manager/main.dart';

class Consultas extends StatefulWidget {
  @override
  _ConsultasState createState() => _ConsultasState();
}

class Areas {
  int id;
  String nome;

  Areas(this.id, this.nome);

  static List<Areas> getAreas() {
    return <Areas>[
      Areas(1, 'Cardiologista'),
      Areas(2, 'Psiquiatra'),
      Areas(3, 'Psicólogo (a)'),
      Areas(4, 'Pediatra'),
      Areas(5, 'Fisioterapeuta'),
    ];
  }
}

class _ConsultasState extends State<Consultas> {
  List<Areas> _areas = Areas.getAreas();
  List<DropdownMenuItem<Areas>> _dropdownmenuitens;

  Areas _selectedArea;

  @override
  void initState() {
    _dropdownmenuitens = buildDropdownMenuItens(_areas);
    _selectedArea = _dropdownmenuitens[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Areas>> buildDropdownMenuItens(List areas) {
    List<DropdownMenuItem<Areas>> items = List();
    for (Areas area in areas) {
      items.add(
        DropdownMenuItem(
          value: area,
          child: Text(area.nome),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Areas selectedArea) {
    setState(() {
      _selectedArea = selectedArea;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Consulta'),
      ),
      resizeToAvoidBottomPadding: false,
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
                Divider(),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CPF',
                  ),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Data da Consulta'),
                ),
                Divider(),
                DropdownButton(
                  value: _selectedArea,
                  items: _dropdownmenuitens,
                  onChanged: onChangeDropdownItem,
                ),
                ButtonTheme(
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                ButtonTheme(
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (context) => MyHomePage()), );
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
