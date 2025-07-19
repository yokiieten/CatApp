import 'package:flutter/material.dart';
import '../models/cat.dart';
import '../services/cat_api_service.dart';
import '../widgets/cat_card.dart';
import 'cat_detail_screen.dart';

class BreedsScreen extends StatefulWidget {
  const BreedsScreen({super.key});

  @override
  State<BreedsScreen> createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  List<CatBreed> _breeds = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadBreeds();
  }

  Future<void> _loadBreeds() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final breeds = await CatApiService.getBreeds();
      setState(() {
        _breeds = breeds;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load breeds: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Breeds'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _error!,
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadBreeds,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadBreeds,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _breeds.length,
        itemBuilder: (context, index) {
          final breed = _breeds[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  breed.name[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                breed.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (breed.origin != null)
                    Text('Origin: ${breed.origin}'),
                  if (breed.temperament != null)
                    Text(
                      'Temperament: ${breed.temperament!.split(',').take(3).join(', ')}...',
                      style: TextStyle(fontSize: 12),
                    ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => _navigateToBreedDetail(breed),
            ),
          );
        },
      ),
    );
  }

  void _navigateToBreedDetail(CatBreed breed) async {
    final cats = await CatApiService.getCatsByBreed(breed.id, limit: 5);
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CatDetailScreen(
            title: breed.name,
            cats: cats,
            breed: breed,
          ),
        ),
      );
    }
  }
} 