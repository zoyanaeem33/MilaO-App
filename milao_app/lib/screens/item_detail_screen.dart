import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'chat_screen.dart';

class ItemDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? itemData;
  const ItemDetailScreen({super.key, this.itemData});

  @override
  Widget build(BuildContext context) {
    final data = itemData ?? {};
    final isLost = data['type'] == 'lost';
    final name = data['name'] ?? 'Unknown Item';
    final category = data['category'] ?? 'Unknown';
    final location = data['location'] ?? 'Unknown';
    final date = data['date'] ?? '';
    final description = data['description'] ?? 'No description provided.';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 220,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: isLost
                            ? [const Color(0xFFFFF7ED), const Color(0xFFFED7AA)]
                            : [const Color(0xFFF0FDF4), const Color(0xFFBBF7D0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        _getCategoryIcon(category),
                        size: 80,
                        color: isLost
                            ? const Color(0xFFF97316)
                            : const Color(0xFF22C55E),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.arrow_back, size: 18),
                      ),
                    ),
                  ),
                ],
              ),

              // Item Info
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: isLost
                                ? const Color(0xFFFEF2F2)
                                : const Color(0xFFF0FDF4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            isLost ? 'Lost' : 'Found',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: isLost
                                  ? const Color(0xFFEF4444)
                                  : const Color(0xFF22C55E),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category,
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: const Color(0xFF9CA3AF),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Location
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            size: 16, color: Color(0xFFF97316)),
                        const SizedBox(width: 8),
                        Text(location,
                            style: GoogleFonts.nunito(
                                fontSize: 13, color: const Color(0xFF6B7280))),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Date
                    if (date.isNotEmpty)
                      Row(
                        children: [
                          const Icon(Icons.calendar_today,
                              size: 16, color: Color(0xFFF97316)),
                          const SizedBox(width: 8),
                          Text(date,
                              style: GoogleFonts.nunito(
                                  fontSize: 13,
                                  color: const Color(0xFF6B7280))),
                        ],
                      ),
                    const SizedBox(height: 16),

                    const Divider(color: Color(0xFFF3F4F6)),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      'DESCRIPTION',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF9CA3AF),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: GoogleFonts.nunito(
                        fontSize: 13,
                        color: const Color(0xFF374151),
                        height: 1.7,
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Divider(color: Color(0xFFF3F4F6)),
                    const SizedBox(height: 12),

                    // Posted By
                    Text(
                      'POSTED BY',
                      style: GoogleFonts.nunito(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF9CA3AF),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFF7ED),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.person,
                                color: Color(0xFFF97316)),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Anonymous User',
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF1F2937),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Unverified',
                                  style: GoogleFonts.nunito(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF9CA3AF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Buttons
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(isLost
                                  ? 'Thank you! Owner will be contacted.'
                                  : 'Great! You will be contacted soon.'),
                              backgroundColor: const Color(0xFF22C55E),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF97316),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Text(
                          isLost ? 'I Found This!' : 'This is Mine!',
                          style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChatScreen(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              color: Color(0xFFF97316), width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.chat_bubble_outline,
                                color: Color(0xFFF97316), size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Chat',
                              style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFF97316),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Phone / Gadget': return Icons.phone_android;
      case 'Bag / Wallet': return Icons.work;
      case 'Documents': return Icons.credit_card;
      case 'Keys': return Icons.key;
      case 'Jewelry': return Icons.diamond;
      default: return Icons.inventory_2;
    }
  }
}