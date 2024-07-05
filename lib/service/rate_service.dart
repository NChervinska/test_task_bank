import 'package:injectable/injectable.dart';
import 'package:test_task_bank/models/rate.dart';
import 'package:test_task_bank/service/core/base_service.dart';
import 'package:test_task_bank/service/preferences_service.dart';

import '../../api/api_client.dart';

@injectable
class RateService extends BaseService {
  final ApiClient apiClient;
  final PreferencesService preferencesService;

  RateService(this.apiClient, this.preferencesService);

  Future<List<Rate>> getExchangeList() async {
    return await makeErrorParsedCall(() async {
      final rates = await apiClient.getExchangeList();
      await preferencesService.setRates(rates);
      return rates;
    });
  }
}
