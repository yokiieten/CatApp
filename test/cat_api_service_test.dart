import 'package:flutter_test/flutter_test.dart';
import 'package:catapp/services/cat_api_service.dart';
import 'package:catapp/models/cat.dart';

void main() {
  group('CatApiService Tests', () {
    test('getRandomCats should return list of cats', () async {
      final cats = await CatApiService.getRandomCats(limit: 5);
      
      expect(cats, isA<List<Cat>>());
      expect(cats.length, lessThanOrEqualTo(5));
      
      if (cats.isNotEmpty) {
        expect(cats.first, isA<Cat>());
        expect(cats.first.id, isNotEmpty);
        expect(cats.first.url, isNotEmpty);
      }
    });

    test('getBreeds should return list of breeds', () async {
      final breeds = await CatApiService.getBreeds();
      
      expect(breeds, isA<List<CatBreed>>());
      expect(breeds.length, greaterThan(0));
      
      if (breeds.isNotEmpty) {
        expect(breeds.first, isA<CatBreed>());
        expect(breeds.first.id, isNotEmpty);
        expect(breeds.first.name, isNotEmpty);
      }
    });

    test('getCatsByBreed should return list of cats for specific breed', () async {
      final cats = await CatApiService.getCatsByBreed('abys', limit: 3);
      
      expect(cats, isA<List<Cat>>());
      expect(cats.length, lessThanOrEqualTo(3));
    });

    test('Cat model should parse JSON correctly', () {
      final json = {
        'id': 'test_id',
        'url': 'https://example.com/cat.jpg',
        'width': 400,
        'height': 300,
        'breeds': [
          {
            'id': 'abys',
            'name': 'Abyssinian',
            'description': 'Test description',
            'temperament': 'Active, Energetic',
            'origin': 'Egypt',
            'life_span': '14 - 15',
            'weight': {'metric': '4 - 5'},
            'wikipedia_url': 'https://example.com'
          }
        ]
      };

      final cat = Cat.fromJson(json);
      
      expect(cat.id, 'test_id');
      expect(cat.url, 'https://example.com/cat.jpg');
      expect(cat.width, 400);
      expect(cat.height, 300);
      expect(cat.breeds, isNotNull);
      expect(cat.breeds!.length, 1);
      expect(cat.breeds!.first.name, 'Abyssinian');
    });

    test('CatBreed model should parse JSON correctly', () {
      final json = {
        'id': 'abys',
        'name': 'Abyssinian',
        'description': 'Test description',
        'temperament': 'Active, Energetic',
        'origin': 'Egypt',
        'life_span': '14 - 15',
        'weight': {'metric': '4 - 5'},
        'wikipedia_url': 'https://example.com'
      };

      final breed = CatBreed.fromJson(json);
      
      expect(breed.id, 'abys');
      expect(breed.name, 'Abyssinian');
      expect(breed.description, 'Test description');
      expect(breed.temperament, 'Active, Energetic');
      expect(breed.origin, 'Egypt');
      expect(breed.lifeSpan, '14 - 15');
      expect(breed.weight, '4 - 5');
      expect(breed.wikipediaUrl, 'https://example.com');
    });
  });
} 