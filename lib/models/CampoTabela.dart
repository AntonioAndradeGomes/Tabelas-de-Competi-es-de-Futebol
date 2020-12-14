import 'package:competicoes_futebol_tabelas/models/Time.dart';

class CampoTabela {
  num posicao,
      jogosDisputados,
      vitorias,
      empates,
      derrotas,
      pontos,
      golsPro,
      golsContra,
      saldoGols;
  Time time;

  CampoTabela({
    this.posicao,
    this.vitorias,
    this.derrotas,
    this.empates,
    this.golsContra,
    this.golsPro,
    this.jogosDisputados,
    this.pontos,
    this.saldoGols,
    this.time,
  });

  factory CampoTabela.fromJson(Map<String, dynamic> json) => CampoTabela(
        time: Time.fromJson(json['team']),
        posicao: json['position'],
        vitorias: json['won'],
        empates: json['draw'],
        derrotas: json['lost'],
        jogosDisputados: json['playedGames'],
        pontos: json['points'],
        golsPro: json['goalsFor'],
        golsContra: json['goalsAgainst'],
        saldoGols: json['goalDifference'],
      );
}
