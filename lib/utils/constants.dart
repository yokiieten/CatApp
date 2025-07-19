class AppConstants {
  // API URLs
  static const String catApiBaseUrl = 'https://api.thecatapi.com/v1';
  
  // App Info
  static const String appName = 'Cat Gallery';
  static const String appVersion = '1.0.0';
  
  // UI Constants
  static const double cardBorderRadius = 12.0;
  static const double cardElevation = 4.0;
  static const double gridSpacing = 8.0;
  static const int gridCrossAxisCount = 2;
  static const double gridChildAspectRatio = 0.8;
  
  // API Limits
  static const int defaultCatLimit = 20;
  static const int breedCatLimit = 5;
  
  // Error Messages
  static const String networkError = 'Network error occurred';
  static const String loadCatsError = 'Failed to load cats';
  static const String loadBreedsError = 'Failed to load breeds';
  
  // Loading Messages
  static const String loadingCats = 'Loading cute cats...';
  static const String loadingBreeds = 'Loading breeds...';
  
  // Placeholder Images
  static const List<String> placeholderImages = [
    'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400',
    'https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?w=400',
    'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400',
    'https://images.unsplash.com/photo-1543852786-1cf6624b9987?w=400',
    'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?w=400',
  ];
} 