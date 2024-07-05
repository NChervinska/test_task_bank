import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_bank/cubit/home_cubit/home_cubit.dart';
import 'package:test_task_bank/di/di.dart';
import 'package:test_task_bank/models/rate.dart';
import 'package:test_task_bank/utils/build_context_ext.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<HomeCubit>()..init(),
      child: const HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.strings.currentRateRate),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == HomeStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
                backgroundColor: context.theme.colorScheme.onErrorContainer,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status != HomeStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return HomeBodyView(rates: state.rates);
        },
      ),
    );
  }
}

class HomeBodyView extends StatelessWidget {
  final List<Rate> rates;

  const HomeBodyView({
    super.key,
    required this.rates,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Center(
        child: SizedBox(
          width: context.isWeb ? context.width / 2 : double.infinity,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: rates.map((rate) {
              return Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            rate.cc,
                            style: context.theme.textTheme.titleMedium,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          rate.rate.toStringAsFixed(3),
                          style: context.theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      rate.txt,
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
