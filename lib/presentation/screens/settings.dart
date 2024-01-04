import 'package:flutter/material.dart';
import 'package:flutter_l18n/core/utils/utils.dart';
import 'package:flutter_l18n/main.dart';
import 'package:flutter_l18n/presentation/screens/select_language.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String getLanguageName(String locale) {
    for (Map language in languages) {
      if (language['locale'] == locale) {
        return language['name'];
      }
    }
    return 'en'; // Return default en as fallback value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          AppLocalization.of(context)!.settings,
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
          title: AppLocalization.of(context)!.account,
          sunTitle: AppLocalization.of(context)!.accountSubtitle,
        ),
        optionListItem(
          icon: Icons.lock,
          title: AppLocalization.of(context)!.privacy,
          sunTitle: AppLocalization.of(context)!.privacySubtitle,
        ),
        optionListItem(
          icon: Icons.lock,
          title: AppLocalization.of(context)!.avatar,
          sunTitle: AppLocalization.of(context)!.avatarSubtitle,
        ),
        optionListItem(
          icon: Icons.chat_sharp,
          title: AppLocalization.of(context)!.chats,
          sunTitle: AppLocalization.of(context)!.chatsSubtitle,
        ),
        optionListItem(
          icon: Icons.notification_important,
          title: AppLocalization.of(context)!.notifications,
          sunTitle: AppLocalization.of(context)!.notificationsSubtitle,
        ),
        optionListItem(
          icon: Icons.settings_backup_restore_sharp,
          title: AppLocalization.of(context)!.storageAndData,
          sunTitle: AppLocalization.of(context)!.storageAndDataSubtitle,
        ),
        optionListItem(
          icon: Icons.language,
          title: AppLocalization.of(context)!.appLanguage,
          sunTitle: getLanguageName(languageNotifier.value),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SelectLanguage(),
              ),
            );
          },
        ),
        optionListItem(
          icon: Icons.help,
          title: AppLocalization.of(context)!.help,
          sunTitle: AppLocalization.of(context)!.helpSubtitle,
        ),
        optionListItem(
          icon: Icons.person_pin_outlined,
          title: AppLocalization.of(context)!.inviteAFriend,
        ),
      ],
    );
  }

  Widget optionListItem({
    required IconData icon,
    required String title,
    String? sunTitle,
    void Function()? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(title),
      subtitle: sunTitle != null
          ? Text(
              sunTitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            )
          : null,
    );
  }
}
