part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  error,
  loading,
}

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final String errorMessage;
  final List<Rate> rates;

  const HomeState({
    this.status = HomeStatus.loading,
    this.rates = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    List<Rate>? rates,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      rates: rates ?? this.rates,
    );
  }

  @override
  List<Object> get props => [status, errorMessage, rates];
}
