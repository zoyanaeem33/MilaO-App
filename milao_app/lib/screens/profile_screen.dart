import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'records_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _userEmail = FirebaseAuth.instance.currentUser?.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFF3F4F6)),
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFF7ED),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              _userEmail.isNotEmpty
                                  ? _userEmail[0].toUpperCase()
                                  : 'U',
                              style: GoogleFonts.nunito(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFFF97316),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF97316),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _userEmail,
                      style: GoogleFonts.nunito(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.verified,
                            size: 16, color: Color(0xFF22C55E)),
                        const SizedBox(width: 4),
                        Text(
                          'Verified',
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            color: const Color(0xFF22C55E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Stats
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF3F4F6)),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    _buildStat('0', 'Lost'),
                    Container(width: 1, height: 50,
                        color: const Color(0xFFF3F4F6)),
                    _buildStat('0', 'Found'),
                    Container(width: 1, height: 50,
                        color: const Color(0xFFF3F4F6)),
                    _buildStat('0', 'Resolved'),
                  ],
                ),
              ),

              // Menu
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ListTile(
                      leading: _menuIcon(Icons.phone_android),
                      title: _menuText('My Lost Items'),
                      trailing: const Icon(Icons.chevron_right,
                          color: Color(0xFFD1D5DB)),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const RecordsScreen())),
                    ),
                    ListTile(
                      leading: _menuIcon(Icons.account_balance_wallet),
                      title: _menuText('My Found Items'),
                      trailing: const Icon(Icons.chevron_right,
                          color: Color(0xFFD1D5DB)),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const RecordsScreen())),
                    ),
                    ListTile(
                      leading: _menuIcon(Icons.chat_bubble_outline),
                      title: _menuText('Chat History'),
                      trailing: const Icon(Icons.chevron_right,
                          color: Color(0xFFD1D5DB)),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen())),
                    ),
                    ListTile(
                      leading: _menuIcon(Icons.shield_outlined),
                      title: _menuText('Verify Identity'),
                      trailing: const Icon(Icons.chevron_right,
                          color: Color(0xFFD1D5DB)),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Coming Soon!'),
                            backgroundColor: Color(0xFFF97316),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: _menuIcon(Icons.settings_outlined),
                      title: _menuText('Settings'),
                      trailing: const Icon(Icons.chevron_right,
                          color: Color(0xFFD1D5DB)),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Coming Soon!'),
                            backgroundColor: Color(0xFFF97316),
                          ),
                        );
                      },
                    ),
                    // Logout
                    ListTile(
                      leading: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.logout,
                            color: Color(0xFFEF4444), size: 18),
                      ),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFEF4444),
                        ),
                      ),
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        if (mounted) {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false,
                          );
                        }
                      },
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

  Widget _menuIcon(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: const Color(0xFFF97316), size: 18),
    );
  }

  Widget _menuText(String text) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1F2937),
      ),
    );
  }

  Widget _buildStat(String number, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Text(number,
                style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFFF97316))),
            Text(label,
                style: GoogleFonts.nunito(
                    fontSize: 11,
                    color: const Color(0xFF9CA3AF),
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}