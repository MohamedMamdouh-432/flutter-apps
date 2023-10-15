class Student {
  final String studId, 
    compId, 
    studName, 
    email, 
    departement, 
    gpa, 
    grade, 
    phone;
  
  const Student({
    this.compId = '',
    required this.studId,
    required this.studName,
    required this.email,
    required this.departement,
    required this.gpa,
    required this.grade,
    required this.phone,
  });

  factory Student.fromJson(Map<String, dynamic> jsonData) => Student(
    compId: jsonData['comp_id'].toString(),
    studId: jsonData['stud_id'].toString(), 
    studName: jsonData['stud_name'].toString(), 
    email: jsonData['e_mail'].toString(), 
    departement: jsonData['department'].toString(), 
    gpa: jsonData['gpa'].toString(), 
    grade: jsonData['grade'].toString(), 
    phone: jsonData['telephone'].toString(), 
  );

  Map<String, dynamic> toJson() => {
      'stud_id': studId, 
      'stud_name': studName, 
      'comp_id': compId,
      'e_mail': email, 
      'department': departement, 
      'gpa': gpa, 
      'grade': grade, 
      'telephone': phone
  };
}
