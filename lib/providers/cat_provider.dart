import 'package:flutter/foundation.dart';
import '../models/cat.dart';
import '../services/cat_api_service.dart';

class CatProvider extends ChangeNotifier {
  List<Cat> _cats = [];
  List<CatBreed> _breeds = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Cat> get cats => _cats;
  List<CatBreed> get breeds => _breeds;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load random cats
  Future<void> loadRandomCats({int limit = 20}) async {
    try {
      _setLoading(true);
      _clearError();
      
      final cats = await CatApiService.getRandomCats(limit: limit);
      _cats = cats;
      
      _setLoading(false);
    } catch (e) {
      _setError('Failed to load cats: $e');
    }
  }

  // Load breeds
  Future<void> loadBreeds() async {
    try {
      _setLoading(true);
      _clearError();
      
      final breeds = await CatApiService.getBreeds();
      _breeds = breeds;
      
      _setLoading(false);
    } catch (e) {
      _setError('Failed to load breeds: $e');
    }
  }

  // Load cats by breed
  Future<List<Cat>> loadCatsByBreed(String breedId, {int limit = 5}) async {
    try {
      final cats = await CatApiService.getCatsByBreed(breedId, limit: limit);
      return cats;
    } catch (e) {
      _setError('Failed to load cats for breed: $e');
      return [];
    }
  }

  // Refresh cats
  Future<void> refreshCats() async {
    await loadRandomCats();
  }

  // Refresh breeds
  Future<void> refreshBreeds() async {
    await loadBreeds();
  }

  // Helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    _isLoading = false;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }

  // Clear all data
  void clearData() {
    _cats.clear();
    _breeds.clear();
    _error = null;
    notifyListeners();
  }
} 