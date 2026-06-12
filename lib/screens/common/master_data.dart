import 'package:excelgenautomationdevo/screens/dashboard/dispatcher_dashboard.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/dispatcher_shell.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/pivot_engine.dart';
import 'package:flutter/material.dart';

class MasterData extends StatefulWidget {
  const MasterData({super.key});

  @override
  State<MasterData> createState() => _MasterDataState();
}

class _MasterDataState extends State<MasterData> {
  String selectedSheet = 'SCH1';
  String selectedRowsPerPage = '50';

  static const List<String> _sheetOptions = ['SCH1', 'SCH2', 'SCH3'];
  static const List<String> _rowsPerPageOptions = ['25', '50', '100'];

  static const List<_MasterColumn> _columns = [
    _MasterColumn(label: '', width: 52),
    _MasterColumn(label: 'PLANT', width: 120),
    _MasterColumn(label: 'DESPATCH', width: 96),
    _MasterColumn(label: 'SC', width: 72),
    _MasterColumn(label: 'MRD DATE', width: 104),
    _MasterColumn(label: 'PR Detail No', width: 200),
    _MasterColumn(label: 'Project', width: 116),
    _MasterColumn(label: 'PartNumber', width: 240),
    _MasterColumn(label: 'Reference', width: 170),
    _MasterColumn(label: 'PartDescription', width: 250),
    _MasterColumn(label: 'PR Qty', width: 82),
    _MasterColumn(label: 'PRODUCT', width: 116),
    _MasterColumn(label: 'PO NO', width: 100),
  ];

