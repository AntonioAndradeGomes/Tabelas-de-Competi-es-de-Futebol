import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class TableScreen extends StatefulWidget {
  final String codigo, competicao;
  TableScreen({@required this.codigo, @required this.competicao});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List _tabela;

  getTable() async {
    http.Response response = await http.get(
      'http://api.football-data.org/v2/competitions/${widget.codigo}/standings',
      headers: {'X-Auth-Token': 'e218d1641caa41a0977464529184054e'},
    );
    String body = response.body;
    Map data = jsonDecode(body);
    print(data);
    List tabela = data['standings'][0]['table'];
    setState(() {
      _tabela = tabela;
    });
  }

  @override
  void initState() {
    getTable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _tabela == null
        ? Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  const Color(0xFF01642E),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.competicao),
              centerTitle: true,
              backgroundColor: const Color(0xFF0C8F33),
              elevation: 0,
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF0C8F33),
                    const Color(0xFF01642E),
                  ],
                  begin: const FractionalOffset(0, 0),
                  end: const FractionalOffset(0, 1),
                  stops: [0, 1],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Text(
                                'Pos',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Clube',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'PL',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'W',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'D',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'L',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'GD',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Pts',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _buildTabela(),
                ],
              ),
            ),
          );
  }

  Widget _buildTabela() {
    List<Widget> times = [];
    for (var time in _tabela) {
      times.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    time['position'].toString().length > 1
                        ? Text(time['position'].toString() + ' - ')
                        : Text(' ' + time['position'].toString() + ' - '),
                    Row(
                      children: [
                        SvgPicture.network(
                          time['team']['crestUrl'],
                          height: 30,
                          width: 30,
                        ),
                        time['team']['name'].toString().length > 11
                            ? Text(
                                time['team']['name']
                                        .toString()
                                        .substring(0, 11) +
                                    '...',
                              )
                            : Text(
                                time['team']['name'].toString(),
                              ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time['playedGames'].toString(),
                    ),
                    Text(
                      time['won'].toString(),
                    ),
                    Text(
                      time['draw'].toString(),
                    ),
                    Text(
                      time['lost'].toString(),
                    ),
                    Text(
                      time['goalDifference'].toString(),
                    ),
                    Text(
                      time['points'].toString(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return Column(
      children: times,
    );
  }
}
