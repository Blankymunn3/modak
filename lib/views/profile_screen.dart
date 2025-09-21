import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 프로필 섹션
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.campingLover,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '캠핑 경력 2년 · 총 25회 캠핑',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard(l10n.records, '25'),
                      _buildStatCard(l10n.savedSpots, '12'),
                      _buildStatCard(l10n.followers, '8'),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // 메뉴 섹션
            _buildMenuSection(l10n.campingManagement, [
              _buildMenuItem(Icons.bookmark, l10n.savedSpots, () {}),
              _buildMenuItem(Icons.inventory, l10n.myEquipment, () {}),
              _buildMenuItem(Icons.checklist, l10n.checklist, () {}),
              _buildMenuItem(Icons.analytics, l10n.campingStats, () {}),
            ]),

            _buildMenuSection(l10n.community, [
              _buildMenuItem(Icons.article, l10n.myWritings, () {}),
              _buildMenuItem(Icons.comment, l10n.commentedPosts, () {}),
              _buildMenuItem(Icons.favorite, l10n.likedPosts, () {}),
            ]),

            _buildMenuSection(l10n.settings, [
              _buildMenuItem(Icons.notifications, l10n.notifications, () {}),
              _buildMenuItem(Icons.privacy_tip, l10n.privacyPolicy, () {}),
              _buildMenuItem(Icons.help, l10n.customerService, () {}),
              _buildMenuItem(Icons.info, l10n.appInfo, () {}),
            ]),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        ...items,
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey.shade600,
      ),
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey.shade400,
      ),
      onTap: onTap,
    );
  }
}