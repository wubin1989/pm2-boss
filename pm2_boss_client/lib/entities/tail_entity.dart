class TailEntity {
  List<String> tail;

  TailEntity({this.tail});

  TailEntity.fromJson(Map<String, dynamic> json) {
    final Iterable tail = json['tail'];
    this.tail = tail.map((line) => line as String).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tail'] = this.tail;
    return data;
  }
}
