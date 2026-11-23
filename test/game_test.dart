import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sayiyla_boyama/oyun_sayiyla_boyama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sayiylaBoyamaConfig.title.length, 33);
    expect(sayiylaBoyamaConfig.tagline.length, 33);
    for (final s in sayiylaBoyamaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(sayiylaBoyamaConfig.gameId, sayiylaBoyamaId);
    expect(sayiylaBoyamaRules.gameId, sayiylaBoyamaId);
    expect(sayiylaBoyamaConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sayiylaBoyamaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sayiylaBoyamaId, optionalMechanics: sayiylaBoyamaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sayiylaBoyamaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
