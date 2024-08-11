part of '../../../root/presentation/pages/profile_page.dart';

class ProfileUpdatedPage extends ConsumerStatefulWidget {
  const ProfileUpdatedPage({super.key});

  @override
  ConsumerState<ProfileUpdatedPage> createState() => _ProfileUpdatedPageState();
}

class _ProfileUpdatedPageState extends ConsumerState<ProfileUpdatedPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _refController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //  ref.watch(studyLevelClassProvider);
    ref.listen(updateProfileProvider, (_, state) {
      if (state.hasError) {
        GlobalSnackBar.show(context, state.asError!.error.toString());
        return;
      }
      GlobalSnackBar.show(context, 'Profile Updated Successfully');
    });
    ref.watch(userProvider).maybeWhen(
          orElse: () => null,
          data: (data) {
            _nameController.text = data?.name ?? '';
            _institutionController.text = data?.institute ?? '';
            _addressController.text = data?.address ?? '';
            _refController.text = data?.reference ?? '';

            return data;
          },
        );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profileUpdate,
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
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ProfileImageUpdatedSection(),
                    const SizedBox(height: 21),
                    Text(
                      AppLocalizations.of(context)!.updateProfileInfo,
                      style: AppTextStyle.bold20,
                    ),
                    const SizedBox(height: 21),
                    OutlinedInputField(
                      labelText: AppLocalizations.of(context)!.affiliatorName,
                      controller: _nameController,
                      hintText: AppLocalizations.of(context)!.enterYourFullName,
                      validator: InputFieldValidator.name(),
                    ),
                    const SizedBox(height: 38),
                    Text(
                      AppLocalizations.of(context)!.studentInformation,
                      style: AppTextStyle.bold20,
                    ),
                    const SizedBox(height: 20),
                    OutlinedInputField(
                      labelText: AppLocalizations.of(context)!.instituteName,
                      controller: _institutionController,
                      hintText:
                          AppLocalizations.of(context)!.enterinstituteName,
                    ),
                    OutlinedInputField(
                      labelText: AppLocalizations.of(context)!.address,
                      controller: _addressController,
                      hintText: AppLocalizations.of(context)!.enterAddress,
                      validator: InputFieldValidator.name(),
                    ),
                    OutlinedInputField(
                      labelText: AppLocalizations.of(context)!.reference,
                      controller: _refController,
                      hintText: AppLocalizations.of(context)!.enterreference,
                      validator: InputFieldValidator.name(),
                    ),
                    const SizedBox(height: 50),
                    Button(
                      label: AppLocalizations.of(context)!.submit,
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        ref.watch(updateProfileProvider.notifier).updateProfile(
                          {
                            'name': _nameController.text,
                            'institute': _institutionController.text,
                            'address': _addressController.text,
                            'reference': _refController.text,
                          },
                        ).then((value) => userRefresh());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<UserEntity?> userRefresh() async {
    return await ref.refresh(userProvider.future);
  }
}

class ProfileImageUpdatedSection extends ConsumerWidget {
  const ProfileImageUpdatedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageLinkProvider);
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: imageProvider != null
                  ? Image.file(
                      imageProvider,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                    )
                  : Image.asset(
                      Assets.nextiveLogo.path,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 100,
                    ),
            ),
            Positioned(
              right: 30,
              left: 30,
              bottom: 5,
              child: InkWell(
                onTap: () {
                  ref
                      .read(imagePickerProvider.notifier)
                      .pickImage(ImageSource.gallery);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.lighterBlue,
                  ),
                  height: 30,
                  width: 30,
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.primary,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
