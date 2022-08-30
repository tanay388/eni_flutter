class DashboardResponse {
  DashboardResponse({
    required this.user,
    required this.TotalHoursWorked,
    required this.earningMonth,
    required this.schedules,
  });
  late final User user;
  late final double TotalHoursWorked;
  late final double earningMonth;
  late final List<Schedules> schedules;

  DashboardResponse.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    TotalHoursWorked = json['TotalHoursWorked'];
    earningMonth = json['earningMonth'];
    schedules = List.from(json['schedules']).map((e)=>Schedules.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['TotalHoursWorked'] = TotalHoursWorked;
    _data['earningMonth'] = earningMonth;
    _data['schedules'] = schedules.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class User {
  User({
    required this.Name,
    required this.Phone,
    required this.Email,
    required this.Address,
    required this.ChargePH,
    required this.Designation,
    required this.Logged,
    required this.Active,
  });

  late final String Name;
  late final String Phone;
  late final String Email;
  late final String Address;
  late final int ChargePH;
  late final String Designation;
  late final bool Logged;
  late final bool Active;

  User.fromJson(Map<String, dynamic> json){
    Name = json['Name'];
    Phone = json['Phone'];
    Email = json['Email'];
    Address = json['Address'];
    ChargePH = json['ChargePH'];
    Designation = json['Designation'];
    Logged = json['Logged'];
    Active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Name'] = Name;
    _data['Phone'] = Phone;
    _data['Email'] = Email;
    _data['Address'] = Address;
    _data['ChargePH'] = ChargePH;
    _data['Designation'] = Designation;
    _data['Logged'] = Logged;
    _data['Active'] = Active;

    return _data;
  }
}

class Schedules {
  Schedules({
    required this.EmpID,
    required this.CurrDate,
    required this.Entry,
    required this.Exit,
    required this.Location,
    required this.Description,
  });

  late final String EmpID;
  late final String CurrDate;
  late final String Entry;
  late final String Exit;
  late final String Location;
  late final String Description;


  Schedules.fromJson(Map<String, dynamic> json){
    EmpID = json['EmpID'];
    CurrDate = json['CurrDate'];
    Entry = json['Entry'];
    Exit = json['Exit'];
    Location = json['Location'];
    Description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['EmpID'] = EmpID;
    _data['CurrDate'] = CurrDate;
    _data['Entry'] = Entry;
    _data['Exit'] = Exit;
    _data['Location'] = Location;
    _data['Description'] = Description;
    return _data;
  }
}