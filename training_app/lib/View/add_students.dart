import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:training_app/Database/db_helper.dart';
import 'package:training_app/models/student.dart';

class StudentAdder extends StatefulWidget {
  const StudentAdder({
    Key? key,
  }) : super(key: key);

  @override
  State<StudentAdder> createState() => _StudentAdderState();
}

class _StudentAdderState extends State<StudentAdder> {
  bool pickingfinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/shoubra.jpeg'),
              const Text(
                'Select Students file here !',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  onPressed: () async {
                    // picking file
                    PlatformFile pickedFile = await pickCsvFile();
                    if (pickedFile.name == '') return;
                    setState(() => pickingfinished = true);
                    // parsing chosen file
                    Directory appStorage =
                        await getApplicationDocumentsDirectory();
                    File newFile = await File(pickedFile.path!)
                        .copy('${appStorage.path}/${pickedFile.name}');
                    // convert to Lines of Strings
                    List<String> studentList = await newFile.readAsLines();
                    // process each student and add him/her in database
                    for (int i = 1; i < studentList.length; i++) {
                      List<String> data = studentList[i].split(',');
                      DatabaseHelper.addStudent(Student(
                          studId: data[0],
                          studName: data[1],
                          email: data[2],
                          departement: data[3],
                          gpa: data[4],
                          grade: data[5],
                          phone: data[6]));
                    }
                  },
                  icon: const Icon(Icons.attach_file),
                  label: const Text('Choose file')),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: !pickingfinished ? null : distributeStudents,
                icon: const Icon(Icons.groups),
                label: const Text('Distribute Students'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<PlatformFile> pickCsvFile() async {
    var result = await FilePicker.platform.pickFiles();
    if (result == null) return PlatformFile(name: '', size: 0);
    print('success');
    // saving picked file
    return result.files.single;
  }

  void distributeStudents() {
    setState(() => pickingfinished = false);
    
  }
}
