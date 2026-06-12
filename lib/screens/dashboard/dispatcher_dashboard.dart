import 'package:flutter/material.dart';
import 'package:excelgenautomationdevo/screens/common/master_data.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/pivot_engine.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/schedule_sheet.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/schedule_upload.dart';

class DispatcherDashboard extends StatelessWidget {
  const DispatcherDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 700;
            final isMedium =
                constraints.maxWidth >= 700 && constraints.maxWidth < 1100;
            final isWide = constraints.maxWidth >= 1100;

            final content = Padding(
              padding: EdgeInsets.all(isWide
                  ? 16
                  : isCompact
                      ? 10
                      : 12),
              child: Column(
                children: [
                  _TopBar(isWide: isWide, isCompact: isCompact),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _WelcomeHeader(isWide: isWide, isCompact: isCompact),
                          const SizedBox(height: 16),
                          _StatsRow(isWide: isWide, isCompact: isCompact),
                          const SizedBox(height: 16),
                          _OverviewGrid(
                            isWide: isWide,
                            isMedium: isMedium,
                            isCompact: isCompact,
                          ),
                          const SizedBox(height: 16),
                          _BottomGrid(isWide: isWide, isMedium: isMedium),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );

            if (!isWide) {
              return content;
            }

            return Row(
              children: [
                const SizedBox(width: 16),
                const _Sidebar(),
                Expanded(child: content),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0B2A5B), Color(0xFF071A3A)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(26)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 18, bottom: 18),
        child: Column(
          children: [
            _BrandRow(),
            const SizedBox(height: 18),
            const _ProfileCard(),
            const SizedBox(height: 18),
            ...[
              const _SidebarItem(
                  icon: Icons.dashboard_outlined,
                  label: 'Dashboard',
                  selected: true),
              const _SidebarItem(
                  icon: Icons.upload_file_outlined, label: 'File Upload'),
              const _SidebarItem(
                  icon: Icons.apartment_outlined, label: 'Plant Update'),
              const _SidebarItem(
                  icon: Icons.calendar_month_outlined,
                  label: 'Schedule Update'),
              const _SidebarItem(
                  icon: Icons.dataset_outlined, label: 'Master Data'),
              const _SidebarItem(
                  icon: Icons.grid_view_outlined, label: 'Pivot List'),
              const _SidebarItem(
                  icon: Icons.local_shipping_outlined,
                  label: 'Dispatch Update'),
              const _SidebarItem(
                  icon: Icons.dashboard_customize_outlined,
                  label: 'Dedicated Dashboard'),
            ].map((item) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: item,
                )),
            const SizedBox(height: 18),
            const Divider(color: Color(0x33FFFFFF), height: 1),
            const SizedBox(height: 12),
            const _SidebarFooter(),
          ],
        ),
      ),
    );
  }
}

class _BrandRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _BrandIcon(),
          SizedBox(width: 10),
          Text(
            'SupplyTrack',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandIcon extends StatelessWidget {
  const _BrandIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: const Color(0xFF2F80ED),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0x552F80ED)),
      ),
      child:
          const Icon(Icons.inventory_2_rounded, color: Colors.white, size: 20),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Color(0xFF94A3B8)),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dispatch User',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Dispatcher',
                  style: TextStyle(
                    color: Color(0xFFB7C6E3),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white70),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final background = selected ? const Color(0xFF1E66D1) : Colors.transparent;
    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: Colors.white, size: 20),
        title: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        onTap: () {},
      ),
    );
  }
}

