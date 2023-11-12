class HoraireModel {
  final int? id;
  final String? date;
  final String? mois;
  final String? module;
  final String? s1d1a;
  final String? s1d1d;
  final String?s1d1t;
  final String? s1d2a;
  final String? s1d2d;
  final String? s1d2t;
  final String? s1d3a;
  final String? s1d3d;
  final String? s1d3t;
  final String? s1d4a;
  final String? s1d4d;
  final String? s1d4t;
  final String? s1d5a;
  final String? s1d5d;
  final String? s1d5t;
  final String? s1d6a;
  final String? s1d6d;
  final String? s1d6t;
  final String? totals1;

  final String? s2d1a;
  final String? s2d1d;
  final String? s2d1t;
  final String? s2d2a;
  final String? s2d2d;
  final String? s2d2t;
  final String? s2d3a;
  final String? s2d3d;
  final String? s2d3t;
  final String? s2d4a;
  final String? s2d4d;
  final String? s2d4t;
  final String? s2d5a;
  final String? s2d5d;
  final String? s2d5t;
  final String? s2d6a;
  final String? s2d6d;
  final String? s2d6t;
  final String? totals2;

  final String? s3d1a;
  final String? s3d1d;
  final String? s3d1t;
  final String? s3d2a;
  final String? s3d2d;
  final String? s3d2t;
  final String? s3d3a;
  final String? s3d3d;
  final String? s3d3t;
  final String? s3d4a;
  final String? s3d4d;
  final String? s3d4t;
  final String? s3d5a;
  final String? s3d5d;
  final String? s3d5t;
  final String? s3d6a;
  final String? s3d6d;
  final String? s3d6t;
  final String? totals3;

  final String? s4d1a;
  final String? s4d1d;
  final String? s4d1t;
  final String? s4d2a;
  final String? s4d2d;
  final String? s4d2t;
  final String? s4d3a;
  final String? s4d3d;
  final String? s4d3t;
  final String? s4d4a;
  final String? s4d4d;
  final String? s4d4t;
  final String? s4d5a;
  final String? s4d5d;
  final String? s4d5t;
  final String? s4d6a;
  final String? s4d6d;
  final String? s4d6t;
  final String? totals4;

  final String? s5d1a;
  final String? s5d1d;
  final String? s5d1t;
  final String? s5d2a;
  final String? s5d2d;
  final String? s5d2t;
  final String? s5d3a;
  final String? s5d3d;
  final String? s5d3t;
  final String? s5d4a;
  final String? s5d4d;
  final String? s5d4t;
  final String? s5d5a;
  final String? s5d5d;
  final String? s5d5t;
  final String? s5d6a;
  final String? s5d6d;
  final String? s5d6t;
  final String? totals5;

  final String? notifs1;
  final String? notifs2;
  final String? notifs3;
  final String? notifs4;
  final String? notifs5;

  final String? totalHeureDuMois;
  final String? totalModuleDuMois;

  final String? contratHoraire;
  final String? tempsPause;

  final String? absence;
  final String? heureSup;

  final String? congePaye;

  final String? cpS1j1;
  final String? cpS1j2;
  final String? cpS1j3;
  final String? cpS1j4;
  final String? cpS1j5;
  final String? cpS2j1;
  final String? cpS2j2;
  final String? cpS2j3;
  final String? cpS2j4;
  final String? cpS2j5;
  final String? cpS3j1;
  final String? cpS3j2;
  final String? cpS3j3;
  final String? cpS3j4;
  final String? cpS3j5;
  final String? cpS4j1;
  final String? cpS4j2;
  final String? cpS4j3;
  final String? cpS4j4;
  final String? cpS4j5;
  final String? cpS5j1;
  final String? cpS5j2;
  final String? cpS5j3;
  final String? cpS5j4;
  final String? cpS5j5;

  HoraireModel({
    this.id,
    this.date,
    this.mois,
    this.module,

     this.s1d1a,
     this.s1d1d,
     this.s1d1t,
     this.s1d2a,
     this.s1d2d,
     this.s1d2t,
     this.s1d3a,
     this.s1d3d,
     this.s1d3t,
     this.s1d4a,
     this.s1d4d,
     this.s1d4t,
     this.s1d5a,
     this.s1d5d,
     this.s1d5t,
     this.s1d6a,
     this.s1d6d,
     this.s1d6t,
     this.totals1,

     this.s2d1a,
     this.s2d1d,
     this.s2d1t,
     this.s2d2a,
     this.s2d2d,
     this.s2d2t,
     this.s2d3a,
     this.s2d3d,
     this.s2d3t,
     this.s2d4a,
     this.s2d4d,
     this.s2d4t,
     this.s2d5a,
     this.s2d5d,
     this.s2d5t,
     this.s2d6a,
     this.s2d6d,
     this.s2d6t,
     this.totals2,

     this.s3d1a,
     this.s3d1d,
     this.s3d1t,
     this.s3d2a,
     this.s3d2d,
     this.s3d2t,
     this.s3d3a,
     this.s3d3d,
     this.s3d3t,
     this.s3d4a,
     this.s3d4d,
     this.s3d4t,
     this.s3d5a,
     this.s3d5d,
     this.s3d5t,
     this.s3d6a,
     this.s3d6d,
     this.s3d6t,
     this.totals3,

     this.s4d1a,
     this.s4d1d,
     this.s4d1t,
     this.s4d2a,
     this.s4d2d,
     this.s4d2t,
     this.s4d3a,
     this.s4d3d,
     this.s4d3t,
     this.s4d4a,
     this.s4d4d,
     this.s4d4t,
     this.s4d5a,
     this.s4d5d,
     this.s4d5t,
     this.s4d6a,
     this.s4d6d,
     this.s4d6t,
     this.totals4,

      this.s5d1a,
      this.s5d1d,
      this.s5d1t,
      this.s5d2a,
      this.s5d2d,
      this.s5d2t,
      this.s5d3a,
      this.s5d3d,
      this.s5d3t,
      this.s5d4a,
      this.s5d4d,
      this.s5d4t,
      this.s5d5a,
      this.s5d5d,
      this.s5d5t,
      this.s5d6a,
      this.s5d6d,
      this.s5d6t,
      this.totals5,

      this.notifs1,
      this.notifs2,
      this.notifs3,
      this.notifs4,
      this.notifs5,

      this.totalHeureDuMois,
      this.totalModuleDuMois,

      this.contratHoraire,
      this.tempsPause,
      this.absence,
      this.heureSup,
      this.congePaye,

    this.cpS1j1,
    this.cpS1j2,
    this.cpS1j3,
    this.cpS1j4,
    this.cpS1j5,
    this.cpS2j1,
    this.cpS2j2,
    this.cpS2j3,
    this.cpS2j4,
    this.cpS2j5,
    this.cpS3j1,
    this.cpS3j2,
    this.cpS3j3,
    this.cpS3j4,
    this.cpS3j5,
    this.cpS4j1,
    this.cpS4j2,
    this.cpS4j3,
    this.cpS4j4,
    this.cpS4j5,
    this.cpS5j1,
    this.cpS5j2,
    this.cpS5j3,
    this.cpS5j4,
    this.cpS5j5,

  });

  HoraireModel.fromMap(Map<String,dynamic> res) :

        id = res['id'],
        mois = res['mois'],
        date = res['date'],
        module = res['module'],

  s1d1a =res['s1d1a'],
  s1d1d =res['s1d1d'],
  s1d1t =res['s1d1t'],
  s1d2a =res['s1d2a'],
  s1d2d =res['s1d2d'],
  s1d2t =res['s1d2t'],
  s1d3a =res['s1d3a'],
  s1d3d =res['s1d3d'],
  s1d3t =res['s1d3t'],
  s1d4a =res['s1d4a'],
  s1d4d =res['s1d4d'],
  s1d4t =res['s1d4t'],
  s1d5a =res['s1d5a'],
  s1d5d =res['s1d5d'],
  s1d5t =res['s1d5t'],
  s1d6a =res['s1d6a'],
  s1d6d =res['s1d6d'],
  s1d6t =res['s1d6t'],
  totals1 =res['totals1'],

  s2d1a =res['s2d1a'],
  s2d1d =res['s2d1d'],
  s2d1t =res['s2d1t'],
  s2d2a =res['s2d2a'],
  s2d2d =res['s2d2d'],
  s2d2t =res['s2d2t'],
  s2d3a =res['s2d3a'],
  s2d3d =res['s2d3d'],
  s2d3t =res['s2d3t'],
  s2d4a =res['s2d4a'],
  s2d4d =res['s2d4d'],
  s2d4t =res['s2d4t'],
  s2d5a =res['s2d5a'],
  s2d5d =res['s2d5d'],
  s2d5t =res['s2d5t'],
  s2d6a =res['s2d6a'],
  s2d6d =res['s2d6d'],
  s2d6t =res['s2d6t'],
  totals2 =res['totals2'],

  s3d1a =res['s3d1a'],
  s3d1d =res['s3d1d'],
  s3d1t =res['s3d1t'],
  s3d2a =res['s3d2a'],
  s3d2d =res['s3d2d'],
  s3d2t =res['s3d2t'],
  s3d3a =res['s3d3a'],
  s3d3d =res['s3d3d'],
  s3d3t =res['s3d3t'],
  s3d4a =res['s3d4a'],
  s3d4d =res['s3d4d'],
  s3d4t =res['s3d4t'],
  s3d5a =res['s3d5a'],
  s3d5d =res['s3d5d'],
  s3d5t =res['s3d5t'],
  s3d6a =res['s3d6a'],
  s3d6d =res['s3d6d'],
  s3d6t =res['s3d6t'],
  totals3 =res['totals3'],

  s4d1a =res['s4d1a'],
  s4d1d =res['s4d1d'],
  s4d1t =res['s4d1t'],
  s4d2a =res['s4d2a'],
  s4d2d =res['s4d2d'],
  s4d2t =res['s4d2t'],
  s4d3a =res['s4d3a'],
  s4d3d =res['s4d3d'],
  s4d3t =res['s4d3t'],
  s4d4a =res['s4d4a'],
  s4d4d =res['s4d4d'],
  s4d4t =res['s4d4t'],
  s4d5a =res['s4d5a'],
  s4d5d =res['s4d5d'],
  s4d5t =res['s4d5t'],
  s4d6a =res['s4d6a'],
  s4d6d =res['s4d6d'],
  s4d6t =res['s4d6t'],
  totals4 =res['totals4'],

  s5d1a =res['s5d1a'],
  s5d1d =res['s5d1d'],
  s5d1t =res['s5d1t'],
  s5d2a =res['s5d2a'],
  s5d2d =res['s5d2d'],
  s5d2t =res['s5d2t'],
  s5d3a =res['s5d3a'],
  s5d3d =res['s5d3d'],
  s5d3t =res['s5d3t'],
  s5d4a =res['s5d4a'],
  s5d4d =res['s5d4d'],
  s5d4t =res['s5d4t'],
  s5d5a =res['s5d5a'],
  s5d5d =res['s5d5d'],
  s5d5t =res['s5d5t'],
  s5d6a =res['s5d6a'],
  s5d6d =res['s5d6d'],
  s5d6t =res['s5d6t'],
  totals5 =res['totals5'],

  notifs1 =res['notifs1'],
  notifs2 =res['notifs2'],
  notifs3 =res['notifs3'],
  notifs4 =res['notifs4'],
  notifs5 =res['notifs5'],

  totalHeureDuMois =res['totalHeureDuMois'],
  totalModuleDuMois =res['totalModuleDuMois'],

  contratHoraire =res['contratHoraire'],
  absence =res['absence'],
  tempsPause =res['tempsPause'],
  heureSup =res['heureSup'],
  congePaye = res["congePaye"],

  cpS1j1 = res["cpS1j1"],
  cpS1j2 = res["cpS1j2"],
  cpS1j3 = res["cpS1j3"],
  cpS1j4 = res["cpS1j4"],
  cpS1j5 = res["cpS1j5"],
  cpS2j1 = res["cpS2j1"],
  cpS2j2 = res["cpS2j2"],
  cpS2j3 = res["cpS2j3"],
  cpS2j4 = res["cpS2j4"],
  cpS2j5 = res["cpS2j5"],
  cpS3j1 = res["cpS3j1"],
  cpS3j2 = res["cpS3j2"],
  cpS3j3 = res["cpS3j3"],
  cpS3j4 = res["cpS3j4"],
  cpS3j5 = res["cpS3j5"],
  cpS4j1 = res["cpS4j1"],
  cpS4j2 = res["cpS4j2"],
  cpS4j3 = res["cpS4j3"],
  cpS4j4 = res["cpS4j4"],
  cpS4j5 = res["cpS4j5"],
  cpS5j1 = res["cpS5j1"],
  cpS5j2 = res["cpS5j2"],
  cpS5j3 = res["cpS5j3"],
  cpS5j4 = res["cpS5j4"],
  cpS5j5 = res["cpS5j5"];



  Map<String, Object?> toMap() {
    return {
      "id": id,
      "mois": mois,
      "date": date,
      "module": module,

      "s1d1a": s1d1a,
      "s1d1d": s1d1d,
      "s1d1t": s1d1t,
      "s1d2a": s1d2a,
      "s1d2d": s1d2d,
      "s1d2t": s1d2t,
      "s1d3a": s1d3a,
      "s1d3d": s1d3d,
      "s1d3t": s1d3t,
      "s1d4a": s1d4a,
      "s1d4d": s1d4d,
      "s1d4t": s1d4t,
      "s1d5a": s1d5a,
      "s1d5d": s1d5d,
      "s1d5t": s1d5t,
      "s1d6a": s1d6a,
      "s1d6d": s1d6d,
      "s1d6t": s1d6t,
      "totals1": totals1,

      "s2d1a": s2d1a,
      "s2d1d": s2d1d,
      "s2d1t": s2d1t,
      "s2d2a": s2d2a,
      "s2d2d": s2d2d,
      "s2d2t": s2d2t,
      "s2d3a": s2d3a,
      "s2d3d": s2d3d,
      "s2d3t": s2d3t,
      "s2d4a": s2d4a,
      "s2d4d": s2d4d,
      "s2d4t": s2d4t,
      "s2d5a": s2d5a,
      "s2d5d": s2d5d,
      "s2d5t": s2d5t,
      "s2d6a": s2d6a,
      "s2d6d": s2d6d,
      "s2d6t": s2d6t,
      "totals2": totals2,

      "s3d1a": s3d1a,
      "s3d1d": s3d1d,
      "s3d1t": s3d1t,
      "s3d2a": s3d2a,
      "s3d2d": s3d2d,
      "s3d2t": s3d2t,
      "s3d3a": s3d3a,
      "s3d3d": s3d3d,
      "s3d3t": s3d3t,
      "s3d4a": s3d4a,
      "s3d4d": s3d4d,
      "s3d4t": s3d4t,
      "s3d5a": s3d5a,
      "s3d5d": s3d5d,
      "s3d5t": s3d5t,
      "s3d6a": s3d6a,
      "s3d6d": s3d6d,
      "s3d6t": s3d6t,
      "totals3": totals3,

      "s4d1a": s4d1a,
      "s4d1d": s4d1d,
      "s4d1t": s4d1t,
      "s4d2a": s4d2a,
      "s4d2d": s4d2d,
      "s4d2t": s4d2t,
      "s4d3a": s4d3a,
      "s4d3d": s4d3d,
      "s4d3t": s4d3t,
      "s4d4a": s4d4a,
      "s4d4d": s4d4d,
      "s4d4t": s4d4t,
      "s4d5a": s4d5a,
      "s4d5d": s4d5d,
      "s4d5t": s4d5t,
      "s4d6a": s4d6a,
      "s4d6d": s4d6d,
      "s4d6t": s4d6t,
      "totals4": totals4,

      "s5d1a": s5d1a,
      "s5d1d": s5d1d,
      "s5d1t": s5d1t,
      "s5d2a": s5d2a,
      "s5d2d": s5d2d,
      "s5d2t": s5d2t,
      "s5d3a": s5d3a,
      "s5d3d": s5d3d,
      "s5d3t": s5d3t,
      "s5d4a": s5d4a,
      "s5d4d": s5d4d,
      "s5d4t": s5d4t,
      "s5d5a": s5d5a,
      "s5d5d": s5d5d,
      "s5d5t": s5d5t,
      "s5d6a": s5d6a,
      "s5d6d": s5d6d,
      "s5d6t": s5d6t,
      "totals5": totals5,

      "notifs1": notifs1,
      "notifs2": notifs2,
      "notifs3": notifs3,
      "notifs4": notifs4,
      "notifs5": notifs5,

      "totalHeureDuMois": totalHeureDuMois,
      "totalModuleDuMois": totalModuleDuMois,

      "contratHoraire": contratHoraire,
      "tempsPause": tempsPause,
      "absence": absence,
      "heureSup": heureSup,
      "congePaye": congePaye,

      "cpS1j1": cpS1j1,
      "cpS1j2": cpS1j2,
      "cpS1j3": cpS1j3,
      "cpS1j4": cpS1j4,
      "cpS1j5": cpS1j5,
      "cpS2j1": cpS2j1,
      "cpS2j2": cpS2j2,
      "cpS2j3": cpS2j3,
      "cpS2j4": cpS2j4,
      "cpS2j5": cpS2j5,
      "cpS3j1": cpS3j1,
      "cpS3j2": cpS3j2,
      "cpS3j3": cpS3j3,
      "cpS3j4": cpS3j4,
      "cpS3j5": cpS3j5,
      "cpS4j1": cpS4j1,
      "cpS4j2": cpS4j2,
      "cpS4j3": cpS4j3,
      "cpS4j4": cpS4j4,
      "cpS4j5": cpS4j5,
      "cpS5j1": cpS5j1,
      "cpS5j2": cpS5j2,
      "cpS5j3": cpS5j3,
      "cpS5j4": cpS5j4,
      "cpS5j5": cpS5j5,

    };

  }
}