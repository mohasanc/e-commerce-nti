import 'package:flutter/material.dart';
import 'package:products/Core/Shared/custom_text_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _firstNameController = TextEditingController(text: 'Mohamed');
  final _lastNameController = TextEditingController(text: 'Hassan');
  final _usernameController = TextEditingController(text: 'mohassanc');
  final _emailController = TextEditingController(text: 'itsmohassan@gmail.com');
  final _phoneController = TextEditingController(text: '+201009961956');
  String? _gender;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        leading: BackButton(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 8),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: const Color(0XFF4E0189),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            CustomTextField(
              labelText: 'First Name',
              hintText: 'Enter first name',
              controller: _firstNameController,
            ),
            CustomTextField(
              labelText: 'Last Name',
              hintText: 'Enter last name',
              controller: _lastNameController,
            ),
            CustomTextField(
              labelText: 'Username',
              hintText: 'Enter username',
              controller: _usernameController,
            ),
            CustomTextField(
              labelText: 'Email',
              hintText: 'Enter email',
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              labelText: 'Phone',
              hintText: 'Enter phone',
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),

            Text(
              'Gender',
              style: TextStyle(
                color: Color(0XFF4E0189),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              initialValue: _gender,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],
              onChanged: (v) => setState(() => _gender = v),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile saved')),
                  );
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF4E0189),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Center(
              child: TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Change password not implemented yet')));
                },
                icon: const Icon(Icons.lock, color: Color(0XFF4E0189)),
                label: const Text(
                  'Change Password',
                  style: TextStyle(
                    color: Color(0XFF4E0189),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
