import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CountryActivities extends StatefulWidget {
  const CountryActivities({super.key});

  @override
  State<CountryActivities> createState() => _CountryActivitiesState();
}

class _CountryActivitiesState extends State<CountryActivities> {
  String? selectedCountry;
  List<String> countries = ['Oman', 'Georgia', 'Turkey', 'Iran'];

  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _confirmSelection() {
    // For now, just show a confirmation dialog
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Confirmation'),
        content: Text('You selected $selectedCountry and uploaded a file.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool get isConfirmedEnabled => selectedCountry != null && _image != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text("Select a country"),
              value: selectedCountry,
              isExpanded: true,
              items: countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Upload Image or Doc.'),
            ),
            const SizedBox(height: 20),
            Center(
              child: _image == null
                  ? const Text('No image or Document selected.')
                  : Image.file(
                _image!,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: isConfirmedEnabled ? _confirmSelection : null,
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
