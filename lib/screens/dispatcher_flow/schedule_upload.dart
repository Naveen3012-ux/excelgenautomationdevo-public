import 'package:excelgenautomationdevo/screens/common/master_data.dart';
import 'package:excelgenautomationdevo/screens/dashboard/dispatcher_dashboard.dart';
import 'package:excelgenautomationdevo/screens/dispatcher_flow/pivot_engine.dart';
import 'package:flutter/material.dart';

import 'dispatcher_shell.dart';

class ScheduleUpload extends StatefulWidget {
  const ScheduleUpload({super.key});

  @override
  State<ScheduleUpload> createState() => _ScheduleUploadState();
}

class _ScheduleUploadState extends State<ScheduleUpload> {
  String uploadType = 'Schedule Upload';
  String plant = 'Plant 3';
  String month = 'May 2025';
  String fileCategory = 'Schedule Input File';
  String processingRule = 'Standard Validation';

  bool validateBeforeUpload = true;
  bool autoProcessAfterUpload = true;
  bool sendEmailNotification = false;

  @override
  Widget build(BuildContext context) {
    return DispatcherScaffold(
      currentItem: DispatcherNavItem.dashboard,
      onItemSelected: (item) => _handleNavigation(context, item),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1180;
          final isMedium = constraints.maxWidth >= 860;

          return SingleChildScrollView(
            padding: EdgeInsets.all(isWide ? 20 : 14),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ScheduleTopBar(isWide: isWide),
                    const SizedBox(height: 18),
                    const Text(
                      'Upload your files to process dispatch operations.',
                      style: TextStyle(
                        color: Color(0xFF475569),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _SummaryRow(isMedium: isMedium),
                    const SizedBox(height: 18),
                    isMedium
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: _UploadDropZoneCard(
                                  isWide: isWide,
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                flex: 3,
                                child: _ConfigurationCard(
                                  uploadType: uploadType,
                                  plant: plant,
                                  month: month,
                                  fileCategory: fileCategory,
                                  processingRule: processingRule,
                                  validateBeforeUpload: validateBeforeUpload,
                                  autoProcessAfterUpload:
                                      autoProcessAfterUpload,
                                  sendEmailNotification: sendEmailNotification,
                                  onUploadTypeChanged: (value) =>
                                      setState(() => uploadType = value!),
                                  onPlantChanged: (value) =>
                                      setState(() => plant = value!),
                                  onMonthChanged: (value) =>
                                      setState(() => month = value!),
                                  onFileCategoryChanged: (value) =>
                                      setState(() => fileCategory = value!),
                                  onProcessingRuleChanged: (value) =>
                                      setState(() => processingRule = value!),
                                  onValidateChanged: (value) => setState(() =>
                                      validateBeforeUpload = value ?? false),
                                  onAutoProcessChanged: (value) => setState(
                                      () => autoProcessAfterUpload =
                                          value ?? false),
                                  onEmailChanged: (value) => setState(() =>
                                      sendEmailNotification = value ?? false),
                                ),
                              ),
                              const SizedBox(width: 18),
                              const Expanded(
                                flex: 3,
                                child: _UploadStatusCard(),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              _UploadDropZoneCard(isWide: isWide),
                              const SizedBox(height: 16),
                              _ConfigurationCard(
                                uploadType: uploadType,
                                plant: plant,
                                month: month,
                                fileCategory: fileCategory,
                                processingRule: processingRule,
                                validateBeforeUpload: validateBeforeUpload,
                                autoProcessAfterUpload: autoProcessAfterUpload,
                                sendEmailNotification: sendEmailNotification,
                                onUploadTypeChanged: (value) =>
                                    setState(() => uploadType = value!),
                                onPlantChanged: (value) =>
                                    setState(() => plant = value!),
                                onMonthChanged: (value) =>
                                    setState(() => month = value!),
                                onFileCategoryChanged: (value) =>
                                    setState(() => fileCategory = value!),
                                onProcessingRuleChanged: (value) =>
                                    setState(() => processingRule = value!),
                                onValidateChanged: (value) => setState(() =>
                                    validateBeforeUpload = value ?? false),
                                onAutoProcessChanged: (value) => setState(() =>
                                    autoProcessAfterUpload = value ?? false),
                                onEmailChanged: (value) => setState(() =>
                                    sendEmailNotification = value ?? false),
                              ),
                              const SizedBox(height: 16),
                              const _UploadStatusCard(),
                            ],
                          ),
                    const SizedBox(height: 18),
                    const _UploadedHistoryCard(),
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
      width: 260,
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
          _SidebarTile(
            icon: Icons.upload_file_outlined,
            label: 'File Upload',
            selected: true,
          ),
          _SidebarTile(icon: Icons.apartment_outlined, label: 'Plant Update'),
          _SidebarTile(
            icon: Icons.calendar_month_outlined,
            label: 'Schedule Update',
          ),
          _SidebarTile(icon: Icons.dataset_outlined, label: 'Master Data'),
          _SidebarTile(icon: Icons.grid_view_outlined, label: 'Pivot List'),
          _SidebarTile(
            icon: Icons.local_shipping_outlined,
            label: 'Dispatch Update',
          ),
          Spacer(),
          Divider(color: Color(0x33FFFFFF), indent: 20, endIndent: 20),
          SizedBox(height: 12),
          _SidebarTile(icon: Icons.notifications_none, label: 'Notifications'),
          _SidebarTile(icon: Icons.logout, label: 'Logout'),
          SizedBox(height: 18),
        ],
      ),
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
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.inventory_2_rounded,
              color: Color(0xFF2563EB),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'SupplyTrack',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarProfile extends StatelessWidget {
  const _SidebarProfile();

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF2563EB) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
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

class _ScheduleTopBar extends StatelessWidget {
  const _ScheduleTopBar({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final titleCard = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0F172A),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: const Icon(Icons.arrow_back_rounded),
            color: const Color(0xFF1E293B),
          ),
          const SizedBox(width: 4),
          const Text(
            'Schedule Upload',
            style: TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );

    final searchCard = Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0F172A),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search PR No, Dispatch No, Vendor, Plant...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Color(0xFF94A3B8)),
              ),
            ),
          ),
          Icon(Icons.search_rounded, color: Color(0xFF64748B)),
        ],
      ),
    );

    final dateCard = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F0F172A),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.calendar_today_outlined, size: 18),
          SizedBox(width: 10),
          Text(
            '22 May 2025, Thursday',
            style: TextStyle(
              color: Color(0xFF334155),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.keyboard_arrow_down_rounded),
        ],
      ),
    );

    if (isWide) {
      return Row(
        children: [
          titleCard,
          const SizedBox(width: 14),
          Expanded(child: searchCard),
          const SizedBox(width: 14),
          dateCard,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleCard,
        const SizedBox(height: 14),
        dateCard,
        const SizedBox(height: 14),
        searchCard,
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.isMedium});

  final bool isMedium;

  @override
  Widget build(BuildContext context) {
    final cards = [
      const _SummaryCard(
        icon: Icons.upload_file_outlined,
        title: 'Total Files',
        value: '320',
        subtitle: 'All time',
        iconColor: Color(0xFF2563EB),
        tint: Color(0xFFE8F0FF),
      ),
      const _SummaryCard(
        icon: Icons.check_circle_outline_rounded,
        title: 'Processed',
        value: '280',
        subtitle: '87%',
        iconColor: Color(0xFF16A34A),
        subtitleColor: Color(0xFF16A34A),
        tint: Color(0xFFE8F8EE),
      ),
      const _SummaryCard(
        icon: Icons.access_time_rounded,
        title: 'Pending',
        value: '25',
        subtitle: '8%',
        iconColor: Color(0xFFF59E0B),
        subtitleColor: Color(0xFFF59E0B),
        tint: Color(0xFFFFF5E3),
      ),
      const _SummaryCard(
        icon: Icons.cancel_outlined,
        title: 'Failed',
        value: '15',
        subtitle: '5%',
        iconColor: Color(0xFFEF4444),
        subtitleColor: Color(0xFFEF4444),
        tint: Color(0xFFFEECEC),
      ),
    ];

    if (isMedium) {
      return Row(
        children: [
          for (var i = 0; i < cards.length; i++) ...[
            Expanded(child: cards[i]),
            if (i != cards.length - 1) const SizedBox(width: 16),
          ],
        ],
      );
    }

    return Column(
      children: [
        for (var i = 0; i < cards.length; i++) ...[
          cards[i],
          if (i != cards.length - 1) const SizedBox(height: 14),
        ],
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.iconColor,
    required this.tint,
    this.subtitleColor = const Color(0xFF64748B),
  });

  final IconData icon;
  final String title;
  final String value;
  final String subtitle;
  final Color iconColor;
  final Color tint;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: tint,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 36),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF334155),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFF172554),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: subtitleColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _UploadDropZoneCard extends StatelessWidget {
  const _UploadDropZoneCard({required this.isWide});

  final bool isWide;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload New File',
            style: TextStyle(
              color: Color(0xFF172554),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: isWide ? 54 : 38,
              horizontal: 18,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFCFDFF),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: const Color(0xFF9CB8FF),
                width: 1.4,
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF1FF),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Icon(
                    Icons.cloud_upload_outlined,
                    size: 52,
                    color: Color(0xFF2563EB),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Drag & Drop File Here',
                  style: TextStyle(
                    color: Color(0xFF172554),
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Supported formats: XLSX, XLS, CSV',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF2563EB),
                    side: const BorderSide(color: Color(0xFF8FB0FF)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.file_upload_outlined),
                  label: const Text(
                    'Browse Files',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Icon(
                Icons.shield_outlined,
                size: 18,
                color: Color(0xFF64748B),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Files are secure and will be validated before processing.',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConfigurationCard extends StatelessWidget {
  const _ConfigurationCard({
    required this.uploadType,
    required this.plant,
    required this.month,
    required this.fileCategory,
    required this.processingRule,
    required this.validateBeforeUpload,
    required this.autoProcessAfterUpload,
    required this.sendEmailNotification,
    required this.onUploadTypeChanged,
    required this.onPlantChanged,
    required this.onMonthChanged,
    required this.onFileCategoryChanged,
    required this.onProcessingRuleChanged,
    required this.onValidateChanged,
    required this.onAutoProcessChanged,
    required this.onEmailChanged,
  });

  final String uploadType;
  final String plant;
  final String month;
  final String fileCategory;
  final String processingRule;
  final bool validateBeforeUpload;
  final bool autoProcessAfterUpload;
  final bool sendEmailNotification;
  final ValueChanged<String?> onUploadTypeChanged;
  final ValueChanged<String?> onPlantChanged;
  final ValueChanged<String?> onMonthChanged;
  final ValueChanged<String?> onFileCategoryChanged;
  final ValueChanged<String?> onProcessingRuleChanged;
  final ValueChanged<bool?> onValidateChanged;
  final ValueChanged<bool?> onAutoProcessChanged;
  final ValueChanged<bool?> onEmailChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload Configuration',
            style: TextStyle(
              color: Color(0xFF172554),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          _LabeledDropdown(
            label: 'Upload Type',
            value: uploadType,
            items: const ['Schedule Upload', 'PR Upload', 'Master Data'],
            onChanged: onUploadTypeChanged,
          ),
          _LabeledDropdown(
            label: 'Plant',
            value: plant,
            items: const ['Plant 1', 'Plant 2', 'Plant 3'],
            onChanged: onPlantChanged,
          ),
          _LabeledDropdown(
            label: 'Month',
            value: month,
            items: const ['May 2025', 'June 2025', 'July 2025'],
            onChanged: onMonthChanged,
          ),
          _LabeledDropdown(
            label: 'File Category',
            value: fileCategory,
            items: const [
              'Schedule Input File',
              'PR Input File',
              'Vendor Master',
            ],
            onChanged: onFileCategoryChanged,
          ),
          _LabeledDropdown(
            label: 'Processing Rule',
            value: processingRule,
            items: const [
              'Standard Validation',
              'Strict Validation',
              'Manual Review',
            ],
            onChanged: onProcessingRuleChanged,
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            value: validateBeforeUpload,
            onChanged: onValidateChanged,
            activeColor: const Color(0xFF2563EB),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text(
              'Validate before upload',
              style: TextStyle(
                color: Color(0xFF334155),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CheckboxListTile(
            value: autoProcessAfterUpload,
            onChanged: onAutoProcessChanged,
            activeColor: const Color(0xFF2563EB),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text(
              'Auto Process After Upload',
              style: TextStyle(
                color: Color(0xFF334155),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CheckboxListTile(
            value: sendEmailNotification,
            onChanged: onEmailChanged,
            activeColor: const Color(0xFF2563EB),
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text(
              'Send Email Notification',
              style: TextStyle(
                color: Color(0xFF334155),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF334155),
                    side: const BorderSide(color: Color(0xFFD1D9E6)),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(Icons.cloud_upload_outlined),
                  label: const Text(
                    'Upload & Process',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LabeledDropdown extends StatelessWidget {
  const _LabeledDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
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
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                )
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
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UploadStatusCard extends StatelessWidget {
  const _UploadStatusCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upload Status',
            style: TextStyle(
              color: Color(0xFF172554),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Last Upload',
            style: TextStyle(
              color: Color(0xFF334155),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFBFCFF),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: const Row(
              children: [
                Icon(Icons.table_chart_rounded, color: Color(0xFF22C55E)),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Schedule_May2025.xlsx',
                        style: TextStyle(
                          color: Color(0xFF172554),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '22 May 2025, 10:45 AM',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const _StatusRow(label: 'Uploaded By', value: 'Dispatch User'),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F0FF),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Processing',
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const _StatusRow(label: 'Progress', value: '80%'),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: const LinearProgressIndicator(
              minHeight: 9,
              value: 0.8,
              backgroundColor: Color(0xFFE2E8F0),
              valueColor: AlwaysStoppedAnimation(Color(0xFF2563EB)),
            ),
          ),
          const SizedBox(height: 16),
          const _StatusRow(label: 'Records Processed', value: '1,280 / 1,600'),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              foregroundColor: const Color(0xFF2563EB),
              side: const BorderSide(color: Color(0xFFD1D9E6)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            icon: const Icon(Icons.description_outlined),
            label: const Text(
              'View Logs',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF334155),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF172554),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _UploadedHistoryCard extends StatelessWidget {
  const _UploadedHistoryCard();

  static const _historyRows = [
    _HistoryRowData(
      fileName: 'Schedule_May2025.xlsx',
      uploadType: 'Schedule Upload',
      plant: 'Plant 3',
      uploadedAt: '22 May 2025, 10:45 AM',
      uploadedBy: 'Dispatch User',
      records: '2,100',
      status: 'Processing',
      statusColor: Color(0xFF2563EB),
      statusTint: Color(0xFFE8F0FF),
      action: 'View Logs',
      actionIcon: Icons.remove_red_eye_outlined,
    ),
    _HistoryRowData(
      fileName: 'Schedule_Apr2025.xlsx',
      uploadType: 'Schedule Upload',
      plant: 'Plant 3',
      uploadedAt: '21 May 2025, 11:20 AM',
      uploadedBy: 'Dispatch User',
      records: '2,100',
      status: 'Success',
      statusColor: Color(0xFF16A34A),
      statusTint: Color(0xFFEAF7EE),
      action: 'View',
      actionIcon: Icons.download_outlined,
    ),
    _HistoryRowData(
      fileName: 'Vendor_Data_May2025.xlsx',
      uploadType: 'Master Data',
      plant: 'Plant 2',
      uploadedAt: '21 May 2025, 04:30 PM',
      uploadedBy: 'Dispatch User',
      records: '850',
      status: 'Failed',
      statusColor: Color(0xFFEF4444),
      statusTint: Color(0xFFFEECEC),
      action: 'Retry',
      actionIcon: Icons.refresh_rounded,
    ),
    _HistoryRowData(
      fileName: 'Schedule_Jun2025.xlsx',
      uploadType: 'Schedule Upload',
      plant: 'Plant 1',
      uploadedAt: '20 May 2025, 05:40 PM',
      uploadedBy: 'Dispatch User',
      records: '1,300',
      status: 'Failed',
      statusColor: Color(0xFFEF4444),
      statusTint: Color(0xFFFEECEC),
      action: 'Retry',
      actionIcon: Icons.refresh_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Uploaded Files History',
            style: TextStyle(
              color: Color(0xFF172554),
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 310,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search file name, type, plant...',
                    prefixIcon: const Icon(Icons.search_rounded),
                    filled: true,
                    fillColor: const Color(0xFFFBFCFE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                child: DropdownButtonFormField<String>(
                  value: 'All',
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All')),
                    DropdownMenuItem(
                      value: 'Success',
                      child: Text('Success'),
                    ),
                    DropdownMenuItem(
                      value: 'Failed',
                      child: Text('Failed'),
                    ),
                    DropdownMenuItem(
                      value: 'Processing',
                      child: Text('Processing'),
                    ),
                  ],
                  onChanged: (_) {},
                  decoration: InputDecoration(
                    labelText: 'Status',
                    filled: true,
                    fillColor: const Color(0xFFFBFCFE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '12 May 2025 - 22 May 2025',
                    prefixIcon: const Icon(Icons.calendar_today_outlined),
                    filled: true,
                    fillColor: const Color(0xFFFBFCFE),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Color(0xFFD8E0EC)),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFFBFCFE),
                  side: const BorderSide(color: Color(0xFFD8E0EC)),
                  minimumSize: const Size(50, 50),
                ),
                icon: const Icon(Icons.refresh_rounded),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                  const Color(0xFFF8FAFC),
                ),
                columnSpacing: 30,
                columns: const [
                  DataColumn(label: Text('File Name')),
                  DataColumn(label: Text('Upload Type')),
                  DataColumn(label: Text('Plant')),
                  DataColumn(label: Text('Upload Date & Time')),
                  DataColumn(label: Text('Uploaded By')),
                  DataColumn(label: Text('Records')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _historyRows
                    .map(
                      (row) => DataRow(
                        cells: [
                          DataCell(
                            Row(
                              children: [
                                const Icon(
                                  Icons.table_chart_rounded,
                                  color: Color(0xFF16A34A),
                                ),
                                const SizedBox(width: 10),
                                Text(row.fileName),
                              ],
                            ),
                          ),
                          DataCell(Text(row.uploadType)),
                          DataCell(Text(row.plant)),
                          DataCell(Text(row.uploadedAt)),
                          DataCell(Text(row.uploadedBy)),
                          DataCell(Text(row.records)),
                          DataCell(
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: row.statusTint,
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                row.status,
                                style: TextStyle(
                                  color: row.statusColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(row.actionIcon, size: 18),
                              label: Text(row.action),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Showing 1 to 4 of 20 entries',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  _PageButton(
                    icon: Icons.chevron_left_rounded,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  const _PageNumberButton(number: '1', selected: true),
                  const SizedBox(width: 8),
                  const _PageNumberButton(number: '2'),
                  const SizedBox(width: 8),
                  const _PageNumberButton(number: '3'),
                  const SizedBox(width: 8),
                  _PageButton(
                    icon: Icons.chevron_right_rounded,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(42, 42),
        padding: EdgeInsets.zero,
        side: const BorderSide(color: Color(0xFFD8E0EC)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Icon(icon),
    );
  }
}

class _PageNumberButton extends StatelessWidget {
  const _PageNumberButton({
    required this.number,
    this.selected = false,
  });

  final String number;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42,
      height: 42,
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor:
              selected ? const Color(0xFF2563EB) : const Color(0xFFF8FAFC),
          foregroundColor: selected ? Colors.white : const Color(0xFF334155),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color:
                  selected ? const Color(0xFF2563EB) : const Color(0xFFD8E0EC),
            ),
          ),
        ),
        child: Text(
          number,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _HistoryRowData {
  const _HistoryRowData({
    required this.fileName,
    required this.uploadType,
    required this.plant,
    required this.uploadedAt,
    required this.uploadedBy,
    required this.records,
    required this.status,
    required this.statusColor,
    required this.statusTint,
    required this.action,
    required this.actionIcon,
  });

  final String fileName;
  final String uploadType;
  final String plant;
  final String uploadedAt;
  final String uploadedBy;
  final String records;
  final String status;
  final Color statusColor;
  final Color statusTint;
  final String action;
  final IconData actionIcon;
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    border: Border.all(color: const Color(0xFFE2E8F0)),
    boxShadow: const [
      BoxShadow(
        color: Color(0x0F0F172A),
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
  );
}
