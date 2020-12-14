import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:competicoes_futebol_tabelas/models/CampoTabela.dart';
import 'package:mobx/mobx.dart';
part 'tabela_store.g.dart';

class TabelaStore = _TabelaStoreBase with _$TabelaStore;

abstract class _TabelaStoreBase with Store {
  @observable
  bool carregando = true;

  @observable
  List<CampoTabela> tabela = [];

  @action
  void setCarregando(bool value) => carregando = value;

  @action
  Future<void> getTabela(String codeCompeticao) async {
    print('carregando');
    carregando = true;

    http.Response response = await http.get(
      'http://api.football-data.org/v2/competitions/$codeCompeticao/standings',
      headers: {'X-Auth-Token': 'e218d1641caa41a0977464529184054e'},
    );
    String body = response.body;
    Map data = jsonDecode(body);
    List tabelaApi = data['standings'][0]['table'];
    this.tabela = (tabelaApi).map((e) => CampoTabela.fromJson(e)).toList();
    carregando = false;
    print('não carregando');
  }
}
