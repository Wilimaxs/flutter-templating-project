import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String? label;
  final String? hint;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool required;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String?)? onChanged;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    required this.name,
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.required = false,
    this.validator,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.textInputAction,
    this.initialValue,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          RichText(
            text: TextSpan(
              text: label!,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: colorScheme.onSurface),
              children: [
                if (required)
                  TextSpan(
                    text: ' *',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: colorScheme.error),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: enabled
                ? colorScheme.surface
                : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            boxShadow: enabled
                ? [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: FormBuilderTextField(
            name: name,
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              contentPadding:
                  contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              fillColor: Colors.transparent,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorScheme.primary,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.outline),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorScheme.error),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorScheme.error,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            obscureText: obscureText,
            readOnly: enabled ? readOnly : true,
            enabled: enabled,
            validator: validator,
            keyboardType: keyboardType,
            onChanged: onChanged,
            textInputAction: textInputAction ?? TextInputAction.done,
          ),
        ),
      ],
    );
  }
}
