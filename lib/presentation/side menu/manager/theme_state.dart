part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class LoadingState extends ThemeState{}

class AppSettingsChangeState extends ThemeState{}
