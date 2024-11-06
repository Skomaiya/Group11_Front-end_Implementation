import 'package:flutter/material.dart';
import 'package:sustanify/pages/profile.dart';

class Calendar extends StatefulWidget {
  @override
  _Calendar createState() => _Calendar();
}

class _Calendar extends State<Calendar> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          backgroundColor: Color(0xFF146BB6),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Profile section aligned to the left
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.person, size: 25, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Profile',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              // Sunny icon aligned to the right
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.sunny, color: Colors.white),
              ),
            ],
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(50, 70, 50, 5),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                // Handle search logic
              },
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              for (int i = 0; i < 4; i++) ExpandableCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
        height: isExpanded ? 450 : 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "JOHN DOE MASTERCLASS ON RENEWABLE ENERGY",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              isExpanded
                  ? "Today 10:00 am - 2:00 pm\n\n"
                      "_________________________________\n\n"
                      "National Museum of Climate Emphasis\n\n"
                      "_________________________________\n\n"
                      "Vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Nulla facilisi cras fermentum odio eu feugiat pretium nibh."
                  : "10:00 am - 2:00 pm",
              style: TextStyle(
                color: Colors.white,
                fontSize: isExpanded ? 16 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