class _SidebarFooter extends StatelessWidget {
  const _SidebarFooter();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.notifications_none_rounded,
                  color: Colors.white, size: 20),
              SizedBox(width: 12),
              Text('Notifications', style: TextStyle(color: Colors.white)),
              Spacer(),
              _Badge('8'),
            ],
          ),
          SizedBox(height: 14),
          Row(
            children: [
              Icon(Icons.logout_rounded, color: Colors.white, size: 20),
              SizedBox(width: 12),
              Text('Logout', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFE74C3C),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.isWide, required this.isCompact});

  final bool isWide;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final title = Text(
      'Dashboard',
      style: TextStyle(
        fontSize: isCompact ? 18 : 22,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF0F172A),
      ),
    );

    final userRow = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _IconCircle(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.notifications_none_rounded,
                  color: Color(0xFF1E293B)),
              Positioned(
                right: -2,
                top: -2,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE74C3C),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '8',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 17,
          backgroundColor: Color(0xFF0F2F6F),
          child: Text(
            'DU',
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        if (!isCompact) ...[
          const SizedBox(width: 10),
          const Text(
            'Dispatch User',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down_rounded,
              color: Color(0xFF64748B)),
        ],
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5EAF2)),
      ),
      child: isCompact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.menu_rounded, color: Color(0xFF1E293B)),
                    const SizedBox(width: 12),
                    Expanded(child: title),
                    userRow,
                  ],
                ),
                const SizedBox(height: 12),
                const _SearchBox(),
              ],
            )
          : Row(
              children: [
                const Icon(Icons.menu_rounded, color: Color(0xFF1E293B)),
                const SizedBox(width: 14),
                title,
                const SizedBox(width: 16),
                if (isWide) ...[
                  const Expanded(child: _SearchBox()),
                  const SizedBox(width: 18),
                ],
                userRow,
              ],
            ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD7DEEA)),
      ),
      child: const Row(
        children: [
          Expanded(
            child: Text(
              'Search PR No, Dispatch No, Vendor, Plant...',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
            ),
          ),
          Icon(Icons.search_rounded, color: Color(0xFF64748B)),
        ],
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  const _IconCircle({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD7DEEA)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _WelcomeHeader extends StatelessWidget {
  const _WelcomeHeader({required this.isWide, required this.isCompact});

  final bool isWide;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final headline = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back, Dispatch User!',
          style: TextStyle(
            fontSize: isCompact ? 22 : 28,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Here\'s what\'s happening with your dispatch operations today.',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );

    final dateChip = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE1E7F0)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_month_outlined,
              size: 18, color: Color(0xFF334155)),
          SizedBox(width: 10),
          Text(
            '22 May 2025, Thursday',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF64748B)),
        ],
      ),
    );

    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headline,
          if (!isCompact) ...[
            const SizedBox(height: 12),
            dateChip,
          ],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: headline),
        dateChip,
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.isWide, required this.isCompact});

  final bool isWide;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final cards = <_StatCard>[
      const _StatCard(
        title: 'Total PRs',
        value: '1,250',
        subtitle: 'All time',
        icon: Icons.description_outlined,
        color: Color(0xFF2F80ED),
      ),
      const _StatCard(
        title: 'Dispatched',
        value: '950',
        subtitle: '76%',
        icon: Icons.local_shipping_outlined,
        color: Color(0xFF4CAF50),
      ),
      const _StatCard(
        title: 'Pending',
        value: '200',
        subtitle: '16%',
        icon: Icons.schedule_outlined,
        color: Color(0xFFF59E0B),
      ),
      const _StatCard(
        title: 'Delayed',
        value: '100',
        subtitle: '8%',
        icon: Icons.warning_amber_outlined,
        color: Color(0xFFEF4444),
      ),
      const _StatCard(
        title: 'Billing Completed',
        value: '800',
        subtitle: '64%',
        icon: Icons.receipt_long_outlined,
        color: Color(0xFF6B5DD3),
      ),
      const _StatCard(
        title: 'Billing Not Completed',
        value: '150',
        subtitle: '12%',
        icon: Icons.receipt_outlined,
        color: Color(0xFFA77A45),
      ),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: cards
          .map(
            (card) => SizedBox(
              width: isWide
                  ? 216
                  : isCompact
                      ? double.infinity
                      : 260,
              child: card,
            ),
          )
          .toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5EAF2)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Color(0xFF334155), fontSize: 13)),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(color: color, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewGrid extends StatelessWidget {
  const _OverviewGrid({
    required this.isWide,
    required this.isMedium,
    required this.isCompact,
  });

  final bool isWide;
  final bool isMedium;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final children = [
      const _ChartPanel(
        title: 'Dispatch Overview',
        footerLink: 'View all dispatches',
        chart: _RingChart(
          total: '1,250',
          centerLabel: 'Total PRs',
          segments: [
            _RingSegment(
                color: Color(0xFF4CAF50),
                label: 'Delivered',
                value: '950 (76%)',
                flex: 76),
            _RingSegment(
                color: Color(0xFF2F80ED),
                label: 'In Transit',
                value: '70 (6%)',
                flex: 6),
            _RingSegment(
                color: Color(0xFFF59E0B),
                label: 'Pending',
                value: '200 (16%)',
                flex: 16),
            _RingSegment(
                color: Color(0xFFEF4444),
                label: 'Delayed',
                value: '100 (8%)',
                flex: 8),
          ],
        ),
      ),
      const _ChartPanel(
        title: 'Plant-wise Performance',
        footerLink: 'View full report',
        chart: _BarChart(),
      ),
      const _ChartPanel(
        title: 'Billing Overview',
        footerLink: 'View billing',
        chart: _BillingRingChart(),
      ),
    ];

    if (isCompact) {
      return Column(
        children: [
          ...children.map((child) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: child,
              )),
        ],
      );
    }

    if (isMedium) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: children[0]),
              const SizedBox(width: 12),
              Expanded(child: children[1]),
            ],
          ),
          const SizedBox(height: 12),
          children[2],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 12),
        Expanded(child: children[1]),
        const SizedBox(width: 12),
        Expanded(child: children[2]),
      ],
    );
  }
}

