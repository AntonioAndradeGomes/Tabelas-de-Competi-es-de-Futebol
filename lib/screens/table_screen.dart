import 'dart:convert';
import 'package:competicoes_futebol_tabelas/stores/tabela_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class TableScreen extends StatefulWidget {
  final String codigo, competicao;
  TableScreen({@required this.codigo, @required this.competicao});

  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  TabelaStore _tabelaStore;

  @override
  void initState() {
    super.initState();
    _tabelaStore = TabelaStore();
    _tabelaStore.getTabela(widget.codigo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Observer(
          builder: (_) {
            if (_tabelaStore.carregando) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              );
            } else {
              return Column(
                /*physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),*/
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
                                'PJ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'VIT',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'E',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'DER',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'SG',
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
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _tabelaStore.tabela.length,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    _tabelaStore.tabela[index].posicao
                                                .toString()
                                                .length >
                                            1
                                        ? Text(
                                            _tabelaStore.tabela[index].posicao
                                                    .toString() +
                                                ' - ',
                                          )
                                        : Text(
                                            ' ' +
                                                _tabelaStore
                                                    .tabela[index].posicao
                                                    .toString() +
                                                ' - ',
                                          ),
                                    Row(
                                      children: [
                                        SvgPicture.network(
                                          _tabelaStore
                                              .tabela[index].time.imageUrl,
                                          height: 30,
                                          width: 30,
                                        ),
                                        _tabelaStore.tabela[index].time.nome
                                                    .length >
                                                13
                                            ? Text(
                                                _tabelaStore
                                                        .tabela[index].time.nome
                                                        .substring(0, 13) +
                                                    '...',
                                              )
                                            : Text(
                                                _tabelaStore
                                                    .tabela[index].time.nome,
                                              )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _tabelaStore.tabela[index].jogosDisputados
                                          .toString(),
                                    ),
                                    Text(
                                      _tabelaStore.tabela[index].vitorias
                                          .toString(),
                                    ),
                                    Text(
                                      _tabelaStore.tabela[index].empates
                                          .toString(),
                                    ),
                                    Text(
                                      _tabelaStore.tabela[index].derrotas
                                          .toString(),
                                    ),
                                    Text(
                                      _tabelaStore.tabela[index].saldoGols
                                          .toString(),
                                    ),
                                    Text(
                                      _tabelaStore.tabela[index].pontos
                                          .toString(),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
