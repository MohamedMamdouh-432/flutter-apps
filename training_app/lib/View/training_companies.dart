import 'package:flutter/material.dart';
import 'package:training_app/Database/db_helper.dart';
import 'package:training_app/models/company.dart';
import 'package:training_app/widgets/company_card.dart';

class TrainingCompanies extends StatefulWidget {
  const TrainingCompanies({super.key});
  @override
  State<TrainingCompanies> createState() => _TrainingCompaniesState();
}

class _TrainingCompaniesState extends State<TrainingCompanies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        title: const Text('Training Companies'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Company>?>(
          future: DatabaseHelper.getAllCompaines(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return const Center(child: CircularProgressIndicator());
            else if (snapshot.hasError)
              return Center(
                  child: Text(
                      'Error Happen within Requesting Companies Data ${snapshot.error}'));
            else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => CompanyCard(
                    curCompany: snapshot.data![index],
                  ),
                );
              }
            }
            return const Center(
                child: Text(
              'No Companies Found ',
              style: TextStyle(fontSize: 22),
            ));
          },
        ),
      ),
    );
  }
}
