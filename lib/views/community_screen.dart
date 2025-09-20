import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('모닥불'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 퀵액션 버튼들
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline),
                    label: const Text('질문하기'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.rate_review),
                    label: const Text('후기 올리기'),
                  ),
                ),
              ],
            ),
          ),

          // 태그 필터
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildTagChip('전체', true),
                _buildTagChip('노지', false),
                _buildTagChip('차박', false),
                _buildTagChip('장비', false),
                _buildTagChip('요리', false),
                _buildTagChip('팁', false),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // 게시물 목록
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 사용자 정보
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
                                backgroundColor: Colors.grey.shade300,
                                child: Text(
                                  '캠${index + 1}',
                                  style: const TextStyle(fontSize: 10),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '캠핑러버${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${index + 1}시간 전',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // 게시물 내용
                          Text(
                            _getPostTitle(index),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // 태그들
                          Wrap(
                            spacing: 6,
                            children: _getPostTags(index)
                                .map((tag) => Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        tag,
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 12),

                          // 사진 (있는 경우)
                          if (index % 3 == 0)
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Icon(Icons.image, size: 40),
                              ),
                            ),
                          if (index % 3 == 0) const SizedBox(height: 12),

                          // 상호작용 버튼들
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite_border,
                                      size: 18,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${(index + 1) * 3}',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.chat_bubble_outline,
                                      size: 18,
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${index + 2}',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 18,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTagChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (value) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.orange.shade100,
        checkmarkColor: Colors.orange,
        labelStyle: TextStyle(
          fontSize: 12,
          color: isSelected ? Colors.orange : Colors.grey.shade700,
        ),
      ),
    );
  }

  String _getPostTitle(int index) {
    final titles = [
      '지리산 노지 캠핑 후기 🔥 물 수급이 가능한 곳 추천해요!',
      '차박용 매트리스 추천 부탁드려요',
      '설악산 대청봉 백패킹 다녀왔습니다',
      '캠핑 요리 레시피 공유 - 간단한 파스타',
      '텐트 추천해주세요 (2인용, 백패킹용)',
      '겨울 캠핑 준비물 체크리스트',
      '한라산 어리목 야영장 예약 팁',
      '캠핑장 vs 노지 캠핑 장단점',
    ];
    return titles[index % titles.length];
  }

  List<String> _getPostTags(int index) {
    final allTags = [
      ['노지', '지리산', '물공급'],
      ['차박', '장비', '매트리스'],
      ['백패킹', '설악산', '후기'],
      ['요리', '레시피', '팁'],
      ['장비', '텐트', '추천'],
      ['겨울캠핑', '체크리스트', '팁'],
      ['캠핑장', '예약', '한라산'],
      ['노지', '캠핑장', '비교'],
    ];
    return allTags[index % allTags.length];
  }
}