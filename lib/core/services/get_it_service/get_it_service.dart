import 'package:ecommerce_clean_architecture/core/services/get_it_service/get_it_service.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> setupGetIt() async => await getIt.init();
