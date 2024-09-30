class ActorInfoModel {
  bool? adult;
  List<String>? alsoKnownAs;
  String? biography;
  String? birthday;
  String? deathday;
  int? gender;
  String? homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;

  ActorInfoModel({
    this.adult,
    this.alsoKnownAs,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.id,
    this.imdbId,
    this.knownForDepartment,
    this.name,
    this.placeOfBirth,
    this.popularity,
    this.profilePath,
  });

  factory ActorInfoModel.fromJson(Map<String, dynamic> json) {
    return ActorInfoModel(
      adult: json['adult'],
      alsoKnownAs: List<String>.from(json['also_known_as']),
      biography: json['biography'],
      birthday: json['birthday'],
      deathday: json['deathday'],
      gender: json['gender'],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      placeOfBirth: json['place_of_birth'],
      popularity: json['popularity'].toDouble(),
      profilePath: json['profilePath'],
    );
  }
}