class _ChartPanel extends StatelessWidget {
  const _ChartPanel({
    required this.title,
    required this.footerLink,
    required this.chart,
  });

  final String title;
  final String footerLink;
  final Widget chart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5EAF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          chart,
          const SizedBox(height: 14),
          Text(
            footerLink,
            style: const TextStyle(
              color: Color(0xFF2563EB),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _RingSegment {
  const _RingSegment({
    required this.color,
    required this.label,
    required this.value,
    required this.flex,
  });

  final Color color;
  final String label;
  final String value;
  final int flex;
}

class _RingChart extends StatelessWidget {
  const _RingChart({
    required this.total,
    required this.centerLabel,
    required this.segments,
  });

  final String total;
  final String centerLabel;
  final List<_RingSegment> segments;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 360;

        final chart = SizedBox(
          width: 180,
          height: 180,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 180,
                height: 180,
                child: CircularProgressIndicator(
                  value: 0.76,
                  strokeWidth: 18,
                  backgroundColor: Color(0xFFF1F5F9),
                  color: Color(0xFF4CAF50),
                ),
              ),
              Transform.rotate(
                angle: 0.5,
                child: const SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: 0.06,
                    strokeWidth: 18,
                    backgroundColor: Colors.transparent,
                    color: Color(0xFF2F80ED),
                  ),
                ),
              ),
              Transform.rotate(
                angle: 1.0,
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    value: 0.16,
                    strokeWidth: 18,
                    backgroundColor: Colors.transparent,
                    color: Color(0xFFF59E0B),
                  ),
                ),
              ),
              Transform.rotate(
                angle: 1.6,
                child: const SizedBox(
                  width: 64,
                  height: 64,
                  child: CircularProgressIndicator(
                    value: 0.08,
                    strokeWidth: 18,
                    backgroundColor: Colors.transparent,
                    color: Color(0xFFEF4444),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    total,
                    style: const TextStyle(
                      color: Color(0xFF0F172A),
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    centerLabel,
                    style: const TextStyle(color: Color(0xFF475569)),
                  ),
                ],
              ),
            ],
          ),
        );

        final legend = Column(
          children: segments
              .map(
                (segment) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: segment.color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          segment.label,
                          style: const TextStyle(color: Color(0xFF334155)),
                        ),
                      ),
                      Text(
                        segment.value,
                        style: const TextStyle(
                          color: Color(0xFF0F172A),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        );

        if (stacked) {
          return Column(
            children: [
              Center(child: chart),
              const SizedBox(height: 16),
              legend,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            chart,
            const SizedBox(width: 16),
            Expanded(child: legend),
          ],
        );
      },
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 220,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _BarGroup(label: 'Plant 1', dispatched: 0.78, pending: 0.52),
                _BarGroup(label: 'Plant 2', dispatched: 0.63, pending: 0.38),
                _BarGroup(label: 'Plant 3', dispatched: 0.50, pending: 0.34),
                _BarGroup(label: 'Plant 4', dispatched: 0.40, pending: 0.28),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Legend(color: Color(0xFF4CAF50), label: 'Dispatched'),
              _Legend(color: Color(0xFF2F80ED), label: 'Pending'),
            ],
          ),
        ],
      ),
    );
  }
}

