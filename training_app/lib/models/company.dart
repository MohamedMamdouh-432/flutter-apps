class Company {
  final String compId,
      compName,
      address,
      email,
      capacity,
      period,
      supervisor,
      spec,
      phone;

  Company(
      {required this.compId,
      required this.compName,
      required this.address,
      required this.email,
      required this.capacity,
      required this.period,
      required this.supervisor,
      required this.spec,
      required this.phone,
    }
  );

  factory Company.fromJson(Map<String, dynamic> jsonData) => Company(
        compId: jsonData['comp_id'].toString(),
        compName: jsonData['comp_name'].toString(),
        address: jsonData['address'].toString(),
        email: jsonData['e_mail'].toString(),
        capacity: jsonData['capacity'].toString(),
        period: jsonData['training_period'].toString(),
        supervisor: jsonData['supervisor'].toString(),
        spec: jsonData['Specialization'].toString(),
        phone: jsonData['telephone'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'comp_id': compId,
        'comp_name': compName,
        'address': address,
        'e_mail': email,
        'capacity': capacity,
        'training_period': period,
        'supervisor': supervisor,
        'Specialization': spec,
        'telephone': phone,
      };
}
