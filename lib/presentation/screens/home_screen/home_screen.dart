import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazir_app/business_logic/authentication_bloc/authentication_bloc.dart';
import 'package:hazir_app/business_logic/home_bloc/home_bloc.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/firebase_enrollment_repository.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';
import 'package:hazir_app/presentation/screens/home_screen/local_widgets/course_card.dart';
import 'package:hazir_app/presentation/widgets/hazir_app_bar.dart';
import 'package:hazir_app/presentation/widgets/shimmer_effect.dart';
import 'package:hazir_app/services/snackbar_service.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String get route => "/home";

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirebaseEnrollmentRepository(),
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        userRepository: context.read<UserRepository>(),
        enrollmentRepository: context.read<FirebaseEnrollmentRepository>(),
      )..add(HomeGet()),
      child: BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
        if (state is HomeStateError) {
          context.read<SnackbarService>().showError();
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: HazirAppBar(
            toolbarHeight: 100,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello,', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                      Text(
                        state.user.name.split(" ")[0],
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      if (state is HomeStateLoaded)
                        Text('Updated ${timeago.format(state.enrollment.lastUpdated)}',
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<AuthenticationBloc>().add(AuthenticationLogoutRequested());
                      },
                      icon: Icon(Icons.logout, color: Theme.of(context).colorScheme.surface))
                ],
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: ShimmerEffect(
            isLoading: state is HomeStateLoading,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 0.9),
              padding: const EdgeInsets.all(16),
              itemCount: (state is HomeStateLoaded) ? state.enrollment.courses.length : 8,
              itemBuilder: (context, index) {
                return CourseCard(course: (state is HomeStateLoaded) ? state.enrollment.courses[index] : null);
              },
            ),
          ),
        );
      }),
    );
  }
}
