part of 'app_control_cubit.dart';

@immutable
class AppControlState extends Equatable {
  final Locale locale;
  final String errorMessage;
  final bool isLightTheme;

  const AppControlState({
    required this.locale,
    this.errorMessage = '',
    this.isLightTheme = true,
  });

  @override
  List<Object> get props => [locale, errorMessage, isLightTheme];

  AppControlState copyWith({
    Locale? locale,
    String? errorMessage,
    bool? isLightTheme,
  }) {
    return AppControlState(
      locale: locale ?? this.locale,
      errorMessage: errorMessage ?? this.errorMessage,
      isLightTheme: isLightTheme ?? this.isLightTheme,
    );
  }
}
