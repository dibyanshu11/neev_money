import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/data/local/user_prefs.dart';
import 'package:new_app/domain/models/user_model.dart';
import 'package:new_app/domain/repository/fund_repository.dart';
import 'package:new_app/presentation/blocs/home/home_event_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({FundRepository? repository})
      : _repository = repository ?? FundRepository(),
        super(HomeState.initial()) {
    on<LoadHome>(_onLoad);
  }

  final FundRepository _repository;

  Future<void> _onLoad(LoadHome event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    final prefs = UserPrefs.instance;
    final prefsName = await prefs.getName();
    final prefsEmail = await prefs.getEmail();
    final prefsPhone = await prefs.getPhone();

    final userResult = await _repository.getUser();
    final portfolioResult = await _repository.getPortfolio();
    final fundsResult = await _repository.getFunds();

    await userResult.fold(
      (f) async =>
          emit(state.copyWith(isLoading: false, error: 'Failed to load')),
      (user) async {
        final merged = UserModel(
          id: user.id,
          name: prefsName.isNotEmpty ? prefsName : user.name,
          email: prefsEmail.isNotEmpty ? prefsEmail : user.email,
          phone: prefsPhone.isNotEmpty ? prefsPhone : user.phone,
          isKycVerified: user.isKycVerified,
        );
        portfolioResult.fold(
          (f) => emit(state.copyWith(isLoading: false, user: merged)),
          (portfolio) {
            fundsResult.fold(
              (f) => emit(state.copyWith(
                isLoading: false,
                user: merged,
                portfolio: portfolio,
              )),
              (funds) => emit(state.copyWith(
                isLoading: false,
                user: merged,
                portfolio: portfolio,
                funds: funds.take(3).toList(),
              )),
            );
          },
        );
      },
    );
  }
}
