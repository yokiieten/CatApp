import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          _buildSection(
            context,
            'App Information',
            [
              _buildListTile(
                context,
                'App Name',
                'Cat Gallery',
                icon: Icons.pets,
              ),
              _buildListTile(
                context,
                'Version',
                '1.0.0',
                icon: Icons.info,
              ),
            ],
          ),
          _buildSection(
            context,
            'API Information',
            [
              _buildListTile(
                context,
                'API Provider',
                'The Cat API',
                icon: Icons.api,
                onTap: () => _launchUrl('https://thecatapi.com/'),
              ),
              _buildListTile(
                context,
                'API Status',
                'Free (No API Key Required)',
                icon: Icons.check_circle,
                iconColor: Colors.green,
              ),
            ],
          ),
          _buildSection(
            context,
            'Features',
            [
              _buildListTile(
                context,
                'Random Cat Images',
                'View random cat images',
                icon: Icons.shuffle,
              ),
              _buildListTile(
                context,
                'Cat Breeds',
                'Browse cat breeds',
                icon: Icons.category,
              ),
              _buildListTile(
                context,
                'Breed Details',
                'Detailed breed information',
                icon: Icons.info_outline,
              ),
              _buildListTile(
                context,
                'Offline Support',
                'Works without internet',
                icon: Icons.wifi_off,
              ),
            ],
          ),
          _buildSection(
            context,
            'About',
            [
              _buildListTile(
                context,
                'GitHub Repository',
                'View source code',
                icon: Icons.code,
                onTap: () => _launchUrl('https://github.com/yourusername/catapp'),
              ),
              _buildListTile(
                context,
                'Report Issue',
                'Report bugs or request features',
                icon: Icons.bug_report,
                onTap: () => _launchUrl('https://github.com/yourusername/catapp/issues'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context,
    String title,
    String subtitle, {
    IconData? icon,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: icon != null
          ? Icon(
              icon,
              color: iconColor ?? Theme.of(context).colorScheme.primary,
            )
          : null,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap != null ? const Icon(Icons.arrow_forward_ios) : null,
      onTap: onTap,
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
} 