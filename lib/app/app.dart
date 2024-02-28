import 'package:hiretop_mobile_app/api/api_client.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hiretop_mobile_app/ui/views/startup/landing_view.dart';
import 'package:hiretop_mobile_app/ui/views/login/login_view.dart';
import 'package:hiretop_mobile_app/ui/views/signup/signup_view.dart';
import 'package:hiretop_mobile_app/services/user_service.dart';
import 'package:hiretop_mobile_app/services/job_service.dart';
import 'package:hiretop_mobile_app/ui/views/job_details/job_details_view.dart';
import 'package:hiretop_mobile_app/ui/views/applications/applications_view.dart';
import 'package:hiretop_mobile_app/ui/views/favorites/favorites_view.dart';
import 'package:hiretop_mobile_app/ui/views/chats/chats_view.dart';
import 'package:hiretop_mobile_app/ui/views/jobs/jobs_view.dart';
// @stacked-import

@StackedApp(
  logger: StackedLogger(),
  routes: [
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LandingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: JobDetailsView),
    MaterialRoute(page: ApplicationsView),
    MaterialRoute(page: FavoritesView),
    MaterialRoute(page: ChatsView),
    MaterialRoute(page: JobsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: ApiClient),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: JobService),
// @stacked-service
  ],
  /*bottomsheets: [
    // @stacked-bottom-sheet
  ],
  dialogs: [
    // @stacked-dialog
  ],*/
)
class App {}
