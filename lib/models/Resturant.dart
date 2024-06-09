class Resturant {
  String? name;
  Geo? geo;
  int? priceRange;
  String? currenciesAccepted;
  Address? address;
  AggregateRatings? aggregateRatings;
  MainPhoto? mainPhoto;
  String? mainPhotoSrc;
  bool? hasLoyaltyProgram;
  bool? isBookable;
  bool? isInsider;
  BestOffer? bestOffer;
  String? id;

//Ward Khadour

  Resturant(
      {this.name,
      this.geo,
      this.priceRange,
      this.currenciesAccepted,
      this.address,
      this.aggregateRatings,
      this.mainPhoto,
      this.mainPhotoSrc,
      this.hasLoyaltyProgram,
      this.isBookable,
      this.isInsider,
      this.bestOffer,
      this.id});

  Resturant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    geo = json['geo'] != null ? new Geo.fromJson(json['geo']) : null;
    priceRange = json['priceRange'];
    currenciesAccepted = json['currenciesAccepted'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    aggregateRatings = json['aggregateRatings'] != null
        ? new AggregateRatings.fromJson(json['aggregateRatings'])
        : null;
    mainPhoto = json['mainPhoto'] != null
        ? new MainPhoto.fromJson(json['mainPhoto'])
        : null;
    mainPhotoSrc = json['mainPhotoSrc'];
    hasLoyaltyProgram = json['hasLoyaltyProgram'];
    isBookable = json['isBookable'];
    isInsider = json['isInsider'];
    bestOffer = json['bestOffer'] != null
        ? new BestOffer.fromJson(json['bestOffer'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.geo != null) {
      data['geo'] = this.geo!.toJson();
    }
    data['priceRange'] = this.priceRange;
    data['currenciesAccepted'] = this.currenciesAccepted;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.aggregateRatings != null) {
      data['aggregateRatings'] = this.aggregateRatings!.toJson();
    }
    if (this.mainPhoto != null) {
      // data['mainPhoto'] = this.mainPhoto!.toJson();
    }
    data['mainPhotoSrc'] = this.mainPhotoSrc;
    data['hasLoyaltyProgram'] = this.hasLoyaltyProgram;
    data['isBookable'] = this.isBookable;
    data['isInsider'] = this.isInsider;
    if (this.bestOffer != null) {
      data['bestOffer'] = this.bestOffer!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Geo {
  String? longitude;
  String? latitude;

  Geo({this.longitude, this.latitude});

  Geo.fromJson(Map<String, dynamic> json) {
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    return data;
  }
}

class Address {
  String? street;
  String? postalCode;
  String? locality;
  String? country;

  Address({this.street, this.postalCode, this.locality, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    postalCode = json['postalCode'];
    locality = json['locality'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['postalCode'] = this.postalCode;
    data['locality'] = this.locality;
    data['country'] = this.country;
    return data;
  }
}

class AggregateRatings {
  Thefork? thefork;
  Thefork? tripadvisor;

  AggregateRatings({this.thefork, this.tripadvisor});

  AggregateRatings.fromJson(Map<String, dynamic> json) {
    thefork =
        json['thefork'] != null ? new Thefork.fromJson(json['thefork']) : null;
    tripadvisor = json['tripadvisor'] != null
        ? new Thefork.fromJson(json['tripadvisor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thefork != null) {
      data['thefork'] = this.thefork!.toJson();
    }
    if (this.tripadvisor != null) {
      data['tripadvisor'] = this.tripadvisor!.toJson();
    }
    return data;
  }
}

class Thefork {
  dynamic? ratingValue;
  dynamic? reviewCount;

  Thefork({this.ratingValue, this.reviewCount});

  Thefork.fromJson(Map<String, dynamic> json) {
    ratingValue = json['ratingValue'];
    reviewCount = json['reviewCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ratingValue'] = this.ratingValue;
    data['reviewCount'] = this.reviewCount;
    return data;
  }
}

class MainPhoto {
  List<String>? imgs;

  MainPhoto({
    this.imgs,
  });

  MainPhoto.fromJson(Map<String, dynamic> json) {
    imgs = [
      json['source'],
      json['612x344'],
      json['480x270'],
      json['240x135'],
      json['664x374'],
      json['1350x759'],
      json['160x120'],
      json['80x60'],
      json['92x92'],
      json['184x184']
    ];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['source'] = this.source;
  //   data['612x344'] = this.s612x344;
  //   data['480x270'] = this.s480x270;
  //   data['240x135'] = this.s240x135;
  //   data['664x374'] = this.s664x374;
  //   data['1350x759'] = this.s1350x759;
  //   data['160x120'] = this.s160x120;
  //   data['80x60'] = this.s80x60;
  //   data['92x92'] = this.s92x92;
  //   data['184x184'] = this.s184x184;
  //   return data;
  // }
}

class BestOffer {
  String? id;
  String? name;
  String? label;

  BestOffer({this.id, this.name, this.label});

  BestOffer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['label'] = this.label;
    return data;
  }
}
