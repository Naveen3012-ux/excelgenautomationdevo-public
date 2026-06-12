import 'package:flutter/material.dart';

import '../dashboard/admin_dashboard.dart';
import '../dashboard/billing_dashboard.dart';
import '../dashboard/dispatcher_dashboard.dart';
import '../dashboard/management_dashboard.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF7F9FF),
              Color(0xFFEEF2FF),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isCompact = constraints.maxWidth < 420;

              return Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isCompact ? 18 : 28),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 460),
                    child: Container(
                      padding: EdgeInsets.all(isCompact ? 20 : 28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 30,
                            offset: Offset(0, 16),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const _RoleLogo(),
                          const SizedBox(height: 18),
                          Text(
                            'Excel Autogen',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Choose the user type to continue to the correct dashboard.',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF6B7280),
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 28),
                          _RoleButton(
                            label: 'Dispatch User',
                            icon: Icons.local_shipping_outlined,
                            onPressed: () => _openScreen(
                              context,
                              const DispatcherDashboard(),
                            ),
                          ),
                          const SizedBox(height: 14),
                          _RoleButton(
                            label: 'Billing User',
                            icon: Icons.receipt_long_outlined,
                            onPressed: () => _openScreen(
                              context,
                              const BillingDashboard(),
                            ),
                          ),
                          const SizedBox(height: 14),
                          _RoleButton(
                            label: 'Management',
                            icon: Icons.assured_workload_outlined,
                            onPressed: () => _openScreen(
                              context,
                              const ManagementDashboard(),
                            ),
                          ),
                          const SizedBox(height: 14),
                          _RoleButton(
                            label: 'Admin',
                            icon: Icons.admin_panel_settings_outlined,
                            onPressed: () =>
                                _openScreen(context, const AdminDashboard()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _openScreen(BuildContext context, Widget screen) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => screen),
    );
  }
}

class _RoleLogo extends StatelessWidget {
  const _RoleLogo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 82,
        height: 82,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F172A), Color(0xFF2563EB)],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x332563EB),
              blurRadius: 24,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: const Icon(
          Icons.table_chart_rounded,
          color: Colors.white,
          size: 36,
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  const _RoleButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xFF111827),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}
