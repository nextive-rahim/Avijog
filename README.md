# Avijog — অভিযোগ

A **government service app** for lodging and tracking citizen grievances in Bangladesh, built with
Flutter as a production-grade reference implementation.

Citizens file an appeal (অভিযোগ) against a department or service provider, follow its progress,
and receive official notices — all in Bangla or English, with phone-number OTP verification and
NID-based identity checks.

---

## Highlights

- **Citizen grievance workflow** — file an appeal, track its status, and follow it through to
  resolution, with the `file_text` dashboard as the entry point for pending cases.
- **OTP authentication** — phone-number verification with OTP confirmation, plus password reset
  and PIN change.
- **NID-based identity** — signup captures NID or birth-certificate number and institute/shop
  affiliation, matching the identity requirements of government service enrolment.
- **Full Bangla localisation** — `app_bn.arb` and `app_en.arb` drive every user-facing string via
  `flutter_gen`, with a runtime language switch.
- **Notices and announcements** — general and offer-style notification tabs, push notification
  models, and an announcements feed.
- **Official documents** — in-app PDF viewing for notices, FAQs and the user guide, with privacy
  policy pages.
- **Payment history** — transaction records with month filtering for services that require fees.
- **Account type onboarding** — distinct account journeys for citizens and institutional
  (institute/shop) accounts.
- **Taka (৳) denomination support** — local currency formatting throughout.

---

## Tech Stack

| Concern | Choice |
|---|---|
| UI | Flutter, Material |
| State management | Riverpod + `riverpod_annotation` (code generation) |
| Architecture | Feature-first Clean Architecture — `data` / `domain` / `presentation` layers per module |
| Networking | `dio` with `pretty_dio_logger` and `rest_client` code generation |
| Routing | `go_router` with a `StatefulShellRoute` bottom-navigation shell |
| Local storage | `hive_flutter`, `shared_preferences` |
| Documents | `flutter_pdfview`, `flutter_widget_from_html`, `pod_player` |
| Media | `image_picker`, `cached_network_image`, `carousel_slider` |
| Utilities | `dartz` (Either/Option), `equatable`, `intl`, `readmore`, `logger` |
| Localisation | `flutter_gen` + ARB (`app_bn.arb`, `app_en.arb`) |

---

## Architecture

```
lib/
├── main.dart
├── root.dart
└── src/
    ├── core/
    │   ├── contstant_data/
    │   ├── enums/
    │   ├── extension/              # form validation, string, time, url_launcher
    │   ├── gen/                    # generated assets, colours, fonts
    │   ├── logger/                 # riverpod-aware logger
    │   ├── models/
    │   ├── network/                # rest_client, request_handler, failures, end_points
    │   ├── routes/                 # app_routes + app_pages
    │   ├── service/cache/          # hive-backed cache service
    │   ├── service/exception/
    │   ├── theme/
    │   └── widgets/                # buttons, inputs, dialogs, snackbars, webview
    └── features/
        ├── authentication/         # login, signup, OTP, forget password
        ├── dashboard/              # bottom-nav shell + case list
        ├── home/                   # banners, vendors, bKash balance
        ├── language/
        ├── notification/           # general + offer notifications
        ├── payment_history/
        ├── products/
        └── profile/                # profile, update, FAQ, user guide, privacy
```

Every feature module follows the same layering: `presentation` (pages, widgets, Riverpod
providers) → `domain` (entities, repository interfaces, use cases) → `data` (models, data sources,
repository implementations). Dependencies point inward — the domain layer has no Flutter or HTTP
dependency, and Riverpod providers are the single wiring point between layers.

`dartz` is used for error handling, so failures are modelled in the type system rather than
thrown:

```dart
Future<Either<Failure, List<Grievance>>> getCases() async { ... }
```

---

## Getting Started

### Prerequisites

- Flutter `>= 3.16` (Dart `>= 3.4`)
- The backend API base URL in `lib/src/core/network/end_points.dart`

### Run

```bash
git clone https://github.com/nextive-rahim/Avijog.git
cd Avijog
flutter pub get
flutter run
```

### Code generation

Providers, API clients and the cache service are generated with `build_runner`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Localisation

```bash
flutter pub run intl_utils:generate
```

### Test

```bash
flutter test
flutter analyze
```

---

## Notes

- **App identity** — the Android label is `Avijog` while the Dart package is `obhijuk`, matching
  the Bangla name অভিযোগ.
- **Backend** — the app runs against a shared multi-tenant API; some domain vocabulary (vendors,
  products, balance) is inherited from that shared schema rather than being specific to the
  grievance workflow.
- **Permissions** — `permission_handler` covers runtime permission requests for camera, storage
  and notifications.

---

## License

Released under the MIT License.
