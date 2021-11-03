class AddressInfo{
  late String street1,street2,state,city,country,map;
  AddressInfo({
    required this.street1,required this.street2,required this.state,required this.city,required this.country,required this.map
  });
  factory AddressInfo.fromMap(Map<dynamic,dynamic>map){
    return new AddressInfo( street1: map['Street1'] as String, street2: map['Street2'] as String, state: map['state'] as String, city: map['city'] as String, country: map['country'] as String,map: map['map'] );
  }
  dynamic toMap(){
    return {
      'Street1' : this.street1,
      'Street2' : this.street2,
      'state' : this.state,
      'city' : this.city,
      'country' : this.country,
      'map' :this.map
    };
  }
}