  static const List<_MasterRow> _rows = [
    _MasterRow(
        index: 1,
        plant: '#N/A',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '5265W7CG01_CD01630_DF470_P01',
        reference: '5265W7CG01...',
        partDescription: 'CRADLE CHANNEL ASSEMBLY',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 2,
        plant: 'AMBATTUR',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '5265WBM015',
        reference: '5265WBM015',
        partDescription: 'CROSS HEAD ASSY',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 3,
        plant: 'AMBATTUR',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0048WLT015',
        reference: '0048WLT015',
        partDescription: 'CONNECTING BEAM',
        prQty: '2',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 4,
        plant: '#N/A',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0431WAD001',
        reference: '0431WAD001',
        partDescription: 'CWT SCREEN',
        prQty: '2',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 5,
        plant: '#N/A',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0222WHKH09_NR7_R08_DT3',
        reference: '0222WHKH09...',
        partDescription: 'HITCH PLATE',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 6,
        plant: 'AMBATTUR',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0032WFDG01_LLF_M35B_WRG700',
        reference: '0032WFDG01...',
        partDescription: 'SUPPORT BRACKET FOR MACHINE BEAM',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 7,
        plant: 'AMBATTUR',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0122VCR015',
        reference: '0122VCR015',
        partDescription: 'CAR SHEAVE BEAM',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 8,
        plant: '#N/A',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0122VCL015',
        reference: '0122VCL015',
        partDescription: 'SHEAVE BEAM',
        prQty: '2',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 9,
        plant: '#N/A',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '0318W4Y001',
        reference: '0318W4Y001',
        partDescription: 'KEY PLATE',
        prQty: '4',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 10,
        plant: 'AMBATTUR',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '5264WDMG01_CRG1830',
        reference: '5264WDMG01...',
        partDescription: 'PLANK',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 11,
        plant: '#N/A',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '5265W7CG01_CD01630_DF470_P01',
        reference: '5265W7CG01...',
        partDescription: 'CRADLE CHANNEL ASSEMBLY',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
    _MasterRow(
        index: 12,
        plant: 'AMBATTUR',
        despatch: 'H',
        sc: 'SH3',
        mrdDate: '5/14/2026',
        prDetailNo: 'PR-FAC-M-26008932-6',
        project: 'Ex2S0438L001',
        partNumber: '5265WBM015',
        reference: '5265WBM015',
        partDescription: 'CROSS HEAD ASSY',
        prQty: '1',
        product: 'Rexia-IN',
        poNo: '-'),
  ];

  @override
  Widget build(BuildContext context) {
    return DispatcherScaffold(
      currentItem: DispatcherNavItem.master,
      onItemSelected: (item) => _handleNavigation(context, item),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1280;
          final isMedium = constraints.maxWidth >= 900;

          return SingleChildScrollView(
            padding: EdgeInsets.all(isWide ? 18 : 12),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1700),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MasterTopBar(isWide: isWide),
                    const SizedBox(height: 18),
                    _MasterToolbar(
                      selectedSheet: selectedSheet,
                      onSheetChanged: (value) {
                        if (value == null) return;
                        setState(() => selectedSheet = value);
                      },
                      isMedium: isMedium,
                    ),
                    const SizedBox(height: 18),
                    const _MasterTableCard(
                      columns: _columns,
                      rows: _rows,
                    ),
                    const SizedBox(height: 18),
                    _MasterFooter(
                      selectedRowsPerPage: selectedRowsPerPage,
                      onRowsPerPageChanged: (value) {
                        if (value == null) return;
                        setState(() => selectedRowsPerPage = value);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleNavigation(BuildContext context, DispatcherNavItem item) {
    if (item == DispatcherNavItem.master) return;

    final page = switch (item) {
      DispatcherNavItem.master => const MasterData(),
      DispatcherNavItem.dashboard => const DispatcherDashboard(),
      DispatcherNavItem.pivot => const PivotEngine(),
    };

    navigateWithDispatcherTransition(context, page);
  }
}

// ignore: unused_element
class _MasterSidebar extends StatelessWidget {
  const _MasterSidebar();

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
          SizedBox(height: 22),
          _SidebarBrand(),
          SizedBox(height: 18),
          _SidebarProfile(),
          SizedBox(height: 18),
          _SidebarTile(icon: Icons.dashboard_outlined, label: 'Dashboard'),
          _SidebarTile(icon: Icons.upload_file_outlined, label: 'File Upload'),
          _SidebarTile(icon: Icons.apartment_outlined, label: 'Plant Update'),
          _SidebarTile(
            icon: Icons.calendar_month_outlined,
            label: 'Schedule Update',
          ),
          _SidebarTile(
            icon: Icons.dataset_outlined,
            label: 'Master Data',
            selected: true,
          ),
          _SidebarTile(icon: Icons.grid_view_outlined, label: 'Pivot List'),
          _SidebarTile(
            icon: Icons.local_shipping_outlined,
            label: 'Dispatch Update',
          ),
          _SidebarTile(
            icon: Icons.dashboard_customize_outlined,
            label: 'Dedicated Dashboard',
          ),
          Spacer(),
          Divider(color: Color(0x33FFFFFF), indent: 20, endIndent: 20),
          SizedBox(height: 12),
          _SidebarTile(icon: Icons.notifications_none, label: 'Notifications'),
          _SidebarTile(icon: Icons.logout, label: 'Logout'),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _MasterTopBar extends StatelessWidget {
  const _MasterTopBar({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    const titleSection = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.menu_rounded, color: Color(0xFF0F172A), size: 26),
              SizedBox(width: 12),
              Text(
                'Master Sheet',
                style: TextStyle(
                  color: Color(0xFF0F172A),
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Padding(
            padding: EdgeInsets.only(left: 38),
            child: Text(
              'Excel-like view of master schedule data',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );

    final searchBox = Expanded(
      flex: isWide ? 2 : 1,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDCE4F2)),
        ),
        child: const Row(
          children: [
            SizedBox(width: 16),
            Expanded(
              child: Text(
                'Search PR Detail No, Part Number, Project, Description...',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(Icons.search_rounded, color: Color(0xFF1E3A8A)),
            SizedBox(width: 14),
          ],
        ),
      ),
    );

    final rightActions = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(Icons.notifications_none_rounded,
                color: Color(0xFF0F172A), size: 24),
            Positioned(
              right: -2,
              top: -4,
              child: Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: const Text(
                  '8',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 18),
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Color(0xFF0B2A5B),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Text(
            'DU',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Dispatch User',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 6),
        const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF334155)),
      ],
    );

    if (!isWide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleSection,
          const SizedBox(height: 16),
          searchBox,
          const SizedBox(height: 16),
          rightActions,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSection,
        const SizedBox(width: 20),
        searchBox,
        const SizedBox(width: 20),
        rightActions,
      ],
    );
  }
}

class _MasterToolbar extends StatelessWidget {
  const _MasterToolbar({
    required this.selectedSheet,
    required this.onSheetChanged,
    required this.isMedium,
  });

  final String selectedSheet;
  final ValueChanged<String?> onSheetChanged;
  final bool isMedium;

  @override
  Widget build(BuildContext context) {
    final left = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Sheet',
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFDCE4F2)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedSheet,
              items: _MasterDataState._sheetOptions
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          color: Color(0xFF334155),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onSheetChanged,
            ),
          ),
        ),
      ],
    );

    const right = Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _ActionButton(icon: Icons.file_upload_outlined, label: 'Upload Excel'),
        _ActionButton(icon: Icons.download_outlined, label: 'Export Excel'),
        _ActionButton(icon: Icons.tune_rounded, label: 'Filters'),
        _IconActionButton(icon: Icons.fullscreen_rounded),
      ],
    );

    if (!isMedium) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          left,
          const SizedBox(height: 16),
          right,
        ],
      );
    }

    return Row(
      children: [
        left,
        const Spacer(),
        right,
      ],
    );
  }
}

