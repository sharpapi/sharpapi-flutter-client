import 'package:get_it/get_it.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/conent_and_marketing_api_service.dart';
import 'package:sharpapi_flutter_client/src/core/SharpApiService.dart';
import 'package:sharpapi_flutter_client/src/core/network/remote/dio_helper.dart';
import 'package:sharpapi_flutter_client/src/core/network/repository.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/e_commerce_api_service.dart';
import 'package:sharpapi_flutter_client/src/hr/hr_api_service.dart';
import 'package:sharpapi_flutter_client/src/seo/seo_api_service.dart';
import 'package:sharpapi_flutter_client/src/travel_tourism_hospitality/travel_tourism_hospitality_api_service.dart';

final sl = GetIt.instance;

Future<void> initDi() async {
  sl.registerFactory(
    () => HrApiService(
      repository: sl(),
      sharpApiService: sl(),
    ),
  );

  sl.registerFactory(
        () => ECommerceApiService(
      repository: sl(),
      sharpApiService: sl(),
    ),
  );

  sl.registerFactory(
        () => SeoApiService(
      repository: sl(),
      sharpApiService: sl(),
    ),
  );

  sl.registerFactory(
        () => TravelTourismHospitalityApiService(
      repository: sl(),
      sharpApiService: sl(),
    ),
  );

  sl.registerFactory(
        () => ContentAndMarketingApiService(
      repository: sl(),
      sharpApiService: sl(),
    ),
  );

  sl.registerFactory(
    () => SharpApiService(
      repository: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<Repository>(
    () => RepoImplementation(
      dioHelper: sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );
}
