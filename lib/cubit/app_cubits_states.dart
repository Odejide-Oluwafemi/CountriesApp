import 'package:countries_app/internals/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class HomePageState extends CubitStates {
  final List<Country> countries;
  HomePageState(this.countries);
  @override
  List<Object> get props => [countries];
}
