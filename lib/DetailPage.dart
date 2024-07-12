import 'package:flutter/material.dart';
import 'student.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Student data;

  DetailPage({required this.data});

  Future<void> _launchURL(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add navigation to settings or relevant action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              Center(
                child: Hero(
                  tag: data.studentid,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(data.image),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  data.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('ID Student:', style: TextStyle(fontSize: 16, color: Colors.green)),
                  subtitle: Text(data.studentid, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Email:', style: TextStyle(fontSize: 16, color: Colors.green)),
                  subtitle: Text(data.email, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Data:', style: TextStyle(fontSize: 16, color: Colors.green)),
                  subtitle: Text(data.data, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('SocialLink:', style: TextStyle(fontSize: 16, color: Colors.green)),
                  subtitle: InkWell(
                    child: Text(
                      data.SocialLink,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue, decoration: TextDecoration.underline),
                    ),
                    onTap: () => _launchURL(data.SocialLink),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Log out', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
