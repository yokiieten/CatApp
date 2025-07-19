import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cat.dart';
import '../widgets/cat_card.dart';

class CatDetailScreen extends StatelessWidget {
  final String title;
  final List<Cat> cats;
  final CatBreed? breed;

  const CatDetailScreen({
    super.key,
    required this.title,
    required this.cats,
    this.breed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (breed != null) _buildBreedInfo(context),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Images',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 8),
            _buildCatGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildBreedInfo(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              breed!.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            if (breed!.description != null) ...[
              Text(
                breed!.description!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
            ],
            _buildInfoRow('Origin', breed!.origin),
            _buildInfoRow('Life Span', breed!.lifeSpan),
            _buildInfoRow('Weight', breed!.weight),
            if (breed!.temperament != null) ...[
              const SizedBox(height: 8),
              Text(
                'Temperament:',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: breed!.temperament!
                    .split(',')
                    .map((trait) => Chip(
                          label: Text(trait.trim()),
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                        ))
                    .toList(),
              ),
            ],
            if (breed!.wikipediaUrl != null) ...[
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _launchWikipedia(breed!.wikipediaUrl!),
                icon: const Icon(Icons.open_in_new),
                label: const Text('Learn More on Wikipedia'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    if (value == null) return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildCatGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: cats.length,
      itemBuilder: (context, index) {
        return CatCard(
          cat: cats[index],
          onTap: () => _showCatImage(context, cats[index]),
        );
      },
    );
  }

  void _showCatImage(BuildContext context, Cat cat) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.network(
                  cat.url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            if (cat.breeds != null && cat.breeds!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cat.breeds!.first.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (cat.breeds!.first.origin != null)
                      Text(
                        'Origin: ${cat.breeds!.first.origin}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchWikipedia(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
} 