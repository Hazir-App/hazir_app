import 'package:flutter_bloc/flutter_bloc.dart';

class MultiServiceProvider extends MultiRepositoryProvider{
  MultiServiceProvider({super.key, required super.providers, required super.child});

}




class ServiceProvider<T> extends RepositoryProvider<T>{
  ServiceProvider({super.key, required super.create});
}