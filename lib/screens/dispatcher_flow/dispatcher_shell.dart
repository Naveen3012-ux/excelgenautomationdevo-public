import 'package:flutter/material.dart';

enum DispatcherNavItem { master, dashboard, pivot }

void navigateWithDispatcherTransition(
  BuildContext context,
  Widget page,
) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 180),
      reverseTransitionDuration: const Duration(milliseconds: 160),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        );

        return FadeTransition(
          opacity: Tween<double>(begin: 0.96, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    ),
  );
}

class DispatcherScaffold extends StatelessWidget {
  const DispatcherScaffold({
    super.key,
    required this.body,
    required this.currentItem,
    required this.onItemSelected,
    this.backgroundColor = const Color(0xFFF4F7FB),
  });

  final Widget body;
  final DispatcherNavItem currentItem;
  final ValueChanged<DispatcherNavItem> onItemSelected;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: body),
      bottomNavigationBar: DispatcherBottomNavigation(
        currentItem: currentItem,
        onItemSelected: onItemSelected,
      ),
    );
  }
}

class DispatcherBottomNavigation extends StatelessWidget {
  const DispatcherBottomNavigation({
    super.key,
    required this.currentItem,
    required this.onItemSelected,
  });

  final DispatcherNavItem currentItem;
  final ValueChanged<DispatcherNavItem> onItemSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final navWidth = screenWidth > 720 ? 420.0 : screenWidth - 32;
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SizedBox(
      height: 84 + bottomInset,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + bottomInset),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: navWidth,
            height: 68,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF0B2A5B), Color(0xFF071A3A)],
                ),
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x22071A3A),
                    blurRadius: 24,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _DispatcherNavButton(
                      icon: Icons.dataset_outlined,
                      label: 'Master',
                      selected: currentItem == DispatcherNavItem.master,
                      onTap: () => onItemSelected(DispatcherNavItem.master),
                    ),
                  ),
                  Expanded(
                    child: _DispatcherNavButton(
                      icon: Icons.dashboard_outlined,
                      label: 'Dashboard',
                      selected: currentItem == DispatcherNavItem.dashboard,
                      onTap: () => onItemSelected(DispatcherNavItem.dashboard),
                    ),
                  ),
                  Expanded(
                    child: _DispatcherNavButton(
                      icon: Icons.pivot_table_chart_outlined,
                      label: 'Pivot',
                      selected: currentItem == DispatcherNavItem.pivot,
                      onTap: () => onItemSelected(DispatcherNavItem.pivot),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DispatcherNavButton extends StatelessWidget {
  const _DispatcherNavButton({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1E66D1) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                height: 1,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
