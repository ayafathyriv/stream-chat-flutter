import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

///
class BanUserButton extends StatelessWidget {
  /// {@macro panMessageButton}
  const BanUserButton({
    super.key,
    required this.user,
    required this.onTap,
  });

  /// Indicates whether the pan has failed or not.
  final User? user;

  /// The action (pan the message) to be performed on tap.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
        child: Row(
          children: [
          const Icon(Icons.remove_circle_outline,
              color: Colors.red,
            ),
            const SizedBox(width: 16),
            Text(
              context.translations.toggleBanRetryBanUser(
                userName: user?.name, 
              ),
              style: StreamChatTheme.of(context)
                  .textTheme
                  .body
                  .copyWith(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
