class Time {
  num id;
  String nome, imageUrl;

  Time({this.id, this.nome, this.imageUrl});

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        id: json['id'],
        nome: json['name'],
        imageUrl: json['crestUrl'],
      );
}
