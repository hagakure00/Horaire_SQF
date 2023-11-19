
class UserModel {
  final String? pause;
  final String? contrat;
  final String? samCheck;

  UserModel({
    this.pause,
    this.contrat,
    this.samCheck,

  });

  UserModel.fromMap(Map<String,dynamic> res) :

        pause = res['pause'],
        contrat = res['contrat'],
        samCheck = res['samCheck'];


  Map<String, Object?> toMap() {
    return {
      "contrat": contrat,
      "pause": pause,
      "samCheck": samCheck

    };

  }
}