
class CarOwners {
  String id;
  String firstName;
  String lastName;
  String email;
  String country;
  String carModel;
  int carModelYear;
  String carColor;
  String gender;
  String jobTitle;
  String bio;


  CarOwners({
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.country,
      this.carModel,
      this.carModelYear,
      this.carColor,
      this.gender,
      this.jobTitle,
      this.bio});

  factory CarOwners.fromList(List json) {
    return CarOwners(
      id: json[0],
      firstName: json[1],
      lastName: json[2],
      email: json[3],
      country: json[4],
      carModel: json[5],
      carModelYear: int.parse(json[6]),
      carColor: json[7],
      gender: json[8],
      jobTitle: json[9],
      bio: json[10],
    );
  }

  @override
  String toString() {
    return 'CarOwners{$id $firstName $lastName $email $country $carModel $carModelYear $carColor $gender $jobTitle $bio}';
  }
}
