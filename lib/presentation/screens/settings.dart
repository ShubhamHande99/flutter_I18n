import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profileHeader(),
            Divider(color: Colors.grey.shade200),
            _optionsList(),
          ],
        ),
      ),
    );
  }

  Widget _profileHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32.0,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shubham',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Hey there ! I am using whatsapp',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.qr_code,
                  color: Colors.grey,
                ),
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.timelapse,
                  color: Colors.grey,
                ),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _optionsList() {
    return Column(
      children: [
        optionListItem(
          icon: Icons.key_sharp,
          title: 'Account',
          sunTitle: 'Security notifications, change number',
        ),
        optionListItem(
          icon: Icons.lock,
          title: 'Privacy',
          sunTitle: 'Block contacts, disappearing messages',
        ),
        optionListItem(
          icon: Icons.lock,
          title: 'Avatar',
          sunTitle: 'Create, edit, profile photo',
        ),
        optionListItem(
          icon: Icons.chat_sharp,
          title: 'Chats',
          sunTitle: 'Theme, wallpapers, chat history',
        ),
        optionListItem(
          icon: Icons.notification_important,
          title: 'Notifications',
          sunTitle: 'Message, group & call tones',
        ),
        optionListItem(
          icon: Icons.settings_backup_restore_sharp,
          title: 'Storage and data',
          sunTitle: 'Network usage, auto-download',
        ),
        optionListItem(
          icon: Icons.language,
          title: 'App language',
          sunTitle: 'English',
        ),
        optionListItem(
          icon: Icons.help,
          title: 'Help',
          sunTitle: 'Help center, contact us, privacy policy',
        ),
        optionListItem(
          icon: Icons.person_pin_outlined,
          title: 'Invite a friend',
        ),
      ],
    );
  }

  Widget optionListItem({
    required IconData icon,
    required String title,
     String? sunTitle,
  }) {
    return ListTile(
      onTap: (){},
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(title),
      subtitle: sunTitle!=null ?  Text(
        sunTitle,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey,
            ),
      ) : null,
    );
  }
}
