import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade300,
                            Colors.brown.shade400,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              "assets/images/image1.jpg",
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      buildLabel("First Name"),
                      buildInput("Enter your first name"),

                      SizedBox(height: 12),
                      buildLabel("Last Name"),
                      buildInput("Enter your last name"),

                      SizedBox(height: 12),
                      buildLabel("Username"),
                      buildInput("Enter username"),

                      SizedBox(height: 12),
                      buildLabel("Email"),
                      buildInput("Enter email"),

                      SizedBox(height: 12),
                      buildLabel("Phone Number"),
                      buildInput("Enter phone number"),

                      SizedBox(height: 12),
                      buildLabel("Birth"),
                      buildInput("Select birth date"),

                      SizedBox(height: 12),
                      buildLabel("Gender"),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(value: "Male", child: Text("Male")),
                          DropdownMenuItem(
                            value: "Female",
                            child: Text("Female"),
                          ),
                          DropdownMenuItem(
                            value: "Other",
                            child: Text("Other"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.blue.shade700,
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.lock, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.grey.shade700,
      ),
    );
  }

  Widget buildInput(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
