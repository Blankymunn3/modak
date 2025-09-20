import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보'),
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
                  const Text(
                    '캠핑러버',
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
                      _buildStatCard('기록', '25'),
                      _buildStatCard('저장한 스팟', '12'),
                      _buildStatCard('팔로워', '8'),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // 메뉴 섹션
            _buildMenuSection('캠핑 관리', [
              _buildMenuItem(Icons.bookmark, '저장한 스팟', () {}),
              _buildMenuItem(Icons.inventory, '내 장비', () {}),
              _buildMenuItem(Icons.checklist, '체크리스트', () {}),
              _buildMenuItem(Icons.analytics, '캠핑 통계', () {}),
            ]),

            _buildMenuSection('커뮤니티', [
              _buildMenuItem(Icons.article, '내가 쓴 글', () {}),
              _buildMenuItem(Icons.comment, '댓글 단 글', () {}),
              _buildMenuItem(Icons.favorite, '좋아요 한 글', () {}),
            ]),

            _buildMenuSection('설정', [
              _buildMenuItem(Icons.notifications, '알림 설정', () {}),
              _buildMenuItem(Icons.privacy_tip, '개인정보 처리방침', () {}),
              _buildMenuItem(Icons.help, '고객센터', () {}),
              _buildMenuItem(Icons.info, '앱 정보', () {}),
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