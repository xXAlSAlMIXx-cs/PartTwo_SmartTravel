import 'package:flutter/material.dart';
import 'package:part1_project/models/user_model.dart';
import 'package:part1_project/pages/loginPage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';

class ProfilePage extends StatefulWidget {
  final UserModel user;

  const ProfilePage({
    super.key,
    required this.user,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late UserModel _user;
  final ImagePicker _picker = ImagePicker();
  Uint8List? _imageBytes;

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _imageBytes = _user.profileImageBytes;
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _imageBytes = bytes;
        _user = UserModel(
          username: _user.username,
          email: _user.email,
          profileImageBytes: bytes,
          location: _user.location,
        );
      });
    }
  }

  Future<void> _setLocation() async {
    final location = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Location'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Enter your location',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) => Navigator.pop(context, value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final textField = context.findRenderObject() as RenderBox;
              final textFieldPosition = textField.localToGlobal(Offset.zero);
              final textFieldSize = textField.size;
              final textFieldCenter = textFieldPosition + Offset(textFieldSize.width / 2, textFieldSize.height / 2);
              Navigator.pop(context, textFieldCenter.toString());
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (location != null) {
      setState(() {
        _user = UserModel(
          username: _user.username,
          email: _user.email,
          profileImageBytes: _user.profileImageBytes,
          location: location,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, _user);
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.orange[900] ?? Colors.deepOrange,
                Colors.orange[600] ?? Colors.orange,
                Colors.orange[300] ?? Colors.orangeAccent
              ],
            ),
          ),
          child: Column(
            children: [
              // Header section with back button
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Profile picture and name
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: _imageBytes != null
                      ? ClipOval(
                          child: Image.memory(
                            _imageBytes!,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.deepOrange,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _user.username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _user.email,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              if (_user.location != null) ...[
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white70,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _user.location!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 30),

              // Main content area with white background
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 40, 30, 30),
                      child: Column(
                        children: [
                          // Profile Settings
                          buildProfileOption(
                            icon: Icons.person_outline,
                            title: "Edit Profile",
                            onTap: () {},
                          ),
                          const Divider(),
                          buildProfileOption(
                            icon: Icons.location_on_outlined,
                            title: "Set Location",
                            onTap: _setLocation,
                          ),
                          const Divider(),
                          buildProfileOption(
                            icon: Icons.notifications_outlined,
                            title: "Notifications",
                            onTap: () {},
                          ),
                          const Divider(),
                          buildProfileOption(
                            icon: Icons.lock_outline,
                            title: "Security",
                            onTap: () {},
                          ),
                          const Divider(),
                          buildProfileOption(
                            icon: Icons.help_outline,
                            title: "Help & Support",
                            onTap: () {},
                          ),
                          const Divider(),
                          buildProfileOption(
                            icon: Icons.info_outline,
                            title: "About",
                            onTap: () {},
                          ),
                          const SizedBox(height: 30),

                          // Logout Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange[700],
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                elevation: 3,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Logout',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.orange[700],
        size: 28,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey[400],
        size: 16,
      ),
      onTap: onTap,
    );
  }
} 