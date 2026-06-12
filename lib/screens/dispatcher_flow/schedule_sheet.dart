import 'package:excelgenautomationdevo/screens/common/master_data.dart';
import 'package:excelgenautomationdevo/screens/dashboard/dispatcher_dashboard.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/pivot_engine.dart';
import 'package:flutter/material.dart';

import 'dispatcher_shell.dart';

class ScheduleSheet extends StatefulWidget {
  const ScheduleSheet({super.key});

  @override
  State<ScheduleSheet> createState() => _ScheduleSheetState();
}

class _ScheduleSheetState extends State<ScheduleSheet> {
  bool showDetailsTab = true;
  String selectedPlant = 'All Plants';
  String selectedVendor = 'All Vendors';
  String selectedMonth = 'May 2025';
  String selectedStatus = 'All Status';
  String selectedCategory = 'All';

  static const _rows = [
    _ScheduleRow(
      prNo: 'PR-DC-M-2601-0001',
      project: 'IN0034',
      partNo: 'A1517A',
      description: 'ASSY PART',
      prQty: '250',
      balQty: '100',
      vendor: 'ABC Industries',
      scheduleDate: '22-May-2025',
      product: 'CNG',
      category: 'Schedule',
      mrdDate: '20-May-2025',
      commitmentDate: '21-May-2025',
      poNo: '4500012345',
      poVendor: 'ABC Industries',
      poStatus: 'Approved',
      poStatusColor: Color(0xFF16A34A),
      poStatusTint: Color(0xFFEAF7EE),
      leadTime: '15',
      delay: '0',
      invoiceNo: 'INV-00123',
    ),
    _ScheduleRow(
      prNo: 'PR-DC-M-2601-0002',
      project: 'IN0034',
      partNo: 'A1517B',
      description: 'ASSY PART',
      prQty: '450',
      balQty: '250',
      vendor: 'XYZ Pvt Ltd',
      scheduleDate: '23-May-2025',
      product: 'CNG',
      category: 'Schedule',
      mrdDate: '21-May-2025',
      commitmentDate: '22-May-2025',
      poNo: '4500012346',
      poVendor: 'XYZ Pvt Ltd',
      poStatus: 'Pending',
      poStatusColor: Color(0xFFF59E0B),
      poStatusTint: Color(0xFFFFF5E3),
      leadTime: '15',
      delay: '1',
      invoiceNo: 'INV-00124',
    ),
    _ScheduleRow(
      prNo: 'PR-DC-M-2601-0003',
      project: 'IN0034',
      partNo: 'A1517C',
      description: 'ASSY PART',
      prQty: '300',
      balQty: '150',
      vendor: 'ABC Industries',
      scheduleDate: '24-May-2025',
      product: 'CNG',
      category: 'Schedule',
      mrdDate: '22-May-2025',
      commitmentDate: '23-May-2025',
      poNo: '4500012347',
      poVendor: 'ABC Industries',
      poStatus: 'Delayed',
      poStatusColor: Color(0xFFEF4444),
      poStatusTint: Color(0xFFFEECEC),
      leadTime: '15',
      delay: '2',
      invoiceNo: 'INV-00125',
    ),
    _ScheduleRow(
      prNo: 'PR-DC-M-2601-0004',
      project: 'IN0035',
      partNo: 'B2356A',
      description: 'CLAMP ASSY',
      prQty: '200',
      balQty: '0',
      vendor: 'PQR Engineers',
      scheduleDate: '24-May-2025',
      product: 'LNG',
      category: 'Emergency',
      mrdDate: '22-May-2025',
      commitmentDate: '23-May-2025',
      poNo: '4500012348',
      poVendor: 'PQR Engineers',
      poStatus: 'Approved',
      poStatusColor: Color(0xFF16A34A),
      poStatusTint: Color(0xFFEAF7EE),
      leadTime: '10',
      delay: '0',
      invoiceNo: 'INV-00126',
    ),
    _ScheduleRow(
      prNo: 'PR-DC-M-2601-0005',
      project: 'IN0035',
      partNo: 'B2356B',
      description: 'CLAMP ASSY',
      prQty: '180',
      balQty: '50',
      vendor: 'LMN Works',
      scheduleDate: '25-May-2025',
      product: 'CNG',
      category: 'Schedule',
      mrdDate: '23-May-2025',
      commitmentDate: '24-May-2025',
      poNo: '4500012349',
      poVendor: 'LMN Works',
      poStatus: 'Pending',
      poStatusColor: Color(0xFFF59E0B),
      poStatusTint: Color(0xFFFFF5E3),
      leadTime: '12',
      delay: '1',
      invoiceNo: 'INV-00127',
    ),
    _ScheduleRow(
      prNo: 'PR-DC-M-2601-0006',
      project: 'IN0036',
      partNo: 'C3457A',
      description: 'FLANGE PLATE',
      prQty: '320',
      balQty: '120',
      vendor: 'ABC Industries',
      scheduleDate: '25-May-2025',
      product: 'CNG',
      category: 'Schedule',
      mrdDate: '23-May-2025',
      commitmentDate: '24-May-2025',
      poNo: '4500012350',
      poVendor: 'ABC Industries',
      poStatus: 'Delayed',
      poStatusColor: Color(0xFFEF4444),
      poStatusTint: Color(0xFFFEECEC),
      leadTime: '15',
      delay: '3',
      invoiceNo: 'INV-00128',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DispatcherScaffold(
      currentItem: DispatcherNavItem.dashboard,
      onItemSelected: (item) => _handleNavigation(context, item),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1300;
          final isMedium = constraints.maxWidth >= 900;

          return SingleChildScrollView(
            padding: EdgeInsets.all(isWide ? 18 : 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(isWide: isWide),
                const SizedBox(height: 16),
                _Toolbar(isWide: isWide),
                const SizedBox(height: 16),
                isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              children: [
                                _FiltersCard(
                                  selectedPlant: selectedPlant,
                                  selectedVendor: selectedVendor,
                                  selectedMonth: selectedMonth,
                                  selectedStatus: selectedStatus,
                                  selectedCategory: selectedCategory,
                                  onPlantChanged: (value) =>
                                      setState(() => selectedPlant = value!),
                                  onVendorChanged: (value) =>
                                      setState(() => selectedVendor = value!),
                                  onMonthChanged: (value) =>
                                      setState(() => selectedMonth = value!),
                                  onStatusChanged: (value) =>
                                      setState(() => selectedStatus = value!),
                                  onCategoryChanged: (value) =>
                                      setState(() => selectedCategory = value!),
                                ),
                                const SizedBox(height: 16),
                                const _ScheduleTableCard(rows: _rows),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 310,
                            child: _RecordDetailsPanel(
                              showDetailsTab: showDetailsTab,
                              onTabChanged: (value) {
                                setState(() => showDetailsTab = value);
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _FiltersCard(
                            selectedPlant: selectedPlant,
                            selectedVendor: selectedVendor,
                            selectedMonth: selectedMonth,
                            selectedStatus: selectedStatus,
                            selectedCategory: selectedCategory,
                            onPlantChanged: (value) =>
                                setState(() => selectedPlant = value!),
                            onVendorChanged: (value) =>
                                setState(() => selectedVendor = value!),
                            onMonthChanged: (value) =>
                                setState(() => selectedMonth = value!),
                            onStatusChanged: (value) =>
                                setState(() => selectedStatus = value!),
                            onCategoryChanged: (value) =>
                                setState(() => selectedCategory = value!),
                          ),
                          const SizedBox(height: 16),
                          const _ScheduleTableCard(rows: _rows),
                          if (isMedium) ...[
                            const SizedBox(height: 16),
                            _RecordDetailsPanel(
                              showDetailsTab: showDetailsTab,
                              onTabChanged: (value) {
                                setState(() => showDetailsTab = value);
                              },
                            ),
                          ],
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _handleNavigation(BuildContext context, DispatcherNavItem item) {
    final page = switch (item) {
      DispatcherNavItem.master => const MasterData(),
      DispatcherNavItem.dashboard => const DispatcherDashboard(),
      DispatcherNavItem.pivot => const PivotEngine(),
    };

    navigateWithDispatcherTransition(context, page);
  }
}

// ignore: unused_element
class _ScheduleSidebar extends StatelessWidget {
  const _ScheduleSidebar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0B2A5B), Color(0xFF071A3A)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: const Column(
        children: [
          SizedBox(height: 24),
          _SideBrand(),
          SizedBox(height: 18),
          _SideProfile(),
          SizedBox(height: 18),
          _SideTile(icon: Icons.dashboard_outlined, label: 'Dashboard'),
          _SideTile(icon: Icons.upload_file_outlined, label: 'File Upload'),
          _SideTile(icon: Icons.apartment_outlined, label: 'Plant Update'),
          _SideTile(
            icon: Icons.calendar_month_outlined,
            label: 'Schedule Update',
            selected: true,
          ),
          _SideTile(icon: Icons.storage_outlined, label: 'Master Data'),
          _SideTile(icon: Icons.table_chart_outlined, label: 'Pivot List'),
          _SideTile(
              icon: Icons.local_shipping_outlined, label: 'Dispatch Update'),
          _SideTile(
            icon: Icons.dashboard_customize_outlined,
            label: 'Dedicated Dashboard',
          ),
          Spacer(),
          Divider(color: Color(0x33FFFFFF), indent: 20, endIndent: 20),
          SizedBox(height: 12),
          _SideTile(icon: Icons.notifications_none, label: 'Notifications'),
          _SideTile(icon: Icons.logout, label: 'Logout'),
          SizedBox(height: 18),
        ],
      ),
    );
  }
}

class _SideBrand extends StatelessWidget {
  const _SideBrand();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(Icons.inventory_2_rounded, color: Color(0xFF2563EB)),
          ),
          SizedBox(width: 12),
          Text(
            'SupplyTrack',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class _SideProfile extends StatelessWidget {
  const _SideProfile();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Text(
              'DU',
              style: TextStyle(
                color: Color(0xFF2563EB),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dispatch User',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Dispatcher',
                  style: TextStyle(
                    color: Color(0xFFBFDBFE),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }
}

class _SideTile extends StatelessWidget {
  const _SideTile({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2563EB) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 22),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final titleCard = Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: _cardDecoration(),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.menu_rounded, color: Color(0xFF475569)),
          SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Schedule Update - SH2',
                style: TextStyle(
                  color: Color(0xFF172554),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Manage and update dispatch schedules',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final searchCard = Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: _cardDecoration(),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search PR No, Part No, Vendor, PO No...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Color(0xFF94A3B8)),
              ),
            ),
          ),
          Icon(Icons.search_rounded, color: Color(0xFF64748B)),
        ],
      ),
    );

    final profileCard = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: _cardDecoration(),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.notifications_none_rounded, color: Color(0xFF475569)),
              Positioned(
                right: -2,
                top: -4,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Color(0xFFEF4444),
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFF0B2A5B),
            child: Text(
              'DU',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Dispatch User',
            style: TextStyle(
              color: Color(0xFF334155),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 6),
          Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF475569)),
        ],
      ),
    );

    if (isWide) {
      return Row(
        children: [
          titleCard,
          const SizedBox(width: 16),
          Expanded(child: searchCard),
          const SizedBox(width: 16),
          profileCard,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleCard,
        const SizedBox(height: 14),
        searchCard,
        const SizedBox(height: 14),
        profileCard,
      ],
    );
  }
}