class _BarGroup extends StatelessWidget {
  const _BarGroup({
    required this.label,
    required this.dispatched,
    required this.pending,
  });

  final String label;
  final double dispatched;
  final double pending;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _Bar(heightFactor: dispatched, color: const Color(0xFF4CAF50)),
                const SizedBox(width: 8),
                _Bar(heightFactor: pending, color: const Color(0xFF2F80ED)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Color(0xFF475569))),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.heightFactor, required this.color});

  final double heightFactor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 150 * heightFactor,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(6)),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Color(0xFF334155))),
      ],
    );
  }
}

class _BillingRingChart extends StatelessWidget {
  const _BillingRingChart();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 320;

        const legend = Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Legend(color: Color(0xFF6B5DD3), label: 'Billing Completed'),
            SizedBox(height: 12),
            _Legend(color: Color(0xFFA77A45), label: 'Billing Not Completed'),
          ],
        );

        if (stacked) {
          return const Column(
            children: [
              _BillingRingVisual(),
              SizedBox(height: 16),
              legend,
            ],
          );
        }

        return const Row(
          children: [
            _BillingRingVisual(),
            SizedBox(width: 16),
            Expanded(child: legend),
          ],
        );
      },
    );
  }
}

class _BillingRingVisual extends StatelessWidget {
  const _BillingRingVisual();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 180,
            height: 180,
            child: CircularProgressIndicator(
              value: 0.84,
              strokeWidth: 18,
              backgroundColor: Color(0xFFF1F5F9),
              color: Color(0xFF6B5DD3),
            ),
          ),
          Transform.rotate(
            angle: 1.1,
            child: const SizedBox(
              width: 110,
              height: 110,
              child: CircularProgressIndicator(
                value: 0.16,
                strokeWidth: 18,
                backgroundColor: Colors.transparent,
                color: Color(0xFFA77A45),
              ),
            ),
          ),
          const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '950',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                ),
              ),
              Text('Total', style: TextStyle(color: Color(0xFF475569))),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomGrid extends StatelessWidget {
  const _BottomGrid({required this.isWide, required this.isMedium});

  final bool isWide;
  final bool isMedium;

  @override
  Widget build(BuildContext context) {
    final widgets = [
      const _ListPanel(
        title: 'Critical Alerts',
        footer: 'View all alerts',
        items: [
          _AlertItem(
            icon: Icons.warning_amber_outlined,
            color: Color(0xFFEF4444),
            title: '100 PRs are delayed',
            subtitle: 'These PRs are past the expected delivery date.',
            time: '10 min ago',
          ),
          _AlertItem(
            icon: Icons.schedule_outlined,
            color: Color(0xFFF59E0B),
            title: '200 PRs are pending',
            subtitle: 'These PRs are pending for dispatch.',
            time: '25 min ago',
          ),
          _AlertItem(
            icon: Icons.description_outlined,
            color: Color(0xFF6B5DD3),
            title: '150 PRs are pending billing',
            subtitle: 'Dispatch completed but billing not done.',
            time: '1 hr ago',
          ),
          _AlertItem(
            icon: Icons.info_outline,
            color: Color(0xFF2F80ED),
            title: 'Schedule updated for Plant 2',
            subtitle: 'New schedule has been uploaded.',
            time: '2 hrs ago',
          ),
        ],
      ),
      const _QuickNavPanel(),
      const _ListPanel(
        title: 'Recent Activity',
        footer: 'View all activity',
        items: [
          _ActivityItem(
            color: Color(0xFF4CAF50),
            title: 'Dispatch DISP1001 marked as Delivered',
            subtitle: 'Plant 1',
            time: '5 min ago',
          ),
          _ActivityItem(
            color: Color(0xFF2F80ED),
            title: 'Dispatch DISP1002 updated to In Transit',
            subtitle: 'Plant 2',
            time: '20 min ago',
          ),
          _ActivityItem(
            color: Color(0xFFF59E0B),
            title: 'Schedule uploaded for May 2025',
            subtitle: 'Plant 3',
            time: '1 hr ago',
          ),
          _ActivityItem(
            color: Color(0xFF6B5DD3),
            title: 'Billing updated for PR10001',
            subtitle: 'Vendor A',
            time: '2 hrs ago',
          ),
        ],
      ),
    ];

    if (!isWide && !isMedium) {
      return Column(
        children: [
          ...widgets.map((widget) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: widget,
              )),
        ],
      );
    }

    if (isMedium) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: widgets[0]),
              const SizedBox(width: 12),
              Expanded(child: widgets[1]),
            ],
          ),
          const SizedBox(height: 12),
          widgets[2],
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: widgets[0]),
        const SizedBox(width: 12),
        Expanded(child: widgets[1]),
        const SizedBox(width: 12),
        Expanded(child: widgets[2]),
      ],
    );
  }
}

