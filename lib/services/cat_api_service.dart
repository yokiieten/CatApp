import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/cat.dart';

class CatApiService {
  static const String baseUrl = 'https://api.thecatapi.com/v1';
  
  // Mock data for offline development
  static final List<Map<String, dynamic>> _mockCats = [
    {
      'id': 'mock_1',
      'url': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400',
      'width': 400,
      'height': 300,
      'breeds': [
        {
          'id': 'abys',
          'name': 'Abyssinian',
          'description': 'The Abyssinian is as close as you can get to the lions of your wildest dreams.',
          'temperament': 'Active, Energetic, Independent, Intelligent, Gentle',
          'origin': 'Egypt',
          'life_span': '14 - 15',
          'weight': {'metric': '4 - 5'},
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Abyssinian_(cat)'
        }
      ]
    },
    {
      'id': 'mock_2',
      'url': 'https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?w=400',
      'width': 400,
      'height': 300,
      'breeds': [
        {
          'id': 'aege',
          'name': 'Aegean',
          'description': 'Native to the Greek islands known as the Cyclades in the Aegean Sea.',
          'temperament': 'Affectionate, Social, Intelligent, Playful, Active',
          'origin': 'Greece',
          'life_span': '9 - 12',
          'weight': {'metric': '3 - 5'},
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Aegean_cat'
        }
      ]
    },
    {
      'id': 'mock_3',
      'url': 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=400',
      'width': 400,
      'height': 300,
      'breeds': [
        {
          'id': 'beng',
          'name': 'Bengal',
          'description': 'Bengal cats are smart, energetic and playful.',
          'temperament': 'Alert, Agile, Energetic, Demanding, Intelligent',
          'origin': 'United States',
          'life_span': '12 - 15',
          'weight': {'metric': '4 - 7'},
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Bengal_cat'
        }
      ]
    },
    {
      'id': 'mock_4',
      'url': 'https://images.unsplash.com/photo-1543852786-1cf6624b9987?w=400',
      'width': 400,
      'height': 300,
      'breeds': [
        {
          'id': 'birm',
          'name': 'Birman',
          'description': 'The Birman is a docile, quiet cat who loves people.',
          'temperament': 'Affectionate, Active, Gentle, Social',
          'origin': 'France',
          'life_span': '14 - 15',
          'weight': {'metric': '3 - 6'},
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Birman'
        }
      ]
    },
    {
      'id': 'mock_5',
      'url': 'https://images.unsplash.com/photo-1533738363-b7f9aef128ce?w=400',
      'width': 400,
      'height': 300,
      'breeds': [
        {
          'id': 'pers',
          'name': 'Persian',
          'description': 'The Persian is a very quiet cat that tends to be less active.',
          'temperament': 'Affectionate, loyal, Sedate, Quiet',
          'origin': 'Iran (Persia)',
          'life_span': '14 - 15',
          'weight': {'metric': '3 - 6'},
          'wikipedia_url': 'https://en.wikipedia.org/wiki/Persian_cat'
        }
      ]
    },
  ];

  static final List<Map<String, dynamic>> _mockBreeds = [
    {
      'id': 'abys',
      'name': 'Abyssinian',
      'description': 'The Abyssinian is as close as you can get to the lions of your wildest dreams.',
      'temperament': 'Active, Energetic, Independent, Intelligent, Gentle',
      'origin': 'Egypt',
      'life_span': '14 - 15',
      'weight': {'metric': '4 - 5'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Abyssinian_(cat)'
    },
    {
      'id': 'aege',
      'name': 'Aegean',
      'description': 'Native to the Greek islands known as the Cyclades in the Aegean Sea.',
      'temperament': 'Affectionate, Social, Intelligent, Playful, Active',
      'origin': 'Greece',
      'life_span': '9 - 12',
      'weight': {'metric': '3 - 5'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Aegean_cat'
    },
    {
      'id': 'beng',
      'name': 'Bengal',
      'description': 'Bengal cats are smart, energetic and playful.',
      'temperament': 'Alert, Agile, Energetic, Demanding, Intelligent',
      'origin': 'United States',
      'life_span': '12 - 15',
      'weight': {'metric': '4 - 7'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Bengal_cat'
    },
    {
      'id': 'birm',
      'name': 'Birman',
      'description': 'The Birman is a docile, quiet cat who loves people.',
      'temperament': 'Affectionate, Active, Gentle, Social',
      'origin': 'France',
      'life_span': '14 - 15',
      'weight': {'metric': '3 - 6'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Birman'
    },
    {
      'id': 'pers',
      'name': 'Persian',
      'description': 'The Persian is a very quiet cat that tends to be less active.',
      'temperament': 'Affectionate, loyal, Sedate, Quiet',
      'origin': 'Iran (Persia)',
      'life_span': '14 - 15',
      'weight': {'metric': '3 - 6'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Persian_cat'
    },
    {
      'id': 'mcoo',
      'name': 'Maine Coon',
      'description': 'They are known for their large size and thick double coat.',
      'temperament': 'Adaptable, Intelligent, Loving, Gentle, Independent',
      'origin': 'United States',
      'life_span': '12 - 15',
      'weight': {'metric': '5 - 8'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Maine_Coon'
    },
    {
      'id': 'siam',
      'name': 'Siamese',
      'description': 'While Siamese cats are extremely fond of their people.',
      'temperament': 'Active, Agile, Clever, Sociable, Loving, Energetic',
      'origin': 'Thailand',
      'life_span': '15 - 20',
      'weight': {'metric': '3 - 5'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Siamese_cat'
    },
    {
      'id': 'ragd',
      'name': 'Ragdoll',
      'description': 'Ragdolls love their people, greeting them at the door.',
      'temperament': 'Affectionate, Friendly, Gentle, Quiet, Easygoing',
      'origin': 'United States',
      'life_span': '12 - 17',
      'weight': {'metric': '5 - 9'},
      'wikipedia_url': 'https://en.wikipedia.org/wiki/Ragdoll'
    },
  ];

  // Get random cat images
  static Future<List<Cat>> getRandomCats({int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/images/search?limit=$limit'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Cat.fromJson(json)).toList();
      } else {
        // Fallback to mock data
        return _getMockCats(limit);
      }
    } catch (e) {
      // Fallback to mock data on error
      return _getMockCats(limit);
    }
  }

  // Get cat breeds
  static Future<List<CatBreed>> getBreeds() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/breeds'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => CatBreed.fromJson(json)).toList();
      } else {
        // Fallback to mock data
        return _getMockBreeds();
      }
    } catch (e) {
      // Fallback to mock data on error
      return _getMockBreeds();
    }
  }

  // Get cats by breed
  static Future<List<Cat>> getCatsByBreed(String breedId, {int limit = 10}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/images/search?breed_ids=$breedId&limit=$limit'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Cat.fromJson(json)).toList();
      } else {
        // Fallback to mock data
        return _getMockCats(limit);
      }
    } catch (e) {
      // Fallback to mock data on error
      return _getMockCats(limit);
    }
  }

  // Mock data helpers
  static List<Cat> _getMockCats(int limit) {
    final random = Random();
    final shuffled = List<Map<String, dynamic>>.from(_mockCats)..shuffle(random);
    return shuffled
        .take(limit)
        .map((json) => Cat.fromJson(json))
        .toList();
  }

  static List<CatBreed> _getMockBreeds() {
    return _mockBreeds.map((json) => CatBreed.fromJson(json)).toList();
  }
} 