class _MasterTableCard extends StatelessWidget {
  const _MasterTableCard({
    required this.columns,
    required this.rows,
  });

  final List<_MasterColumn> columns;
  final List<_MasterRow> rows;

  @override
  Widget build(BuildContext context) {
    final totalWidth =
        columns.fold<double>(0, (value, item) => value + item.width);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F172A),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: totalWidth,
          child: Column(
            children: [
              _TableHeader(columns: columns),
              _TableFilterRow(columns: columns),
              const Divider(height: 1, color: Color(0xFFE2E8F0)),
              ...rows.map((row) => _TableDataRow(columns: columns, row: row)),
              Container(
                height: 14,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.82,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF9CA3AF),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader({required this.columns});

  final List<_MasterColumn> columns;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18),
      child: Row(
        children: columns
            .map(
              (column) => _TableCell(
                width: column.width,
                alignment: column.label == ''
                    ? Alignment.center
                    : Alignment.centerLeft,
                child: Text(
                  column.label,
                  style: const TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _TableFilterRow extends StatelessWidget {
  const _TableFilterRow({required this.columns});

  final List<_MasterColumn> columns;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: columns.map((column) {
          if (column.label.isEmpty) {
            return _TableCell(
              width: column.width,
              alignment: Alignment.center,
              child: const Text(
                '',
                style: TextStyle(fontSize: 12),
              ),
            );
          }

          final icon = column.label == 'MRD DATE'
              ? Icons.filter_alt_outlined
              : Icons.keyboard_arrow_down_rounded;

          return _TableCell(
            width: column.width,
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFFBFDFF),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFDCE4F2)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  Icon(icon, size: 18, color: const Color(0xFF475569)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _TableDataRow extends StatelessWidget {
  const _TableDataRow({
    required this.columns,
    required this.row,
  });

  final List<_MasterColumn> columns;
  final _MasterRow row;

  @override
  Widget build(BuildContext context) {
    final values = [
      row.index.toString(),
      row.plant,
      row.despatch,
      row.sc,
      row.mrdDate,
      row.prDetailNo,
      row.project,
      row.partNumber,
      row.reference,
      row.partDescription,
      row.prQty,
      row.product,
      row.poNo,
    ];

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFF1F5F9)),
        ),
      ),
      child: Row(
        children: List.generate(columns.length, (index) {
          final value = values[index];
          final isIndex = index == 0;
          final isPlant = index == 1;
          final isSelectedCell = row.index == 1 && isPlant;

          return _TableCell(
            width: columns[index].width,
            padding: EdgeInsets.zero,
            alignment: isIndex ? Alignment.center : Alignment.centerLeft,
            child: Container(
              height: 44,
              alignment: isIndex ? Alignment.center : Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: isIndex ? 0 : 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isSelectedCell ? const Color(0xFFF8FBFF) : Colors.white,
                border: isSelectedCell
                    ? Border.all(color: const Color(0xFF2563EB), width: 2)
                    : null,
              ),
              child: Row(
                mainAxisAlignment: isIndex
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: isIndex
                            ? const Color(0xFF475569)
                            : const Color(0xFF334155),
                        fontSize: 13,
                        fontWeight: isPlant ? FontWeight.w700 : FontWeight.w500,
                      ),
                    ),
                  ),
                  if (isSelectedCell)
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: Color(0xFF64748B),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _MasterFooter extends StatelessWidget {
  const _MasterFooter({
    required this.selectedRowsPerPage,
    required this.onRowsPerPageChanged,
  });

  final String selectedRowsPerPage;
  final ValueChanged<String?> onRowsPerPageChanged;

  @override
  Widget build(BuildContext context) {
    final paginationButtons = [
      const _PaginationIcon(icon: Icons.keyboard_double_arrow_left_rounded),
      const _PaginationIcon(icon: Icons.chevron_left_rounded),
      const _PaginationNumber(label: '1', selected: true),
      const _PaginationNumber(label: '2'),
      const _PaginationNumber(label: '3'),
      const _PaginationNumber(label: '4'),
      const _PaginationNumber(label: '5'),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          '...',
          style: TextStyle(
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const _PaginationNumber(label: '249'),
      const _PaginationIcon(icon: Icons.chevron_right_rounded),
      const _PaginationIcon(icon: Icons.keyboard_double_arrow_right_rounded),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final stacked = constraints.maxWidth < 980;

        const left = Text(
          'Showing 1 to 50 of 12,450 entries',
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        );

        final center = Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: paginationButtons,
        );

        final right = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Rows per page:',
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFDCE4F2)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedRowsPerPage,
                  items: _MasterDataState._rowsPerPageOptions
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              color: Color(0xFF334155),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: onRowsPerPageChanged,
                ),
              ),
            ),
          ],
        );

        if (stacked) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              left,
              const SizedBox(height: 16),
              center,
              const SizedBox(height: 16),
              right,
            ],
          );
        }

        return Row(
          children: [
            left,
            const Spacer(),
            center,
            const Spacer(),
            right,
          ],
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDCE4F2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFF2563EB)),
          const SizedBox(width: 10),
          Text(
            label,
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

class _IconActionButton extends StatelessWidget {
  const _IconActionButton({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFDCE4F2)),
      ),
      child: Icon(icon, color: const Color(0xFF1E3A8A)),
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell({
    required this.width,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    this.alignment = Alignment.centerLeft,
  });

  final double width;
  final Widget child;
  final EdgeInsets padding;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: alignment,
      padding: padding,
      child: child,
    );
  }
}

