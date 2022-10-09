class CharacterModel {
  CharacterModel({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.jobs,
    required this.image,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.actorName,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  late final int charId;
  late final String name;
  late final String birthday;
  late final List<String> jobs;
  late final String image;
  late final String status;
  late final String nickname;
  late final List<int> appearance;
  late final String actorName;
  late final String category;
  late final List<int> betterCallSaulAppearance;

  CharacterModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    jobs = List.castFrom<dynamic, String>(json['occupation']);
    image = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = List.castFrom<dynamic, int>(json['appearance']);
    actorName = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance =
        List.castFrom<dynamic, int>(json['better_call_saul_appearance']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['birthday'] = birthday;
    data['occupation'] = jobs;
    data['img'] = image;
    data['status'] = status;
    data['nickname'] = nickname;
    data['appearance'] = appearance;
    data['portrayed'] = actorName;
    data['category'] = category;
    data['better_call_saul_appearance'] = betterCallSaulAppearance;
    return data;
  }
}
