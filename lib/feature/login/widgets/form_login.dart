import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:template_flutter/utils/validation/login_validators.dart';
import 'package:template_flutter/utils/widgets/custom_text_field.dart';
import 'package:template_flutter/utils/widgets/primary_button.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.formKey,
    required this.isLoading,
    required this.obscurePassword,
    required this.onTogglePassword,
    required this.onSubmit,
  });

  final GlobalKey<FormBuilderState> formKey;
  final bool isLoading;
  final bool obscurePassword;
  final VoidCallback onTogglePassword;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      color: colorScheme.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomTextField(
                name: 'email',
                label: 'Identitas Peneliti (Surel)',
                hint: 'peneliti.sunda@mythos.id',
                required: true,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                prefixIcon: Icon(Icons.mail_outline),
                validator: FormValidators.email,
              ),
              const SizedBox(height: 14),
              CustomTextField(
                name: 'Password',
                label: 'Kunci Sandi Enkripsi',
                hint: '••••••••••••',
                required: true,
                obscureText: obscurePassword,
                textInputAction: TextInputAction.done,
                prefixIcon: const Icon(Icons.key_outlined),
                suffixIcon: IconButton(
                  tooltip: obscurePassword
                      ? 'Tampilkan kata sandi'
                      : 'Sembunyikan kata sandi',
                  onPressed: onTogglePassword,
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                ),
                validator: FormValidators.password,
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.shield_outlined,
                    color: colorScheme.primary,
                    size: 14,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Koneksi aman ke repositori transkripsi folklor nasional.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'MASUK',
                onPressed: onSubmit,
                isLoading: isLoading,
                height: 44,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
