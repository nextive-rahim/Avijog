part of 'package:obhijuk/root.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return DashboardPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.historyTab,
              name: Routes.historyTab,
              pageBuilder: (context, state) => const HomePage(),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.homeTab,
              name: Routes.homeTab,
              pageBuilder: (context, state) => const HomePage(),
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // top route inside branch
            transitionGoRoute(
              path: Routes.profileTab,
              name: Routes.profileTab,
              pageBuilder: (context, state) => const ProfilePage(),
            )
          ],
        ),
      ],
    ),
    transitionGoRoute(
      path: Routes.splash,
      name: Routes.splash,
      pageBuilder: (context, state) => SplashPage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.welcome,
      name: Routes.welcome,
      pageBuilder: (context, state) => WelcomePage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.login,
      name: Routes.login,
      pageBuilder: (context, state) => const VerifyUserPage(),
      routes: [
        transitionGoRoute(
          path: Routes.passwordSubmit,
          name: Routes.passwordSubmit,
          pageBuilder: (context, state) {
            return const LoginPage();
          },
          routes: [
            transitionGoRoute(
              path: Routes.otp,
              name: Routes.otp,
              pageBuilder: (context, state) {
                final String isFrom = state.uri.queryParameters['isFrom'] ?? '';
                return OtpPage(isFrom: isFrom);
              },
              routes: [
                transitionGoRoute(
                  path: Routes.forgotPassword,
                  name: Routes.forgotPassword,
                  parentNavigatorKey: _rootNavigatorKey,
                  pageBuilder: (context, state) => ForgetPasswordPage(),
                ),
              ],
            ),
          ],
        ),
        transitionGoRoute(
          path: Routes.signup,
          name: Routes.signup,
          pageBuilder: (context, state) => SignUpPage(),
        ),
      ],
    ),
    transitionGoRoute(
      path: Routes.products,
      name: Routes.products,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final String? vendorId = state.uri.queryParameters['vendorId'];
        final String? vendorName = state.uri.queryParameters['vendorName'];

        return ProductsPage(
          key: state.pageKey,
          vendorId: vendorId,
          vendorName: vendorName,
        );
      },
      routes: [
        transitionGoRoute(
          path: Routes.productDetails,
          name: Routes.productDetails,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final String productId = state.uri.queryParameters['productId']!;
            final String? productName =
                state.uri.queryParameters['productName'];

            return ProductDetailsPage(
              key: state.pageKey,
              productId: productId,
              productName: productName,
            );
          },
        ),
        transitionGoRoute(
          path: Routes.customerSignUp,
          name: Routes.customerSignUp,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final String? webviewLink = state.uri.queryParameters['webview'];
            final String? closingLink = state.uri.queryParameters['closing'];

            return CustomerSignUpWebviewPage(
              key: state.pageKey,
              webviewLink: webviewLink,
              closingLink: closingLink,
            );
          },
        )
      ],
    ),
    transitionGoRoute(
      path: Routes.webView,
      name: Routes.webView,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) {
        final String url = state.uri.queryParameters['url']!;
        final String title = state.uri.queryParameters['title']!;

        return WebViewPage(
          key: state.pageKey,
          url: url,
          title: title,
        );
      },
    ),
    transitionGoRoute(
      path: Routes.notification,
      name: Routes.notification,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => NotificationPage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.passwordChange,
      name: Routes.passwordChange,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => PinChangePage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.privacyPolicy,
      name: Routes.privacyPolicy,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => PrivacyPolicyPage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.userGuide,
      name: Routes.userGuide,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => UserGuidePage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.faq,
      name: Routes.faq,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => FaqPage(key: state.pageKey),
    ),
    transitionGoRoute(
      path: Routes.profileUpdated,
      name: Routes.profileUpdated,
      parentNavigatorKey: _rootNavigatorKey,
      pageBuilder: (context, state) => ProfileUpdatedPage(key: state.pageKey),
    ),
  ],
);

GoRoute transitionGoRoute({
  required String path,
  required String name,
  List<RouteBase>? routes,
  GlobalKey<NavigatorState>? parentNavigatorKey,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    parentNavigatorKey: parentNavigatorKey,
    path: path,
    name: name,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    ),
    routes: routes ?? [],
  );
}
