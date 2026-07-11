import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> _selectedFilters = [];
  String _searchText = '';

  final List<String> _filters = [
    'Phone', 'Bag', 'Documents', 'Keys',
    'Lahore', 'This Week', 'Lost', 'Found',
  ];

  final List<Map<String, dynamic>> _allItems = [
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
    {
      'name': 'Black Bag',
      'location': 'Gulberg Metro',
      'time': 'Yesterday',
      'status': 'lost',
      'icon': Icons.work,
      'color': Color(0xFFEFF6FF),
      'iconColor': Color(0xFF3B82F6),
    },
    {
      'name': 'Brown Wallet',
      'location': 'Emporium Mall',
      'time': 'Today',
      'status': 'found',
      'icon': Icons.account_balance_wallet,
      'color': Color(0xFFF0FDF4),
      'iconColor': Color(0xFF22C55E),
    },
    {
      'name': 'CNIC Card',
      'location': 'Lahore',
      'time': '3 days ago',
      'status': 'lost',
      'icon': Icons.credit_card,
      'color': Color(0xFFF0FDF4),
      'iconColor': Color(0xFF22C55E),
    },
    {
      'name': 'House Keys',
      'location': 'Johar Town',
      'time': 'Today',
      'status': 'found',
      'icon': Icons.key,
      'color': Color(0xFFF5F3FF),
      'iconColor': Color(0xFF8B5CF6),
    },
  ];

  List<Map<String, dynamic>> get _filteredItems {
    return _allItems.where((item) {
      // Search text filter
      final matchesSearch = _searchText.isEmpty ||
          item['name'].toString().toLowerCase().contains(_searchText.toLowerCase()) ||
          item['location'].toString().toLowerCase().contains(_searchText.toLowerCase());

      // Category/status filter chips
      bool matchesFilter = true;
      if (_selectedFilters.isNotEmpty) {
        matchesFilter = _selectedFilters.any((filter) {
          if (filter == 'Lost') return item['status'] == 'lost';
          if (filter == 'Found') return item['status'] == 'found';
          if (filter == 'Lahore') return item['location'].toString().contains('Lahore') || item['location'].toString().contains('Anarkali') || item['location'].toString().contains('DHA') || item['location'].toString().contains('Gulberg') || item['location'].toString().contains('Johar') || item['location'].toString().contains('Model') || item['location'].toString().contains('Liberty') || item['location'].toString().contains('Emporium');
          if (filter == 'Phone') return item['name'].toString().toLowerCase().contains('phone') || item['name'].toString().toLowerCase().contains('iphone') || item['name'].toString().toLowerCase().contains('redmi') || item['name'].toString().toLowerCase().contains('samsung');
          if (filter == 'Bag') return item['name'].toString().toLowerCase().contains('bag') || item['name'].toString().toLowerCase().contains('wallet');
          if (filter == 'Documents') return item['name'].toString().toLowerCase().contains('cnic') || item['name'].toString().toLowerCase().contains('document');
          if (filter == 'Keys') return item['name'].toString().toLowerCase().contains('key');
          return true;
        });
      }

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final results = _filteredItems;

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
                        onChanged: (value) {
                          setState(() => _searchText = value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search items...',
                          hintStyle: GoogleFonts.nunito(
                            color: const Color(0xFF9CA3AF),
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    if (_searchText.isNotEmpty)
                      GestureDetector(
                        onTap: () => setState(() => _searchText = ''),
                        child: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                      ),
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
                        horizontal: 14, vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFF97316) : Colors.white,
                        border: Border.all(
                          color: isSelected ? const Color(0xFFF97316) : const Color(0xFFE5E7EB),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        filter,
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : const Color(0xFF1F2937),
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
                '${results.length} RESULTS FOUND',
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
              child: results.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_off,
                              size: 48, color: Color(0xFFD1D5DB)),
                          const SizedBox(height: 12),
                          Text(
                            'No items found',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final item = results[index];
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
                                child: Icon(item['icon'],
                                    color: item['iconColor'], size: 28),
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
                                            size: 12, color: Color(0xFF9CA3AF)),
                                        const SizedBox(width: 2),
                                        Text(item['location'],
                                            style: GoogleFonts.nunito(
                                                fontSize: 11,
                                                color: const Color(0xFF9CA3AF))),
                                        const SizedBox(width: 8),
                                        const Icon(Icons.access_time,
                                            size: 12, color: Color(0xFF9CA3AF)),
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
                                        item['status'] == 'lost' ? 'Lost' : 'Found',
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