class _Toolbar extends StatelessWidget {
  const _Toolbar({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          _ActionButton(
            icon: Icons.add,
            label: 'New Row',
            backgroundColor: const Color(0xFF2563EB),
            foregroundColor: Colors.white,
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.file_upload_outlined,
            label: 'Upload Excel',
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.save_outlined,
            label: 'Save Changes',
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.download_outlined,
            label: 'Export Excel',
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.refresh_rounded,
            label: 'Refresh',
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.grid_view_outlined,
            label: 'Bulk Update',
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.settings_outlined,
            label: 'Column Settings',
            onPressed: () {},
          ),
          _ActionButton(
            icon: Icons.delete_outline_rounded,
            label: 'Delete Selected',
            foregroundColor: const Color(0xFFEF4444),
            onPressed: () {},
          ),
          if (isWide)
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Last saved: 22 May 2025, 10:45 AM',
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: Color(0xFF22C55E),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.foregroundColor = const Color(0xFF2563EB),
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    final isPrimary = backgroundColor != Colors.white;
    return isPrimary
        ? FilledButton.icon(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              minimumSize: const Size(0, 44),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(icon, size: 18),
            label: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: foregroundColor,
              minimumSize: const Size(0, 44),
              side: const BorderSide(color: Color(0xFFD8E0EC)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: Icon(icon, size: 18),
            label: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          );
  }
}

class _FiltersCard extends StatelessWidget {
  const _FiltersCard({
    required this.selectedPlant,
    required this.selectedVendor,
    required this.selectedMonth,
    required this.selectedStatus,
    required this.selectedCategory,
    required this.onPlantChanged,
    required this.onVendorChanged,
    required this.onMonthChanged,
    required this.onStatusChanged,
    required this.onCategoryChanged,
  });

  final String selectedPlant;
  final String selectedVendor;
  final String selectedMonth;
  final String selectedStatus;
  final String selectedCategory;
  final ValueChanged<String?> onPlantChanged;
  final ValueChanged<String?> onVendorChanged;
  final ValueChanged<String?> onMonthChanged;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<String?> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              _FilterDropdown(
                label: 'Plant',
                value: selectedPlant,
                width: 150,
                items: const ['All Plants', 'Plant 1', 'Plant 2', 'Plant 3'],
                onChanged: onPlantChanged,
              ),
              _FilterDropdown(
                label: 'Vendor',
                value: selectedVendor,
                width: 150,
                items: const ['All Vendors', 'ABC Industries', 'XYZ Pvt Ltd'],
                onChanged: onVendorChanged,
              ),
              _FilterDropdown(
                label: 'Month',
                value: selectedMonth,
                width: 160,
                items: const ['May 2025', 'June 2025', 'July 2025'],
                onChanged: onMonthChanged,
              ),
              _FilterDropdown(
                label: 'Status',
                value: selectedStatus,
                width: 160,
                items: const ['All Status', 'Approved', 'Pending', 'Delayed'],
                onChanged: onStatusChanged,
              ),
              _FilterDropdown(
                label: 'Dispatch Category',
                value: selectedCategory,
                width: 190,
                items: const ['All', 'Schedule', 'Emergency'],
                onChanged: onCategoryChanged,
              ),
              SizedBox(
                width: 230,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search in sheet...',
                    suffixIcon: const Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: const Color(0xFFFBFCFE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF2563EB),
                  minimumSize: const Size(98, 50),
                  side: const BorderSide(color: Color(0xFFD8E0EC)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.filter_alt_outlined),
                label: const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.width,
  });

  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF475569),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFBFCFE),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleTableCard extends StatelessWidget {
  const _ScheduleTableCard({required this.rows});

  final List<_ScheduleRow> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: WidgetStateProperty.all(const Color(0xFFF8FAFC)),
              dataRowMinHeight: 58,
              dataRowMaxHeight: 58,
              columnSpacing: 20,
              columns: const [
                DataColumn(
                    label:
                        Icon(Icons.check_box_outline_blank_rounded, size: 18)),
                DataColumn(label: Text('PR Details')),
                DataColumn(label: Text('Project')),
                DataColumn(label: Text('Part Number')),
                DataColumn(label: Text('Part Description')),
                DataColumn(label: Text('PR Qty')),
                DataColumn(label: Text('Bal Qty')),
                DataColumn(label: Text('Schedule Vendor')),
                DataColumn(label: Text('Schedule Date')),
                DataColumn(label: Text('Product')),
                DataColumn(label: Text('Dispatch Category')),
                DataColumn(label: Text('Vendor MRD Date')),
                DataColumn(label: Text('Vendor Commitment Date')),
                DataColumn(label: Text('PO No')),
                DataColumn(label: Text('PO Vendor')),
                DataColumn(label: Text('PO Status')),
                DataColumn(label: Text('Lead Time (Days)')),
                DataColumn(label: Text('Lead Delay (Days)')),
                DataColumn(label: Text('Invoice No')),
              ],
              rows: rows
                  .map(
                    (row) => DataRow(
                      cells: [
                        const DataCell(Icon(
                            Icons.check_box_outline_blank_rounded,
                            size: 18,
                            color: Color(0xFF94A3B8))),
                        DataCell(Text(row.prNo)),
                        DataCell(Text(row.project)),
                        DataCell(Text(row.partNo)),
                        DataCell(Text(row.description)),
                        DataCell(Text(row.prQty)),
                        DataCell(Text(row.balQty)),
                        DataCell(Text(row.vendor)),
                        DataCell(Text(row.scheduleDate)),
                        DataCell(Text(row.product)),
                        DataCell(Text(row.category)),
                        DataCell(Text(row.mrdDate)),
                        DataCell(Text(row.commitmentDate)),
                        DataCell(Text(row.poNo)),
                        DataCell(Text(row.poVendor)),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: row.poStatusTint,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              row.poStatus,
                              style: TextStyle(
                                color: row.poStatusColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        DataCell(Text(row.leadTime)),
                        DataCell(Text(row.delay)),
                        DataCell(Text(row.invoiceNo)),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Showing 1 to 15 of 1,250 entries',
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  _PagerArrow(icon: Icons.first_page_rounded),
                  SizedBox(width: 8),
                  _PagerArrow(icon: Icons.chevron_left_rounded),
                  SizedBox(width: 8),
                  _PagerNumber(number: '1', selected: true),
                  SizedBox(width: 8),
                  _PagerNumber(number: '2'),
                  SizedBox(width: 8),
                  _PagerNumber(number: '3'),
                  SizedBox(width: 8),
                  _PagerNumber(number: '4'),
                  SizedBox(width: 8),
                  _PagerNumber(number: '5'),
                  SizedBox(width: 8),
                  _PagerNumber(number: '84'),
                  SizedBox(width: 8),
                  _PagerArrow(icon: Icons.chevron_right_rounded),
                  SizedBox(width: 8),
                  _PagerArrow(icon: Icons.last_page_rounded),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PagerArrow extends StatelessWidget {
  const _PagerArrow({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(40, 40),
        padding: EdgeInsets.zero,
        side: const BorderSide(color: Color(0xFFD8E0EC)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Icon(icon, size: 18),
    );
  }
}

class _PagerNumber extends StatelessWidget {
  const _PagerNumber({
    required this.number,
    this.selected = false,
  });

  final String number;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor:
              selected ? const Color(0xFF2563EB) : const Color(0xFFF8FAFC),
          foregroundColor: selected ? Colors.white : const Color(0xFF334155),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color:
                  selected ? const Color(0xFF2563EB) : const Color(0xFFD8E0EC),
            ),
          ),
        ),
        child:
            Text(number, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class _RecordDetailsPanel extends StatelessWidget {
  const _RecordDetailsPanel({
    required this.showDetailsTab,
    required this.onTabChanged,
  });

  final bool showDetailsTab;
  final ValueChanged<bool> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Record Details',
                style: TextStyle(
                  color: Color(0xFF172554),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Icon(Icons.close_rounded, color: Color(0xFF64748B)),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'PR-DC-M-2601-0001',
                  style: TextStyle(
                    color: Color(0xFF172554),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF7EE),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Approved',
                  style: TextStyle(
                    color: Color(0xFF16A34A),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: FilledButton(
                  onPressed: () => onTabChanged(true),
                  style: FilledButton.styleFrom(
                    backgroundColor: showDetailsTab
                        ? const Color(0xFF2563EB)
                        : const Color(0xFFF1F5F9),
                    foregroundColor:
                        showDetailsTab ? Colors.white : const Color(0xFF475569),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Details'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: () => onTabChanged(false),
                  style: FilledButton.styleFrom(
                    backgroundColor: showDetailsTab
                        ? const Color(0xFFF1F5F9)
                        : const Color(0xFF2563EB),
                    foregroundColor:
                        showDetailsTab ? const Color(0xFF475569) : Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('History'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (showDetailsTab) ...[
            const _DetailSection(
              title: 'General Details',
              rows: [
                _DetailItem('PR Number', 'PR-DC-M-2601-0001'),
                _DetailItem('Project', 'IN0034'),
                _DetailItem('Part Number', 'A1517A'),
                _DetailItem('Part Description', 'ASSY PART'),
                _DetailItem('Product', 'CNG'),
                _DetailItem('Dispatch Category', 'Schedule'),
              ],
            ),
            const SizedBox(height: 16),
            const _DetailSection(
              title: 'Schedule Details',
              rows: [
                _DetailItem('Schedule Vendor', 'ABC Industries'),
                _DetailItem('Schedule Date', '22-May-2025'),
                _DetailItem('Vendor MRD Date', '20-May-2025'),
                _DetailItem('Vendor Commitment', '21-May-2025'),
              ],
            ),
            const SizedBox(height: 16),
            const _DetailSection(
              title: 'PO Details',
              rows: [
                _DetailItem('PO Number', '4500012345', accent: true),
                _DetailItem('PO Vendor', 'ABC Industries'),
                _DetailItem('PO Status', 'Approved', success: true),
                _DetailItem('Lead Time (Days)', '15'),
                _DetailItem('Lead Time Delay', '0'),
              ],
            ),
            const SizedBox(height: 16),
            const _DetailSection(
              title: 'Other Details',
              rows: [
                _DetailItem('Invoice No', 'INV-000123'),
                _DetailItem('Completion Status', '100%', success: true),
                _DetailItem('Group Code', 'GC-01'),
                _DetailItem('Sticker By Vendor', 'Yes'),
                _DetailItem('Remarks', '-'),
              ],
            ),
          ] else ...[
            const _DetailSection(
              title: 'Activity History',
              rows: [
                _DetailItem('22-May-2025 10:45 AM', 'Row created'),
                _DetailItem('22-May-2025 11:05 AM', 'Vendor updated'),
                _DetailItem('22-May-2025 11:30 AM', 'PO approved'),
                _DetailItem('22-May-2025 12:00 PM', 'Schedule synced'),
              ],
            ),
          ],
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              foregroundColor: const Color(0xFF2563EB),
              side: const BorderSide(color: Color(0xFFBFD0F7)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(Icons.edit_outlined),
            label: const Text(
              'Edit Row',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    required this.title,
    required this.rows,
  });

  final String title;
  final List<_DetailItem> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFCFDFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF172554),
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          ...rows.map((row) => _DetailLine(item: row)),
        ],
      ),
    );
  }
}

class _DetailLine extends StatelessWidget {
  const _DetailLine({required this.item});

  final _DetailItem item;

  @override
  Widget build(BuildContext context) {
    final valueColor = item.success
        ? const Color(0xFF16A34A)
        : item.accent
            ? const Color(0xFF2563EB)
            : const Color(0xFF334155);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              item.label,
              style: const TextStyle(
                color: Color(0xFF475569),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(':', style: TextStyle(color: Color(0xFF94A3B8))),
          ),
          Expanded(
            child: Text(
              item.value,
              style: TextStyle(
                color: valueColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleRow {
  const _ScheduleRow({
    required this.prNo,
    required this.project,
    required this.partNo,
    required this.description,
    required this.prQty,
    required this.balQty,
    required this.vendor,
    required this.scheduleDate,
    required this.product,
    required this.category,
    required this.mrdDate,
    required this.commitmentDate,
    required this.poNo,
    required this.poVendor,
    required this.poStatus,
    required this.poStatusColor,
    required this.poStatusTint,
    required this.leadTime,
    required this.delay,
    required this.invoiceNo,
  });

  final String prNo;
  final String project;
  final String partNo;
  final String description;
  final String prQty;
  final String balQty;
  final String vendor;
  final String scheduleDate;
  final String product;
  final String category;
  final String mrdDate;
  final String commitmentDate;
  final String poNo;
  final String poVendor;
  final String poStatus;
  final Color poStatusColor;
  final Color poStatusTint;
  final String leadTime;
  final String delay;
  final String invoiceNo;
}

class _DetailItem {
  const _DetailItem(
    this.label,
    this.value, {
    this.accent = false,
    this.success = false,
  });

  final String label;
  final String value;
  final bool accent;
  final bool success;
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    border: Border.all(color: const Color(0xFFE2E8F0)),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0F0F172A),
        blurRadius: 18,
        offset: Offset(0, 10),
      ),
    ],
  );
}
