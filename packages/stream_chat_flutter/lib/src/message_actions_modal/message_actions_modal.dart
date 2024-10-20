import 'dart:ui';

import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:stream_chat_flutter/src/message_actions_modal/mam_widgets.dart';
import 'package:stream_chat_flutter/src/message_actions_modal/mark_unread_message_button.dart';
import 'package:stream_chat_flutter/src/message_actions_modal/pan_user_button.dart';
import 'package:stream_chat_flutter/src/message_widget/reactions/reactions_align.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

/// {@template messageActionsModal}
/// Constructs a modal with actions for a message
/// {@endtemplate}
class MessageActionsModal extends StatefulWidget {
  /// {@macro messageActionsModal}
  const MessageActionsModal({
    super.key,
    required this.message,
    required this.messageWidget,
    required this.messageTheme,
    this.showReactionPicker = true,
    this.showDeleteMessage = true,
    this.showEditMessage = true,
    this.onReplyTap,
    this.onConfirmDeleteTap,
    this.onThreadReplyTap,
    this.showCopyMessage = true,
    this.showReplyMessage = true,
    this.showResendMessage = true,
    this.showThreadReplyMessage = true,
    this.showMarkUnreadMessage = true,
    this.showFlagButton = true,
    this.showPinButton = true,
    this.editMessageInputBuilder,
    this.reverse = false,
    this.customActions = const [],
    this.onCopyTap,
    this.showBanUser = true,
  });

  /// Widget that shows the message
  final Widget messageWidget;

  /// Builder for edit message
  final EditMessageInputBuilder? editMessageInputBuilder;

  /// The action to perform when "thread reply" is tapped
  final OnMessageTap? onThreadReplyTap;

  /// The action to perform when "reply" is tapped
  final OnMessageTap? onReplyTap;

  /// The action to perform when delete confirmation button is tapped.
  final Future<void> Function(Message)? onConfirmDeleteTap;

  /// Message in focus for actions
  final Message message;

  /// [StreamMessageThemeData] for message
  final StreamMessageThemeData messageTheme;

  /// Flag for showing reaction picker.
  final bool showReactionPicker;

  /// Callback when copy is tapped
  final OnMessageTap? onCopyTap;

  /// Callback when delete is tapped
  final bool showDeleteMessage;

  /// Flag for showing copy action
  final bool showCopyMessage;

  /// Flag for showing edit action
  final bool showEditMessage;

  /// Flag for showing resend action
  final bool showResendMessage;

  /// Flag for showing mark unread action
  final bool showMarkUnreadMessage;

  /// Flag for showing reply action
  final bool showReplyMessage;

  /// Flag for showing thread reply action
  final bool showThreadReplyMessage;

  /// Flag for showing flag action
  final bool showFlagButton;

  /// Flag for showing pin action
  final bool showPinButton;

  /// Flag for showing pan
  final bool showBanUser;

  /// Flag for reversing message
  final bool reverse;

  /// List of custom actions
  final List<StreamMessageAction> customActions;

  @override
  _MessageActionsModalState createState() => _MessageActionsModalState();
}

class _MessageActionsModalState extends State<MessageActionsModal> {
  bool _showActions = true;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final user = StreamChat.of(context).currentUser;
    final orientation = mediaQueryData.orientation;

    final _userPermissions = StreamChannel.of(context).channel.ownCapabilities;
    final hasReactionPermission = _userPermissions.contains(PermissionType.sendReaction);

    final fontSize = widget.messageTheme.messageTextStyle?.fontSize;
    final streamChatThemeData = StreamChatTheme.of(context);

    final channel = StreamChannel.of(context).channel;

