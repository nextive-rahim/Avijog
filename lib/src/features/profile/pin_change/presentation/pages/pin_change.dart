part of '../../../root/presentation/pages/profile_page.dart';

class PinChangePage extends ConsumerStatefulWidget {
  const PinChangePage({super.key});

  @override
  ConsumerState<PinChangePage> createState() => _PinChangePageState();
}

class _PinChangePageState extends ConsumerState<PinChangePage> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String title = '';
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(pinChangeProvider);
    ref.listen(pinChangeProvider, (_, state) {
      if (state.hasError) {
        GlobalSnackBar.show(context, state.asError!.error.toString());
        return;
      }
      GlobalSnackBar.show(context, state.asData!.value.message ?? '');
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.pinCahnge,
          style: const TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                OutlinedInputField(
                  bottomPadding: 0,
                  prefix: const Icon(
                    Icons.lock_outline,
                    color: AppColors.black,
                    size: 20,
                  ),
                  fillColor: AppColors.transparent,
                  showBorder: true,
                  controller: _oldPasswordController,
                  hintText: AppLocalizations.of(context)!.currentPin,
                  isPasswordField: true,
                  maxLines: 1,
                  validator: InputFieldValidator.password(),
                ),
                const SizedBox(height: 15),
                OutlinedInputField(
                  bottomPadding: 0,
                  prefix: const Icon(
                    Icons.lock_outline,
                    color: AppColors.black,
                    size: 20,
                  ),
                  controller: _newPasswordController,
                  hintText: AppLocalizations.of(context)!.newPin,
                  fillColor: AppColors.transparent,
                  showBorder: true,
                  isPasswordField: true,
                  maxLines: 1,
                  isEnabled: true,
                  validator: InputFieldValidator.password(),
                ),
                const SizedBox(height: 15),
                OutlinedInputField(
                  bottomPadding: 0,
                  prefix: const Icon(
                    Icons.lock_outline,
                    color: AppColors.black,
                    size: 20,
                  ),
                  fillColor: AppColors.transparent,
                  showBorder: true,
                  controller: _confirmPasswordController,
                  hintText: AppLocalizations.of(context)!.retypeNewPin,
                  isPasswordField: true,
                  maxLines: 1,
                  borderColor: AppColors.primary,
                  validator: InputFieldValidator.confirmPassword(
                    password: _newPasswordController.text,
                    optional: _confirmPasswordController.text.isEmpty,
                  ),
                ),
                const SizedBox(height: 52),
                SizedBox(
                  height: 45,
                  width: 142,
                  child: Button(
                    borderRadius: 33,
                    isLoading:
                        ref.watch(pinChangeProvider) is AsyncLoading<void>,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      ref.watch(pinChangeProvider.notifier).pinChange({
                        'old_password': _oldPasswordController.text,
                        'new_password': _newPasswordController.text,
                        'confirm_new_password': _confirmPasswordController.text,
                      });
                    },
                    label: AppLocalizations.of(context)!.submit,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
