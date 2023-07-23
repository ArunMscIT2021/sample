import 'package:flutter/material.dart';
import 'company_data.dart';
import 'company_from.dart';

class Company extends StatefulWidget {
  const Company({Key? key}) : super(key: key);

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  List<Map<String, dynamic>> company = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshCompany();
  }

  void _refreshCompany() async {
    company = await CompanyData.getItems();
    setState(() {
      _isLoading = false;
    });
  }

  void _deleteItem(int id) async {
    await CompanyData.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Successfully deleted a comp!'),
      ),
    );
    _refreshCompany();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company'),
      ),
      body: _isLoading
          ? const Center(
        child: Text("No company ad"),
      )
          : ListView.builder(
        itemCount: company.length,
        itemBuilder: (context, index) {
          final comp = company[index];

          return Card(
            color: Colors.orange[200],
            margin: const EdgeInsets.all(15),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comp['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    comp['description'],
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Address: ${comp['address']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Job Type: ${comp['jobType']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Company Profile: ${comp['companyProfile']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Time: ${comp['createdAt']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _showForm(comp['id']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteItem(comp['id']),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showForm(null),
      ),
    );
  }

  void _showForm(int? id) {
    final isUpdating = id != null;
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController jobTypeController = TextEditingController();
    final TextEditingController profileController = TextEditingController();
    final TextEditingController requirementsController = TextEditingController();
    final TextEditingController contactNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();

    if (isUpdating) {
      final existingCompany =
      company.firstWhere((element) => element['id'] == id);
      titleController.text = existingCompany['title'];
      descriptionController.text = existingCompany['description'];
      addressController.text = existingCompany['address'];
      jobTypeController.text = existingCompany['jobType'];
      profileController.text = existingCompany['companyProfile'];
      requirementsController.text = existingCompany['requirements'];
      contactNameController.text = existingCompany['contactName'];
      emailController.text = existingCompany['email'];
      mobileController.text = existingCompany['mobile'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      builder: (_) => CompanyForm(
        comp: {
          'id': id,
          'title': titleController.text,
          'description': descriptionController.text,
          'address': addressController.text,
          'jobType': jobTypeController.text,
          'companyProfile': profileController.text,
          'requirements': requirementsController.text,
          'contactName': contactNameController.text,
          'email': emailController.text,
          'mobile': mobileController.text,
        },
        onSubmit: (comp) async {
          if (isUpdating) {
            await CompanyData.updateItem(
              comp['id'],
              comp['title'],
              comp['description'],
              comp['address'],
              comp['jobType'],
              comp['companyProfile'],
              comp['requirements'],
              comp['contactName'],
              comp['email'],
              comp['mobile'],
            );
          } else {
            await CompanyData.createItem(
              comp['title'],
              comp['description'],
              comp['address'],
              comp['jobType'],
              comp['companyProfile'],
              comp['requirements'],
              comp['contactName'],
              comp['email'],
              comp['mobile'],
            );
          }

          Navigator.of(context).pop();
          _refreshCompany();
        },
      ),
    );
  }
}
