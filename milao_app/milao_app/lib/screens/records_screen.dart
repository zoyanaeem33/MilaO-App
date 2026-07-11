import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  int _selectedTab = 0;

  final List<Map<String, dynamic>> _foundItems = [
    {
      'name': 'Brown Wallet',
      'location': 'Emporium Mall',
      'date': '20 Jun',
      'status': 'open',
      'icon': Icons.account_balance_wallet,
      'color': Color(0xFFF0FDF4),
      'iconColor': Color(0xFF22C55E),
    },
    {
      'name': 'Glasses',
      'location': 'Packages Mall',
      'date': '18 Jun',
      'status': 'resolved',
      'icon': Icons.remove_red_eye,
      'color': Color(0xFFFFF7ED),
      'iconColor': Color(0xFFF97316),
    },
    {
      'name': 'CNIC',
      'location': 'Liberty Market',
      'date': '15 Jun',
      'status': 'open',
      'icon': Icons.credit_card,
      'color': Color(0xFFEFF6FF),
      'iconColor': Color(0xFF3B82F6),
    },
  ];

  final List<Map<String, dynamic>> _lostItems = [
    {
      'name': 'Samsung Phone',
      'location': 'Anarkali',
      'date': '24 Jun',
      'status': 'still_lost',
      'icon': Icons.phone_android,
      'color': Color(0xFFFFF7ED),
      'iconColor': Color(0xFFF97316),
    },
    {
      'name': 'Black Bag',
      'location': 'Gulberg Metro',
      'date': '23 Jun',
      'status': 'found',
      'icon': Icons.work,
      'color': Color(0xFFEFF6FF),
      'iconColor': Color(0xFF3B82F6),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Text(
                _selectedTab == 0
                    ? 'Items I Found'
                    : 'Items I Lost',
                style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1F2937),
                ),
              ),
            ),
            const SizedBox(height: 12),

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
                            'Found Items',
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
                            'Lost Items',
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

            // List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _selectedTab == 0
                    ? _foundItems.length
                    : _lostItems.length,
                itemBuilder: (context, index) {
                  final item = _selectedTab == 0
                      ? _foundItems[index]
                      : _lostItems[index];
                  final isResolved = item['status'] == 'resolved' ||
                      item['status'] == 'found';

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
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: item['color'],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            item['icon'],
                            color: item['iconColor'],
                            size: 24,
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
                                  const Icon(Icons.location_on,
                                      size: 12,
                                      color: Color(0xFF9CA3AF)),
                                  const SizedBox(width: 2),
                                  Text(item['location'],
                                      style: GoogleFonts.nunito(
                                          fontSize: 11,
                                          color: const Color(0xFF9CA3AF))),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.calendar_today,
                                      size: 12,
                                      color: Color(0xFF9CA3AF)),
                                  const SizedBox(width: 2),
                                  Text(item['date'],
                                      style: GoogleFonts.nunito(
                                          fontSize: 11,
                                          color: const Color(0xFF9CA3AF))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Status Badge
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: isResolved
                                          ? const Color(0xFFF0FDF4)
                                          : const Color(0xFFFFF7ED),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      isResolved
                                          ? (_selectedTab == 0
                                              ? 'Returned to Owner'
                                              : 'Found!')
                                          : (_selectedTab == 0
                                              ? 'Open'
                                              : 'Still Lost'),
                                      style: GoogleFonts.nunito(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                        color: isResolved
                                            ? const Color(0xFF22C55E)
                                            : const Color(0xFFF97316),
                                      ),
                                    ),
                                  ),
                                  // Button
                                  if (!isResolved)
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF97316),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          _selectedTab == 0
                                              ? 'Mark Resolved'
                                              : 'Mark Recovered',
                                          style: GoogleFonts.nunito(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
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