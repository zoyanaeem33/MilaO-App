import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _lostItems = [
    {
      'name': 'Samsung Phone',
      'location': 'Anarkali Bazaar',
      'time': '2 ghante pehle',
      'status': 'lost',
      'icon': Icons.phone_android,
      'color': Color(0xFFFFF7ED),
      'iconColor': Color(0xFFF97316),
    },
    {
      'name': 'Kala Bag',
      'location': 'Gulberg Metro',
      'time': 'Kal',
      'status': 'lost',
      'icon': Icons.work,
      'color': Color(0xFFEFF6FF),
      'iconColor': Color(0xFF3B82F6),
    },
    {
      'name': 'CNIC Card',
      'location': 'Defence, Lahore',
      'time': '3 din pehle',
      'status': 'lost',
      'icon': Icons.credit_card,
      'color': Color(0xFFF0FDF4),
      'iconColor': Color(0xFF22C55E),
    },
    {
      'name': 'Ghar ki Chabi',
      'location': 'Johar Town',
      'time': 'Aaj',
      'status': 'found',
      'icon': Icons.key,
      'color': Color(0xFFF5F3FF),
      'iconColor': Color(0xFF8B5CF6),
    },
  ];

  final List<Map<String, dynamic>> _foundItems = [
    {
      'name': 'Brown Wallet',
      'location': 'Emporium Mall',
      'time': '1 ghanta pehle',
      'status': 'found',
      'icon': Icons.account_balance_wallet,
      'color': Color(0xFFF0FDF4),
      'iconColor': Color(0xFF22C55E),
    },
    {
      'name': 'Chashma',
      'location': 'Packages Mall',
      'time': 'Kal',
      'status': 'found',
      'icon': Icons.remove_red_eye,
      'color': Color(0xFFFFF7ED),
      'iconColor': Color(0xFFF97316),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final items = _selectedTab == 0 ? _lostItems : _foundItems;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Text(
                    'MilaO',
                    style: GoogleFonts.nunito(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFFF97316),
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color(0xFFFFF7ED),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFFF97316),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Color(0xFF9CA3AF)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Koi cheez dhoondho...',
                                hintStyle: GoogleFonts.nunito(
                                  color: const Color(0xFF9CA3AF),
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF97316),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedTab == 0
                              ? const Color(0xFFFFF7ED)
                              : Colors.white,
                          border: Border.all(
                            color: _selectedTab == 0
                                ? const Color(0xFFF97316)
                                : const Color(0xFFE5E7EB),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Gum Hui Cheezain',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: _selectedTab == 0
                                  ? const Color(0xFFF97316)
                                  : const Color(0xFF6B7280),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _selectedTab == 1
                              ? const Color(0xFFFFF7ED)
                              : Colors.white,
                          border: Border.all(
                            color: _selectedTab == 1
                                ? const Color(0xFFF97316)
                                : const Color(0xFFE5E7EB),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            'Mili Hui Cheezain',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 13,
                              color: _selectedTab == 1
                                  ? const Color(0xFFF97316)
                                  : const Color(0xFF6B7280),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // Items List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFF3F4F6)),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Icon
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: item['color'],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            item['icon'],
                            color: item['iconColor'],
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1F2937),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    item['location'],
                                    style: GoogleFonts.nunito(
                                      fontSize: 11,
                                      color: const Color(0xFF9CA3AF),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.access_time,
                                    size: 12,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    item['time'],
                                    style: GoogleFonts.nunito(
                                      fontSize: 11,
                                      color: const Color(0xFF9CA3AF),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: item['status'] == 'lost'
                                      ? const Color(0xFFFEF2F2)
                                      : const Color(0xFFF0FDF4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  item['status'] == 'lost' ? 'Gum' : 'Mila',
                                  style: GoogleFonts.nunito(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: item['status'] == 'lost'
                                        ? const Color(0xFFEF4444)
                                        : const Color(0xFF22C55E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}