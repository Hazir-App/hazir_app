part of 'hazir_buttons.dart';

class HazirOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final bool isLoading;
  final String buttonText;
  final Widget? leading;

  const HazirOutlinedButton({Key? key, this.onPressed, this.onLongPress, this.isLoading = false, required this.buttonText, this.leading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
                strokeWidth: 3,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leading != null) ...[
                  leading!,
                  const SizedBox(width: 8),
                ],
                Text(buttonText, style: Theme.of(context).textTheme.button?.copyWith(color: Theme.of(context).colorScheme.primary)),
              ],
            ),
    );
  }
}
