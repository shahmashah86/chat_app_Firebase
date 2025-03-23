import 'package:get_it/get_it.dart';
import 'package:telegram_clone/data/authentication/authentication_repo_impl.dart';
import 'package:telegram_clone/domain/authentication/authentication_repo.dart';
import 'package:telegram_clone/presentation/bloc/authentication/authentication_bloc.dart';


final getIt = GetIt.instance;
void setup(){
  getIt.registerSingleton<AuthenticationRepo>(AuthenticationRepoImpl());
 getIt.registerSingleton<AuthenticationBloc>(AuthenticationBloc(getIt<AuthenticationRepo>()));
 

}