class _ListPanel extends StatelessWidget {
  const _ListPanel({
    required this.title,
    required this.footer,
    required this.items,
  });

  final String title;
  final String footer;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5EAF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
          const SizedBox(height: 8),
          ...items,
          const SizedBox(height: 10),
          Text(
            footer,
            style: const TextStyle(
                color: Color(0xFF2563EB), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _AlertItem extends StatelessWidget {
  const _AlertItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Color(0xFF64748B), fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(time,
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  final Color color;
  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                  width: 10,
                  height: 10,
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle)),
              Container(width: 1, height: 44, color: const Color(0xFFD7DEEA)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(
                        color: Color(0xFF64748B), fontSize: 13)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(time,
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
        ],
      ),
    );
  }
}

class _QuickNavPanel extends StatelessWidget {
  const _QuickNavPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE5EAF2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Navigation',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth < 320 ? 1 : 2;
              final aspectRatio = constraints.maxWidth < 320 ? 2.6 : 1.2;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: aspectRatio,
                children: [
                  _QuickNavTile(
                    icon: Icons.cloud_upload_outlined,
                    label: 'File Upload',
                    color: const Color(0xFF2F80ED),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ScheduleUpload(),
                        ),
                      );
                    },
                  ),
                  const _QuickNavTile(
                      icon: Icons.apartment_outlined,
                      label: 'Plant Update',
                      color: Color(0xFF4CAF50)),
                  _QuickNavTile(
                    icon: Icons.calendar_month_outlined,
                    label: 'Schedule Update',
                    color: const Color(0xFF6B5DD3),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const ScheduleSheet(),
                        ),
                      );
                    },
                  ),
                  _QuickNavTile(
                    icon: Icons.storage_outlined,
                    label: 'Master Data',
                    color: const Color(0xFFF59E0B),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MasterData(),
                        ),
                      );
                    },
                  ),
                  _QuickNavTile(
                    icon: Icons.table_chart_outlined,
                    label: 'Pivot Summary',
                    color: const Color(0xFF38BDF8),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const PivotEngine(),
                        ),
                      );
                    },
                  ),
                  const _QuickNavTile(
                      icon: Icons.local_shipping_outlined,
                      label: 'Dispatch Update',
                      color: Color(0xFF2F80ED)),
                ],
              );
            },
          ),
          const SizedBox(height: 14),
          const Center(
            child: Text(
              'Go to Dedicated Dashboard →',
              style: TextStyle(
                  color: Color(0xFF2563EB), fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickNavTile extends StatelessWidget {
  const _QuickNavTile({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFBFDFF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFDCE4F2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 42, color: color),
              const SizedBox(height: 8),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
