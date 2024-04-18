import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0x900B0B).withOpacity(0.8),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [

                CircleAvatar(
                  backgroundImage: AssetImage('lib/images/profile_image.jpg'), // Replace 'path_to_your_image.jpg' with your image path
                  radius: 20, // Adjust the radius as needed
                ),
                SizedBox(width: 15),
                Text('Account Info', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle edit button tap
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0x900B0B).withOpacity(0.8), backgroundColor: Colors.white, // Change text color here
                  ),
                  child: Text('Edit'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(Icons.person, 'Kanika'),
                _buildDivider(),
                _buildInfoRow(Icons.email, 'kbayyy@gmail.com'),
                _buildDivider(),
                _buildInfoRow(Icons.phone, '+91 7736268900'),
                _buildDivider(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            SizedBox(width: 10),
            Text(text, style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.white);
  }
}
