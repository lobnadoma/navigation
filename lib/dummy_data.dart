import 'package:navigine_sdk/navigine_sdk.dart';

int LOCATION_ID = 943; // Put here your location id
int SUBLOCATION_ID = 1247; // Put here your sublocation id

String dummyVenuePhone = '0128374873';
String dummyVenueDesc = 'This is a test description';
String dummyVenueAlias = 'This is a test alias';

List<Venue> dummyVenues = [
  Venue(
      point: Point(x: 5.0, y: 10.0),
      locationId: LOCATION_ID,
      sublocationId: SUBLOCATION_ID,
      id: 1,
      name: 'Toilet',
      phone: dummyVenuePhone,
      description: dummyVenueDesc,
      alias: dummyVenueAlias,
      categoryId: 1),
  Venue(
      point: Point(x: 50.0, y: 50.0),
      locationId: LOCATION_ID,
      sublocationId: SUBLOCATION_ID,
      id: 2,
      name: 'Kitchen',
      phone: dummyVenuePhone,
      description: dummyVenueDesc,
      alias: dummyVenueAlias,
      categoryId: 2),
  Venue(
      point: Point(x: 60.0, y: 80.0),
      locationId: LOCATION_ID,
      sublocationId: SUBLOCATION_ID,
      id: 3,
      name: 'Meeting room',
      phone: dummyVenuePhone,
      description: dummyVenueDesc,
      alias: dummyVenueAlias,
      categoryId: 3),
];


