class DashboardResponse {
  User? user;
  double? totalHoursWorked;
  double? earningMonth;
  List<Schedules>? schedules;

  DashboardResponse(
      {this.user, this.totalHoursWorked, this.earningMonth, this.schedules});

  DashboardResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    totalHoursWorked = (json['TotalHoursWorked'] * 1.0);
    earningMonth = (json['earningMonth'] * 1.0);
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(new Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['TotalHoursWorked'] = this.totalHoursWorked;
    data['earningMonth'] = this.earningMonth;
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? phone;
  String? email;
  String? address;
  double? chargePH;
  String? designation;
  bool? logged;
  bool? active;
  int? iV;

  User(
      {this.sId,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.chargePH,
      this.designation,
      this.logged,
      this.active,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    phone = json['Phone'];
    email = json['Email'];
    address = json['Address'];
    chargePH = (json['ChargePH'] * 1.0);
    designation = json['Designation'];
    logged = json['Logged'];
    active = json['Active'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Phone'] = this.phone;
    data['Email'] = this.email;
    data['Address'] = this.address;
    data['ChargePH'] = this.chargePH;
    data['Designation'] = this.designation;
    data['Logged'] = this.logged;
    data['Active'] = this.active;
    data['__v'] = this.iV;
    return data;
  }
}

class Schedules {
  String? sId;
  List<String>? empID;
  String? currDate;
  String? entry;
  String? exit;
  String? location;
  String? description;
  int? iV;

  Schedules(
      {this.sId,
      this.empID,
      this.currDate,
      this.entry,
      this.exit,
      this.location,
      this.description,
      this.iV});

  Schedules.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    empID = json['EmpID'].cast<String>();
    currDate = json['CurrDate'];
    entry = json['Entry'];
    exit = json['Exit'];
    location = json['Location'];
    description = json['Description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['EmpID'] = this.empID;
    data['CurrDate'] = this.currDate;
    data['Entry'] = this.entry;
    data['Exit'] = this.exit;
    data['Location'] = this.location;
    data['Description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}
