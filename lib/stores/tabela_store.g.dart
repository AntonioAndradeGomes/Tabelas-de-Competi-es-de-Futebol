// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabela_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TabelaStore on _TabelaStoreBase, Store {
  final _$carregandoAtom = Atom(name: '_TabelaStoreBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$tabelaAtom = Atom(name: '_TabelaStoreBase.tabela');

  @override
  List<CampoTabela> get tabela {
    _$tabelaAtom.reportRead();
    return super.tabela;
  }

  @override
  set tabela(List<CampoTabela> value) {
    _$tabelaAtom.reportWrite(value, super.tabela, () {
      super.tabela = value;
    });
  }

  final _$getTabelaAsyncAction = AsyncAction('_TabelaStoreBase.getTabela');

  @override
  Future<void> getTabela(String codeCompeticao) {
    return _$getTabelaAsyncAction.run(() => super.getTabela(codeCompeticao));
  }

  final _$_TabelaStoreBaseActionController =
      ActionController(name: '_TabelaStoreBase');

  @override
  void setCarregando(bool value) {
    final _$actionInfo = _$_TabelaStoreBaseActionController.startAction(
        name: '_TabelaStoreBase.setCarregando');
    try {
      return super.setCarregando(value);
    } finally {
      _$_TabelaStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
tabela: ${tabela}
    ''';
  }
}
