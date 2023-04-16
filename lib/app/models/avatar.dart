class Avatar {
  String id;
  String link;
  bool isAnimated;

  Avatar({
    required this.id,
    required this.link,
    required this.isAnimated,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'link': link,
      'is_animated': isAnimated,
    };
  }

  factory Avatar.fromMap(Map<String, dynamic> map) {
    return Avatar(
      id: map['id'] != null ? map['id'] as String : '',
      link: map['link'] != null ? map['link'] as String : '',
      isAnimated: map['is_animated'] != null ? map['is_animated'] as bool : false,
    );
  }
}