class _PaginationNumber extends StatelessWidget {
  const _PaginationNumber({
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2563EB) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: selected ? const Color(0xFF2563EB) : const Color(0xFFDCE4F2),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF334155),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _PaginationIcon extends StatelessWidget {
  const _PaginationIcon({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFDCE4F2)),
      ),
      alignment: Alignment.center,
      child: Icon(icon, color: const Color(0xFF334155)),
    );
  }
}

class _SidebarBrand extends StatelessWidget {
  const _SidebarBrand();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
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
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF2563EB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.inventory_2_rounded,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

class _SidebarProfile extends StatelessWidget {
  const _SidebarProfile();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            child: Text(
              'DU',
              style: TextStyle(
                color: Color(0xFF0B2A5B),
                fontWeight: FontWeight.w800,
              ),
            ),
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
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 3),
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

class _SidebarTile extends StatelessWidget {
  const _SidebarTile({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1E66D1) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
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
      ),
    );
  }
}

class _MasterColumn {
  const _MasterColumn({
    required this.label,
    required this.width,
  });

  final String label;
  final double width;
}

class _MasterRow {
  const _MasterRow({
    required this.index,
    required this.plant,
    required this.despatch,
    required this.sc,
    required this.mrdDate,
    required this.prDetailNo,
    required this.project,
    required this.partNumber,
    required this.reference,
    required this.partDescription,
    required this.prQty,
    required this.product,
    required this.poNo,
  });

  final int index;
  final String plant;
  final String despatch;
  final String sc;
  final String mrdDate;
  final String prDetailNo;
  final String project;
  final String partNumber;
  final String reference;
  final String partDescription;
  final String prQty;
  final String product;
  final String poNo;
}
