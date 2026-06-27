import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _selectedFilters = ['Phone'];

  final List<String> _filters = [
    'Phone', 'Bag', 'Documents', 'Keys',
    'Lahore', 'This Week', 'Lost', 'Found',
  ];

  final List<Map<String, dynamic>> _results = [
    {
      'name': 'Samsung Phone',
      'location': 'Anarkali',
      'time': 'Today',
      'status': 'lost',
      'icon': Icons.phone_android,
      'color': Color(0xFFFFF7ED),
      'iconColor': Color(0xFFF97316),
    },
    {
      'name': 'iPhone 14 Pro',
      'location': 'DHA Phase 5',
      'time': '2 days ago',
      'status': 'found',
      'icon': Icons.phone_iphone,
      'color': Color(0xFFEFF6FF),
      'iconColor': Color(0xFF3B82F6),
    },
    {
      'name': 'Redmi Note 12',
      'location': 'Model Town',
      'time': 'Yesterday',
      'status': 'lost',
      'icon': Icons.smartphone,
      'color': Color(0xFFF0FDF4),
      'iconColor': Color(0xFF22C55E),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  border: Border.all(color: const Color(0xFFF97316)),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Color(0xFFF97316)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          hintStyle: GoogleFonts.nunito(
                            color: const Color(0xFF9CA3AF),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Filter Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'FILTERS',
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF9CA3AF),
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Filter Chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                spacing: 6,
                runSpacing: 6,
                children: _filters.map((filter) {
                  final isSelected = _selectedFilters.contains(filter);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedFilters.remove(filter);
                        } else {
                          _selectedFilters.add(filter);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFF97316)
                            : Colors.white,
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFF97316)
                              : const Color(0xFFE5E7EB),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        filter,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? Colors.white
                              : const Color(0xFF1F2937),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),

            // Results Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${_results.length} RESULTS FOUND',
                style: GoogleFonts.nunito(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF9CA3AF),
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Results List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final item = _results[index];
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
                                  const Icon(Icons.access_time,
                                      size: 12,
                                      color: Color(0xFF9CA3AF)),
                                  const SizedBox(width: 2),
                                  Text(item['time'],
                                      style: GoogleFonts.nunito(
                                          fontSize: 11,
                                          color: const Color(0xFF9CA3AF))),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  color: item['status'] == 'lost'
                                      ? const Color(0xFFFEF2F2)
                                      : const Color(0xFFF0FDF4),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  item['status'] == 'lost'
                                      ? 'Lost'
                                      : 'Found',
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