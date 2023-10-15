import 'package:flutter/material.dart';
import 'package:training_app/Database/db_helper.dart';
import 'package:training_app/models/company.dart';

class CompanyCard extends StatelessWidget {
  final Company curCompany;

  const CompanyCard({
    Key? key,
    required this.curCompany,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Card(
        color: Colors.blueGrey,
        elevation: 0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  curCompany.compName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () => DatabaseHelper.deleteCompany(curCompany),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Phone:  ${curCompany.phone}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Specialization:  ${curCompany.spec}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Supervisor:  ${curCompany.supervisor}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Address:  ${curCompany.address}',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Period:  ${curCompany.period} Days',
                  style: const TextStyle(fontSize: 18),
                )),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Capacity:  ${curCompany.capacity} Students',
                  style: const TextStyle(fontSize: 18),
                )),
          ],
        ),
      ),
    );
  }
}
