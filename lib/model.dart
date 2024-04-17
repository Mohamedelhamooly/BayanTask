import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

import 'objectbox.g.dart';

// ignore_for_file: public_member_api_docs

// personID int
// , name unicode string(100)
// , age decimal
// , nationalityID int
// , birthDate datetime

@Entity()
class Person {
  @Id()
  int dbId;
  String? name ;
  double? age ;
  int? nationalityID ;
  String?  birthDate ;

  Person(
      {this.dbId = 0,
      this.name,
      this.age,
      this.nationalityID,
      this.birthDate});

}
