
class UserModel {
  final String? pause;
  final String? contrat;

  UserModel({
    this.pause,
    this.contrat,

  });

  UserModel.fromMap(Map<String,dynamic> res) :

        pause = res['pause'],
        contrat = res['contrat'];


  Map<String, Object?> toMap() {
    return {
      "contrat": contrat,
      "pause": pause,
    };

  }
}