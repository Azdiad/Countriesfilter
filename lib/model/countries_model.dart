import 'dart:convert';

List<CountriesModel> countriesModelFromJson(String str) =>
    List<CountriesModel>.from(
        json.decode(str).map((x) => CountriesModel.fromJson(x)));

String countriesModelToJson(List<CountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesModel {
  Name name;
  List<String>? tld;
  String cca2;
  String? ccn3;
  String cca3;
  String? cioc;
  bool? independent;
  Status status;
  bool unMember;
  Currencies? currencies;
  Idd idd;
  List<String>? capital;
  List<String> altSpellings;
  Region region;
  String? subregion;
  Map<String, String>? languages;
  Map<String, Translation> translations;
  List<double> latlng;
  bool landlocked;
  List<String>? borders;
  double area;
  Demonyms? demonyms;
  String flag;
  Maps maps;
  int population;
  Map<String, double>? gini;
  String? fifa;
  Car car;
  List<String> timezones;
  List<Continent> continents;
  Flags flags;
  CoatOfArms coatOfArms;
  StartOfWeek startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode? postalCode;

  CountriesModel({
    required this.name,
    this.tld,
    required this.cca2,
    this.ccn3,
    required this.cca3,
    this.cioc,
    this.independent,
    required this.status,
    required this.unMember,
    this.currencies,
    required this.idd,
    this.capital,
    required this.altSpellings,
    required this.region,
    this.subregion,
    this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    this.borders,
    required this.area,
    this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    this.gini,
    this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    this.postalCode,
  });
  static Map<String, String> parseLanguages(Map<String, dynamic> json) {
    if (json["languages"] != null && json["languages"] is Map) {
      var languagesRaw = json["languages"] as Map;
      Map<String, String> languagesParsed = {};
      languagesRaw.forEach((key, value) {
        if (key is String && value is String) {
          languagesParsed[key] = value;
        } else {
          throw FormatException(
              "Expected key and value to be string in 'languages' map.");
        }
      });
      return languagesParsed;
    } else {
      return {};
    }
  }

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? []
            : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"],
        status: statusValues.map[json["status"]]!,
        unMember: json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        idd: Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: regionValues.map[json["region"]]!,
        subregion: json["subregion"],
        languages: parseLanguages(json),
        translations: Map.from(json["translations"]).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: List<double>.from(json["latlng"].map((x) => x?.toDouble())),
        landlocked: json["landlocked"],
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        area: json["area"]?.toDouble(),
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        gini:
            json["gini"] != null ? Map<String, double>.from(json["gini"]) : {},
        fifa: json["fifa"],
        car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<Continent>.from(
            json["continents"].map((x) => continentValues.map[x]!)),
        flags: Flags.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: startOfWeekValues.map[json["startOfWeek"]]!,
        capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        "ccn3": ccn3,
        "cca3": cca3,
        "cioc": cioc,
        "independent": independent,
        "status": statusValues.reverse[status],
        "unMember": unMember,
        "currencies": currencies?.toJson(),
        "idd": idd.toJson(),
        "capital":
            capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": regionValues.reverse[region],
        "subregion": subregion,
        "languages":
            Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "translations": Map.from(translations)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "landlocked": landlocked,
        "borders":
            borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        "area": area,
        "demonyms": demonyms?.toJson(),
        "flag": flag,
        "maps": maps.toJson(),
        "population": population,
        "gini": Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "fifa": fifa,
        "car": car.toJson(),
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "continents": List<dynamic>.from(
            continents.map((x) => continentValues.reverse[x])),
        "flags": flags.toJson(),
        "coatOfArms": coatOfArms.toJson(),
        "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        "capitalInfo": capitalInfo.toJson(),
        "postalCode": postalCode?.toJson(),
      };
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({
    this.latlng,
  });

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<double>.from(json["latlng"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  List<String>? signs;
  Side side;

  Car({
    this.signs,
    required this.side,
  });

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: sideValues.map[json["side"]]!,
      );

  Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}

enum Side { LEFT, RIGHT }

final sideValues = EnumValues({"left": Side.LEFT, "right": Side.RIGHT});

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({
    this.png,
    this.svg,
  });

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

enum Continent {
  AFRICA,
  ANTARCTICA,
  ASIA,
  EUROPE,
  NORTH_AMERICA,
  OCEANIA,
  SOUTH_AMERICA
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currencies {
  Aed? mdl;
  Aed? usd;
  Aed? eur;
  Aed? aud;
  Aed? mzn;
  Aed? brl;
  Aed? cve;
  Aed? xaf;
  Aed? all;
  Aed? nzd;
  Aed? ngn;
  Aed? gmd;
  Aed? sos;
  Aed? yer;
  Aed? myr;
  Aed? xcd;
  Aed? gbp;
  Aed? mga;
  Aed? dzd;
  Aed? mad;
  Aed? mru;
  Aed? pyg;
  Aed? lkr;
  Aed? zar;
  Aed? kwd;
  Aed? sll;
  Aed? rwf;
  Aed? syp;
  Aed? hnl;
  Aed? jod;
  Aed? tvd;
  Aed? npr;
  Aed? lrd;
  Aed? ggp;
  Aed? djf;
  Aed? fjd;
  Aed? nok;
  Aed? fkp;
  Aed? kzt;
  Aed? tmt;
  Aed? bgn;
  Aed? xpf;
  Aed? bbd;
  Aed? stn;
  Aed? bnd;
  Aed? sgd;
  Aed? btn;
  Aed? inr;
  Aed? ars;
  Aed? azn;
  Aed? mxn;
  Aed? gtq;
  Aed? kes;
  Aed? czk;
  Aed? gip;
  Aed? awg;
  Aed? aed;
  Aed? ssp;
  Aed? xof;
  Aed? shp;
  Aed? bwp;
  Aed? uzs;
  Aed? tnd;
  Aed? hkd;
  Aed? mkd;
  Aed? srd;
  Aed? sbd;
  Aed? uah;
  Bam? bam;
  Aed? irr;
  Aed? cuc;
  Aed? cup;
  Aed? ern;
  Aed? currenciesTry;
  Aed? php;
  Aed? vuv;
  Aed? bob;
  Aed? ron;
  Aed? khr;
  Aed? zwl;
  Aed? jep;
  Aed? kgs;
  Aed? gyd;
  Aed? amd;
  Aed? lbp;
  Aed? dkk;
  Aed? pgk;
  Aed? zmw;
  Aed? ttd;
  Aed? pen;
  Aed? sek;
  Bam? sdg;
  Aed? omr;
  Aed? twd;
  Aed? mnt;
  Aed? tzs;
  Aed? cad;
  Aed? crc;
  Aed? cny;
  Aed? cop;
  Aed? mmk;
  Aed? rub;
  Aed? kpw;
  Aed? kyd;
  Aed? byn;
  Aed? szl;
  Aed? pln;
  Aed? chf;
  Aed? ves;
  Aed? pab;
  Aed? wst;
  Aed? fok;
  Aed? thb;
  Aed? bsd;
  Aed? top;
  Aed? bif;
  Aed? bhd;
  Aed? imp;
  Aed? htg;
  Aed? afn;
  Aed? ils;
  Aed? lyd;
  Aed? uyu;
  Aed? nio;
  Aed? ckd;
  Aed? lak;
  Aed? kid;
  Aed? ang;
  Aed? jmd;
  Aed? egp;
  Aed? clp;
  Aed? lsl;
  Aed? ghs;
  Aed? scr;
  Aed? aoa;
  Aed? bmd;
  Aed? pkr;
  Aed? sar;
  Aed? krw;
  Aed? etb;
  Aed? bdt;
  Aed? kmf;
  Aed? bzd;
  Aed? ugx;
  Aed? huf;
  Aed? isk;
  Aed? tjs;
  Aed? nad;
  Aed? rsd;
  Aed? mur;
  Aed? mop;
  Aed? mvr;
  Aed? idr;
  Aed? cdf;
  Aed? vnd;
  Aed? gnf;
  Aed? gel;
  Aed? mwk;
  Aed? iqd;
  Aed? jpy;
  Aed? dop;
  Aed? qar;

  Currencies({
    this.mdl,
    this.usd,
    this.eur,
    this.aud,
    this.mzn,
    this.brl,
    this.cve,
    this.xaf,
    this.all,
    this.nzd,
    this.ngn,
    this.gmd,
    this.sos,
    this.yer,
    this.myr,
    this.xcd,
    this.gbp,
    this.mga,
    this.dzd,
    this.mad,
    this.mru,
    this.pyg,
    this.lkr,
    this.zar,
    this.kwd,
    this.sll,
    this.rwf,
    this.syp,
    this.hnl,
    this.jod,
    this.tvd,
    this.npr,
    this.lrd,
    this.ggp,
    this.djf,
    this.fjd,
    this.nok,
    this.fkp,
    this.kzt,
    this.tmt,
    this.bgn,
    this.xpf,
    this.bbd,
    this.stn,
    this.bnd,
    this.sgd,
    this.btn,
    this.inr,
    this.ars,
    this.azn,
    this.mxn,
    this.gtq,
    this.kes,
    this.czk,
    this.gip,
    this.awg,
    this.aed,
    this.ssp,
    this.xof,
    this.shp,
    this.bwp,
    this.uzs,
    this.tnd,
    this.hkd,
    this.mkd,
    this.srd,
    this.sbd,
    this.uah,
    this.bam,
    this.irr,
    this.cuc,
    this.cup,
    this.ern,
    this.currenciesTry,
    this.php,
    this.vuv,
    this.bob,
    this.ron,
    this.khr,
    this.zwl,
    this.jep,
    this.kgs,
    this.gyd,
    this.amd,
    this.lbp,
    this.dkk,
    this.pgk,
    this.zmw,
    this.ttd,
    this.pen,
    this.sek,
    this.sdg,
    this.omr,
    this.twd,
    this.mnt,
    this.tzs,
    this.cad,
    this.crc,
    this.cny,
    this.cop,
    this.mmk,
    this.rub,
    this.kpw,
    this.kyd,
    this.byn,
    this.szl,
    this.pln,
    this.chf,
    this.ves,
    this.pab,
    this.wst,
    this.fok,
    this.thb,
    this.bsd,
    this.top,
    this.bif,
    this.bhd,
    this.imp,
    this.htg,
    this.afn,
    this.ils,
    this.lyd,
    this.uyu,
    this.nio,
    this.ckd,
    this.lak,
    this.kid,
    this.ang,
    this.jmd,
    this.egp,
    this.clp,
    this.lsl,
    this.ghs,
    this.scr,
    this.aoa,
    this.bmd,
    this.pkr,
    this.sar,
    this.krw,
    this.etb,
    this.bdt,
    this.kmf,
    this.bzd,
    this.ugx,
    this.huf,
    this.isk,
    this.tjs,
    this.nad,
    this.rsd,
    this.mur,
    this.mop,
    this.mvr,
    this.idr,
    this.cdf,
    this.vnd,
    this.gnf,
    this.gel,
    this.mwk,
    this.iqd,
    this.jpy,
    this.dop,
    this.qar,
  });

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
        usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
        eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
        aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
        mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
        brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
        cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
        xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
        all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
        nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
        ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
        gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
        sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
        yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
        myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
        xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
        gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
        mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
        dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
        mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
        mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
        pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
        lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
        zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
        kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
        sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
        rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
        syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
        hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
        jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
        tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
        npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
        lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
        ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
        djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
        fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
        nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
        fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
        kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
        tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
        bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
        xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
        bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
        stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
        bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
        sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
        btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
        inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
        ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
        azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
        mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
        gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
        kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
        czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
        gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
        awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
        aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
        ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
        xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
        shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
        bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
        uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
        tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
        hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
        mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
        srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
        sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
        uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
        bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
        irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
        cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
        ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
        currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
        php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
        vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
        bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
        ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
        khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
        zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
        jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
        kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
        gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
        amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
        lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
        dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
        pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
        zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
        ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
        pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
        sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
        sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
        omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
        twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
        mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
        tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
        cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
        crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
        cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
        cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
        mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
        rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
        kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
        kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
        byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
        szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
        pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
        chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
        ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
        pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
        wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
        fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
        thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
        bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
        top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
        bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
        bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
        imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
        htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
        afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
        ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
        lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
        uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
        nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
        ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
        lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
        kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
        ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
        jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
        egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
        clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
        lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
        ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
        scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
        aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
        bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
        pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
        sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
        krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
        etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
        bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
        kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
        bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
        ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
        huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
        isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
        tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
        nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
        rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
        mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
        mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
        mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
        idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
        cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
        vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
        gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
        gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
        mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
        iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
        jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
        dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
        qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
      );

  Map<String, dynamic> toJson() => {
        "MDL": mdl?.toJson(),
        "USD": usd?.toJson(),
        "EUR": eur?.toJson(),
        "AUD": aud?.toJson(),
        "MZN": mzn?.toJson(),
        "BRL": brl?.toJson(),
        "CVE": cve?.toJson(),
        "XAF": xaf?.toJson(),
        "ALL": all?.toJson(),
        "NZD": nzd?.toJson(),
        "NGN": ngn?.toJson(),
        "GMD": gmd?.toJson(),
        "SOS": sos?.toJson(),
        "YER": yer?.toJson(),
        "MYR": myr?.toJson(),
        "XCD": xcd?.toJson(),
        "GBP": gbp?.toJson(),
        "MGA": mga?.toJson(),
        "DZD": dzd?.toJson(),
        "MAD": mad?.toJson(),
        "MRU": mru?.toJson(),
        "PYG": pyg?.toJson(),
        "LKR": lkr?.toJson(),
        "ZAR": zar?.toJson(),
        "KWD": kwd?.toJson(),
        "SLL": sll?.toJson(),
        "RWF": rwf?.toJson(),
        "SYP": syp?.toJson(),
        "HNL": hnl?.toJson(),
        "JOD": jod?.toJson(),
        "TVD": tvd?.toJson(),
        "NPR": npr?.toJson(),
        "LRD": lrd?.toJson(),
        "GGP": ggp?.toJson(),
        "DJF": djf?.toJson(),
        "FJD": fjd?.toJson(),
        "NOK": nok?.toJson(),
        "FKP": fkp?.toJson(),
        "KZT": kzt?.toJson(),
        "TMT": tmt?.toJson(),
        "BGN": bgn?.toJson(),
        "XPF": xpf?.toJson(),
        "BBD": bbd?.toJson(),
        "STN": stn?.toJson(),
        "BND": bnd?.toJson(),
        "SGD": sgd?.toJson(),
        "BTN": btn?.toJson(),
        "INR": inr?.toJson(),
        "ARS": ars?.toJson(),
        "AZN": azn?.toJson(),
        "MXN": mxn?.toJson(),
        "GTQ": gtq?.toJson(),
        "KES": kes?.toJson(),
        "CZK": czk?.toJson(),
        "GIP": gip?.toJson(),
        "AWG": awg?.toJson(),
        "AED": aed?.toJson(),
        "SSP": ssp?.toJson(),
        "XOF": xof?.toJson(),
        "SHP": shp?.toJson(),
        "BWP": bwp?.toJson(),
        "UZS": uzs?.toJson(),
        "TND": tnd?.toJson(),
        "HKD": hkd?.toJson(),
        "MKD": mkd?.toJson(),
        "SRD": srd?.toJson(),
        "SBD": sbd?.toJson(),
        "UAH": uah?.toJson(),
        "BAM": bam?.toJson(),
        "IRR": irr?.toJson(),
        "CUC": cuc?.toJson(),
        "CUP": cup?.toJson(),
        "ERN": ern?.toJson(),
        "TRY": currenciesTry?.toJson(),
        "PHP": php?.toJson(),
        "VUV": vuv?.toJson(),
        "BOB": bob?.toJson(),
        "RON": ron?.toJson(),
        "KHR": khr?.toJson(),
        "ZWL": zwl?.toJson(),
        "JEP": jep?.toJson(),
        "KGS": kgs?.toJson(),
        "GYD": gyd?.toJson(),
        "AMD": amd?.toJson(),
        "LBP": lbp?.toJson(),
        "DKK": dkk?.toJson(),
        "PGK": pgk?.toJson(),
        "ZMW": zmw?.toJson(),
        "TTD": ttd?.toJson(),
        "PEN": pen?.toJson(),
        "SEK": sek?.toJson(),
        "SDG": sdg?.toJson(),
        "OMR": omr?.toJson(),
        "TWD": twd?.toJson(),
        "MNT": mnt?.toJson(),
        "TZS": tzs?.toJson(),
        "CAD": cad?.toJson(),
        "CRC": crc?.toJson(),
        "CNY": cny?.toJson(),
        "COP": cop?.toJson(),
        "MMK": mmk?.toJson(),
        "RUB": rub?.toJson(),
        "KPW": kpw?.toJson(),
        "KYD": kyd?.toJson(),
        "BYN": byn?.toJson(),
        "SZL": szl?.toJson(),
        "PLN": pln?.toJson(),
        "CHF": chf?.toJson(),
        "VES": ves?.toJson(),
        "PAB": pab?.toJson(),
        "WST": wst?.toJson(),
        "FOK": fok?.toJson(),
        "THB": thb?.toJson(),
        "BSD": bsd?.toJson(),
        "TOP": top?.toJson(),
        "BIF": bif?.toJson(),
        "BHD": bhd?.toJson(),
        "IMP": imp?.toJson(),
        "HTG": htg?.toJson(),
        "AFN": afn?.toJson(),
        "ILS": ils?.toJson(),
        "LYD": lyd?.toJson(),
        "UYU": uyu?.toJson(),
        "NIO": nio?.toJson(),
        "CKD": ckd?.toJson(),
        "LAK": lak?.toJson(),
        "KID": kid?.toJson(),
        "ANG": ang?.toJson(),
        "JMD": jmd?.toJson(),
        "EGP": egp?.toJson(),
        "CLP": clp?.toJson(),
        "LSL": lsl?.toJson(),
        "GHS": ghs?.toJson(),
        "SCR": scr?.toJson(),
        "AOA": aoa?.toJson(),
        "BMD": bmd?.toJson(),
        "PKR": pkr?.toJson(),
        "SAR": sar?.toJson(),
        "KRW": krw?.toJson(),
        "ETB": etb?.toJson(),
        "BDT": bdt?.toJson(),
        "KMF": kmf?.toJson(),
        "BZD": bzd?.toJson(),
        "UGX": ugx?.toJson(),
        "HUF": huf?.toJson(),
        "ISK": isk?.toJson(),
        "TJS": tjs?.toJson(),
        "NAD": nad?.toJson(),
        "RSD": rsd?.toJson(),
        "MUR": mur?.toJson(),
        "MOP": mop?.toJson(),
        "MVR": mvr?.toJson(),
        "IDR": idr?.toJson(),
        "CDF": cdf?.toJson(),
        "VND": vnd?.toJson(),
        "GNF": gnf?.toJson(),
        "GEL": gel?.toJson(),
        "MWK": mwk?.toJson(),
        "IQD": iqd?.toJson(),
        "JPY": jpy?.toJson(),
        "DOP": dop?.toJson(),
        "QAR": qar?.toJson(),
      };
}

class Aed {
  String name;
  String symbol;

  Aed({
    required this.name,
    required this.symbol,
  });

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Bam {
  String name;

  Bam({
    required this.name,
  });

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Demonyms {
  Eng eng;
  Eng? fra;

  Demonyms({
    required this.eng,
    this.fra,
  });

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  String f;
  String m;

  Eng({
    required this.f,
    required this.m,
  });

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  String png;
  String svg;
  String? alt;

  Flags({
    required this.png,
    required this.svg,
    this.alt,
  });

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({
    this.root,
    this.suffixes,
  });

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Maps {
  String googleMaps;
  String openStreetMaps;

  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  String common;
  String official;
  Map<String, Translation>? nativeName;

  Name({
    required this.common,
    required this.official,
    this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    Map<String, Translation>? parsedNativeName;

    if (json["nativeName"] != null && json["nativeName"] is Map) {
      parsedNativeName = (json["nativeName"] as Map).map((k, v) {
        if (v is Map<String, dynamic>) {
          return MapEntry<String, Translation>(k, Translation.fromJson(v));
        } else {
          throw FormatException(
              "Expected the value of 'nativeName' to be a Map, got ${v.runtimeType}");
        }
      });
    }

    return Name(
      common: json["common"] ?? 'Unknown',
      official: json["official"] ?? 'Unknown',
      nativeName: parsedNativeName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "common": common,
      "official": official,
      "nativeName":
          nativeName?.map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
  }
}

class Translation {
  String official;
  String common;

  Translation({
    required this.official,
    required this.common,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  String format;
  String? regex;

  PostalCode({
    required this.format,
    this.regex,
  });

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { AFRICA, AMERICAS, ANTARCTIC, ASIA, EUROPE, OCEANIA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek { MONDAY, SATURDAY, SUNDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
