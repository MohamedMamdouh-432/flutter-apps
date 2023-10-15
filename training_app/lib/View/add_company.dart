import 'package:flutter/material.dart';
import 'package:training_app/Database/db_helper.dart';
import 'package:training_app/widgets/textformfield_widget.dart';

class CompanyAdder extends StatefulWidget {
  const CompanyAdder({super.key});

  @override
  State<CompanyAdder> createState() => _CompanyAdderState();
}

class _CompanyAdderState extends State<CompanyAdder> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var capacityController = TextEditingController();
  var periodController = TextEditingController();
  var supervisorController = TextEditingController();
  var dapartController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Organization',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Enter the Organization Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: nameController,
                  title: "Company Name",
                  icon: const Icon(Icons.edit)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: emailController,
                  title: "Company Email",
                  icon: const Icon(Icons.email)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: phoneController,
                  title: "Company Phone",
                  icon: const Icon(Icons.phone)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: dapartController,
                  title: "Company Department",
                  icon: const Icon(Icons.local_fire_department)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: addressController,
                  title: "Company Address",
                  icon: const Icon(Icons.location_city_sharp)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: capacityController,
                  title: "Company Capacity",
                  icon: const Icon(Icons.reduce_capacity_outlined)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: periodController,
                  title: "Company Period",
                  icon: const Icon(Icons.timelapse)),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  controller: supervisorController,
                  title: "Company Supervisor",
                  icon: const Icon(Icons.supervisor_account_outlined)),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () async {
                  formKey.currentState!.validate();
                  if (!(emailController.text.contains('@') &&
                      emailController.text.length > 10)) return;
                  await DatabaseHelper.addCompany([
                    nameController.text,
                    dapartController.text,
                    emailController.text,
                    capacityController.text,
                    periodController.text,
                    phoneController.text,
                    supervisorController.text,
                    addressController.text
                  ]);
                  Navigator.pop(context);
                },
                child: Container(
                  width: 280,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Text('Add Organization', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
