class Banner {
  String? id;
  String? link;
  bool? isAnimated;
  String? color;

  Banner({
    this.id,
    this.link,
    this.isAnimated,
    this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'link': link,
      'is_animated': isAnimated,
      'color': color,
    };
  }

  factory Banner.fromMap(Map<String, dynamic> map) {
    return Banner(
      id: map['id'] != null ? map['id'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      isAnimated: map['is_animated'] != null ? map['is_animated'] as bool : null,
      color: map['color'] != null ? map['color'] as String : null,
    );
  }
}
