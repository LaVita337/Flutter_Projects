import 'package:TikTok/features/inbox/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onDmPreseed() {}

  void _onActivityTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ActivityScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("inbox"),
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.paperPlane),
            onPressed: _onDmPreseed,
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => _onActivityTap(context),
            title: const Text(
              "Activity",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: Container(
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            title: const Text(
              "New followers",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("0 new notifications",
                style: TextStyle(fontSize: 12)),
            trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16),
          ),
        ],
      ),
    );
  }
}