    final child = Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (widget.showReactionPicker && hasReactionPermission)
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return Align(
                        alignment: Alignment(
                          calculateReactionsHorizontalAlignment(
                            user,
                            widget.message,
                            constraints,
                            fontSize,
                            orientation,
                          ),
                          0,
                        ),
                        child: StreamReactionPicker(
                          message: widget.message,
                        ),
                      );
                    },
                  ),
                const SizedBox(height: 10),
                IgnorePointer(
                  child: widget.messageWidget,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: widget.reverse ? 0 : 40,
                  ),
                  child: SizedBox(
                    width: mediaQueryData.size.width * 0.75,
                    child: Material(
                      color: streamChatThemeData.colorTheme.appBg,
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (widget.showReplyMessage && widget.message.state.isCompleted)
                            ReplyButton(
                              onTap: () {
                                Navigator.of(context).pop();
                                if (widget.onReplyTap != null) {
                                  widget.onReplyTap?.call(widget.message);
                                }
                              },
                            ),
                          if (widget.showThreadReplyMessage &&
                              (widget.message.state.isCompleted) &&
                              widget.message.parentId == null)
                            ThreadReplyButton(
                              message: widget.message,
                              onThreadReplyTap: widget.onThreadReplyTap,
                            ),
                          if (widget.showMarkUnreadMessage)
                            MarkUnreadMessageButton(onTap: () async {
                              try {
                                await channel.markUnread(widget.message.id);
                              } catch (ex) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      context.translations.markUnreadError,
                                    ),
                                  ),
                                );
                              }

                              Navigator.of(context).pop();
                            }),
                          if (widget.showResendMessage)
                            ResendMessageButton(
                              message: widget.message,
                              channel: channel,
                            ),
                          // if (widget.showEditMessage)
                          //   EditMessageButton(
                          //     onTap: () {
                          //       Navigator.of(context).pop();
                          //       _showEditBottomSheet(context);
                          //     },
                          //   ),
                          if (widget.showCopyMessage)
                            CopyMessageButton(
                              onTap: () {
                                widget.onCopyTap?.call(widget.message);
                                Navigator.of(context).pop();
                              },
                            ),
                          if (widget.showFlagButton)
                            FlagMessageButton(
                              onTap: _showFlagDialog,
                            ),
                          if (widget.showPinButton)
                            PinMessageButton(
                              onTap: _togglePin,
                              pinned: widget.message.pinned,
                            ),
                          if (widget.showDeleteMessage)
                            DeleteMessageButton(
                              isDeleteFailed: widget.message.state.isDeletingFailed,
                              onTap: _showDeleteBottomSheet,
                            ),
                          ...widget.customActions.map((action) => _buildCustomAction(
                                context,
                                action,
                              )),
                          // if (widget.showBanUser && widget.message.user != null)
                          //   BanUserButton(
                          //     onTap: _showBanBottomSheet,
                          //     user: widget.message.user,
                          //   )
                        ].insertBetween(
                          Container(
                            height: 1,
                            color: streamChatThemeData.colorTheme.borders,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Navigator.of(context).maybePop(),
      child: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: ColoredBox(
                color: streamChatThemeData.colorTheme.overlay,
              ),
            ),
          ),
          if (_showActions)
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutBack,
              builder: (context, val, child) => Transform.scale(
                scale: val,
                child: child,
              ),
              child: child,
            ),
        ],
      ),
    );
  }

  InkWell _buildCustomAction(
    BuildContext context,
    StreamMessageAction messageAction,
  ) {
    return InkWell(
      onTap: () => messageAction.onTap?.call(widget.message),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
        child: Row(
          children: [
            messageAction.leading ?? const Offstage(),
            const SizedBox(width: 16),
            messageAction.title ?? const Offstage(),
          ],
        ),
      ),
    );
  }

  Future<void> _showFlagDialog() async {
    final client = StreamChat.of(context).client;

    final streamChatThemeData = StreamChatTheme.of(context);
    final answer = await showConfirmationBottomSheet(
      context,
      title: context.translations.flagMessageLabel,
      icon: StreamSvgIcon.flag(
        color: streamChatThemeData.colorTheme.accentError,
        size: 24,
      ),
      question: context.translations.flagMessageQuestion,
      okText: context.translations.flagLabel,
      cancelText: context.translations.cancelLabel,
    );

    final theme = streamChatThemeData;
    if (answer == true) {
      try {
        await client.flagMessage(widget.message.id);
        await showInfoBottomSheet(
          context,
          icon: StreamSvgIcon.flag(
            color: theme.colorTheme.accentError,
            size: 24,
          ),
          details: context.translations.flagMessageSuccessfulText,
          title: context.translations.flagMessageSuccessfulLabel,
          okText: context.translations.okLabel,
        );
      } catch (err) {
        if (err is StreamChatNetworkError && err.errorCode == ChatErrorCode.inputError) {
          await showInfoBottomSheet(
            context,
            icon: StreamSvgIcon.flag(
              color: theme.colorTheme.accentError,
              size: 24,
            ),
            details: context.translations.flagMessageSuccessfulText,
            title: context.translations.flagMessageSuccessfulLabel,
            okText: context.translations.okLabel,
          );
        } else {
          _showErrorAlertBottomSheet();
        }
      }
    }
  }

  Future<void> _togglePin() async {
    final channel = StreamChannel.of(context).channel;

    Navigator.of(context).pop();
    try {
      if (!widget.message.pinned) {
        await channel.pinMessage(widget.message);
      } else {
        await channel.unpinMessage(widget.message);
      }
    } catch (e) {
      _showErrorAlertBottomSheet();
    }
  }

  /// Shows a "Ban user" bottom sheet on mobile platforms.
  Future<void> _showBanBottomSheet() async {
    setState(() => _showActions = false);
    final answer = await showConfirmationBottomSheet(
      context,
      title: context.translations.banUserLabel,
      icon: StreamSvgIcon.flag(
        color: StreamChatTheme.of(context).colorTheme.accentError,
        size: 24,
      ),
      question: context.translations.banUserQuestion,
      okText: context.translations.banLabel,
      cancelText: context.translations.cancelLabel,
    );

    if (answer == true) {
      try {
        Navigator.of(context).pop();
        // final onConfirmBanTap = widget.onConfirmBanTap;
        // if (onConfirmBanTap != null) {
        //   await onConfirmBanTap(widget.message.user);
        // } else {
        await StreamChannel.of(context).channel.banMember(widget.message.user!.id, {});
        // }
      } catch (err) {
        _showErrorAlertBottomSheet();
      }
    } else {
      setState(() => _showActions = true);
    }
  }

  /// Shows a "delete message" bottom sheet on mobile platforms.
  Future<void> _showDeleteBottomSheet() async {
    setState(() => _showActions = false);
    final answer = await showConfirmationBottomSheet(
      context,
      title: context.translations.deleteMessageLabel,
      icon: StreamSvgIcon.flag(
        color: StreamChatTheme.of(context).colorTheme.accentError,
        size: 24,
      ),
      question: context.translations.deleteMessageQuestion,
      okText: context.translations.deleteLabel,
      cancelText: context.translations.cancelLabel,
    );

    if (answer == true) {
      try {
        Navigator.of(context).pop();
        final onConfirmDeleteTap = widget.onConfirmDeleteTap;
        if (onConfirmDeleteTap != null) {
          await onConfirmDeleteTap(widget.message);
        } else {
          await StreamChannel.of(context).channel.deleteMessage(widget.message);
        }
      } catch (err) {
        _showErrorAlertBottomSheet();
      }
    } else {
      setState(() => _showActions = true);
    }
  }

  void _showErrorAlertBottomSheet() {
    showInfoBottomSheet(
      context,
      icon: StreamSvgIcon.error(
        color: StreamChatTheme.of(context).colorTheme.accentError,
        size: 24,
      ),
      details: context.translations.operationCouldNotBeCompletedText,
      title: context.translations.somethingWentWrongError,
      okText: context.translations.okLabel,
    );
  }

  void _showEditBottomSheet(BuildContext context) {
    final channel = StreamChannel.of(context).channel;
    showModalBottomSheet(
      context: context,
      elevation: 2,
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      backgroundColor: StreamMessageInputTheme.of(context).inputBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => EditMessageSheet(
        channel: channel,
        message: widget.message,
        editMessageInputBuilder: widget.editMessageInputBuilder,
      ),
    );
  }
}
