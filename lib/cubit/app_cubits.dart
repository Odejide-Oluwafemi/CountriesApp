import 'package:bloc/bloc.dart';
import 'package:countries_app/cubit/app_cubits_states.dart';
import 'package:countries_app/internals/country_model.dart';
import 'package:countries_app/internals/data_service.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits(this.data) : super(InitialState()) {
    getData();
  }

  final DataService data;
  late final countries;

  void getData() async {
    try {
      print("Emitting LoadingState");
      emit(LoadingState());
      print("Waiting for API data");
      countries = await data.getAllCountries();
      print("API call finished");
      print("AppCubitLength: ${countries.length}");
      print("Emitting HomePageState");
      emit(HomePageState(countries));
      // emit(DetailPageState(countries[0]));
    } catch (e) {}
  }

  homePage() {
    emit(HomePageState(countries));
  }

  detailPage(Country country) {
    emit(DetailPageState(country));
  }
}
