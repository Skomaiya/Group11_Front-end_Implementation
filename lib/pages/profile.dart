import 'package:flutter/material.dart';
import 'package:sustanify/main.dart'; // Import to access global dark mode setting

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MyApp.isDarkMode, // Listen to the global dark mode setting
      builder: (context, isDark, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: isDark ? Colors.black : Color(0xFF146BB6),
            title: Text('Profile Page'),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: ProfileScreen(isDark: isDark),
        );
      },
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final bool isDark;
  ProfileScreen({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Profile Picture
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://via.placeholder.com/150', // Replace with your profile image URL
            ),
          ),
          SizedBox(height: 20),

          // Name Change Section
          ListTile(
            title: Text(
              'Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              'John Doe', // Replace with dynamic name variable
              style: TextStyle(color: isDark ? Colors.grey[300] : Colors.blue),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: isDark ? Colors.white : Colors.black),
              onPressed: () {
                // Logic for editing name
              },
            ),
          ),
          Divider(color: isDark ? Colors.grey : Colors.black),

          // Email Change Section
          ListTile(
            title: Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              'john.doe@example.com', // Replace with dynamic email variable
              style: TextStyle(color: isDark ? Colors.grey[300] : Colors.blue),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: isDark ? Colors.white : Colors.black),
              onPressed: () {
                // Logic for editing email
              },
            ),
          ),
          Divider(color: isDark ? Colors.grey : Colors.black),

          // Password Change Section
          ListTile(
            title: Text(
              'Password',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            subtitle: Text(
              '•••••••••', // Placeholder for password
              style: TextStyle(color: isDark ? Colors.grey[300] : Colors.blue),
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit, color: isDark ? Colors.white : Colors.black),
              onPressed: () {
                // Logic for changing password
              },
            ),
          ),
          Divider(color: isDark ? Colors.grey : Colors.black),
        ],
      ),
    );
  }
}
