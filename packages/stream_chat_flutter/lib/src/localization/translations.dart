import 'package:jiffy/jiffy.dart';
import 'package:stream_chat_flutter/src/message_list_view/message_list_view.dart';
import 'package:stream_chat_flutter/src/misc/connection_status_builder.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart' show User;

/// Translation strings for the stream chat widgets
abstract class Translations {
  /// The error shown when [launchURL] fails
  String get launchUrlError;

  /// The error shown when loading users fails
  String get loadingUsersError;

  /// The label for "retry" button
  String get retryLabel;

  /// The label for showing no users
  String get noUsersLabel;

  /// The label for showing no photo or video
  String get noPhotoOrVideoLabel;

  /// The text for showing user is online
  String get userOnlineText;

  /// The text for showing the last online of the user
  String get userLastOnlineText;

  /// The text shown when [users] starts typing
  String userTypingText(Iterable<User> users);

  /// The label for "thread reply"
  String get threadReplyLabel;

  /// The text for showing if the message is only visible to you
  String get onlyVisibleToYouText;

  /// The text for showing the thread reply count
  String threadReplyCountText(int count);

  /// The text for showing the attachments upload progress
  String attachmentsUploadProgressText({
    required int remaining,
    required int total,
  });

  /// The text for showing who pinned the message
  String pinnedByUserText({
    required User pinnedBy,
    required User currentUser,
  });

  /// The text for showing there are empty messages
  String get emptyMessagesText;

  /// The text for showing generic error
  String get genericErrorText;

  /// The error shown when loading messages fails
  String get loadingMessagesError;

  /// The text for showing the result count in [StreamMessageSearchListView]
  String resultCountText(int count);

  /// The text for showing the message is deleted
  String get messageDeletedText;

  /// The label for message deleted
  String get messageDeletedLabel;

  /// The label for message reactions
  String get messageReactionsLabel;

  /// The text for showing there are no chats
  String get emptyChatMessagesText;

  /// The text for showing the thread separator in case [StreamMessageListView]
  /// contains a parent message
  String threadSeparatorText(int replyCount);

  /// The text for showing the unread messages count
  /// in the [StreamMessageListView]
  String unreadMessagesSeparatorText();

  /// The label for "connected" in [StreamConnectionStatusBuilder]
  String get connectedLabel;

  /// The label for "disconnected" in [StreamConnectionStatusBuilder]
  String get disconnectedLabel;

  /// The label for "reconnecting" in [StreamConnectionStatusBuilder]
  String get reconnectingLabel;

  /// The label for also send
  /// as direct message "checkbox"" in [StreamMessageInput]
  String get alsoSendAsDirectMessageLabel;

  /// The label for search Gif
  String get searchGifLabel;

  /// The label for the MessageInput hint when permission denied on sendMessage
  String get sendMessagePermissionError;

  /// The label for add a comment or send in case of
  /// attachments inside [StreamMessageInput]
  String get addACommentOrSendLabel;

  /// The label for write a message in [StreamMessageInput]
  String get writeAMessageLabel;

  /// The label for slow mode enabled in [StreamMessageInput]
  String get slowModeOnLabel;

  /// The label for instant commands in [StreamMessageInput]
  String get instantCommandsLabel;

  /// The error shown in case the file is too large even after compression
  /// while uploading via [StreamMessageInput]
  String fileTooLargeAfterCompressionError(double limitInMB);

  /// The error shown in case the file is too large
  /// while uploading via [StreamMessageInput]
  String fileTooLargeError(double limitInMB);

  /// The error shown when the file being read has no bytes
  String get couldNotReadBytesFromFileError;

  /// The label for "add a file"
  String get addAFileLabel;

  /// The label for "upload a photo"
  String get uploadAPhotoLabel;

  /// The label for "upload a video"
  String get uploadAVideoLabel;

  /// The label for "photo from camera"
  String get photoFromCameraLabel;

  /// The label for "video from camera"
  String get videoFromCameraLabel;

  /// The label for "upload a file"
  String get uploadAFileLabel;

  /// The error shown when something went wrong
  String get somethingWentWrongError;

  /// The label for "OK"
  String get okLabel;

  /// The label for a link disabled error
  String get linkDisabledError;

  /// The additional info on a link disabled error
  String get linkDisabledDetails;

  /// The label for "add more files"
  String get addMoreFilesLabel;

  /// The message shown for asking photo and video access permission
  String get enablePhotoAndVideoAccessMessage;

  /// The message shown for asking photo and video access permission
  String get enableFileAccessMessage;

  /// The message shown for asking gallery access permission
  String get allowGalleryAccessMessage;

  /// The message shown for asking file access permission
  String get allowFileAccessMessage;

  /// The label for "flag message"
  String get flagMessageLabel;

  /// The question asked while showing flag message dialog
  String get flagMessageQuestion;

  /// The label for "Flag"
  String get flagLabel;

  /// The label for "Cancel"
  String get cancelLabel;

  /// The label for successful message flag
  String get flagMessageSuccessfulLabel;

  /// The text for showing the message if successfully flagged
  String get flagMessageSuccessfulText;

  /// The label for "delete message"
  String get deleteMessageLabel;

  ///
  String get banUserLabel;

  /// The question asked while showing delete message dialog
  String get deleteMessageQuestion;

  ///
  String get banUserQuestion;

  ///
  String get banLabel;

  /// The label for "Delete"
  String get deleteLabel;

  /// The text for showing the operation could not be completed
  String get operationCouldNotBeCompletedText;

  /// The label for "Reply"
  String get replyLabel;

  /// The text for showing pin/un-pin functionality in [MessageWidget]
  /// based on [pinned]
  String togglePinUnpinText({required bool pinned});

  /// The text for marking message as unread functionality in [MessageWidget]
  String get markAsUnreadLabel;

  /// The text for unread count indicator
  String unreadCountIndicatorLabel({required int unreadCount});

  /// The text of an error shown when marking a message as unread fails
  String get markUnreadError;

  /// The text for showing delete/retry-delete based on [isDeleteFailed]
  String toggleDeleteRetryDeleteMessageText({required bool isDeleteFailed});

  /// The text for showing ban
  String toggleBanRetryBanUser({String? userName});

  /// The label for "copy message"
  String get copyMessageLabel;

  /// The label for "edit message"
  String get editMessageLabel;

  /// The text for showing resend/resend-edited message
  /// based on [isUpdateFailed]
  String toggleResendOrResendEditedMessage({required bool isUpdateFailed});

  /// The label for "Photos"
  String get photosLabel;

  /// The text for showing on which [date] and [time] the message was sent
  String sentAtText({required DateTime date, required DateTime time});

  /// The label for "Today"
  String get todayLabel;

  /// The label for "Yesterday"
  String get yesterdayLabel;

  /// The text for showing the channel is muted
  String get channelIsMutedText;

  /// The text for showing there is no title
  String get noTitleText;

  /// The label for "let's start chatting"
  String get letsStartChattingLabel;

  /// The label for sending the first message
  String get sendingFirstMessageLabel;

  /// The label for "start a chat"
  String get startAChatLabel;

  /// The error shown when loading channel fails
  String get loadingChannelsError;

  /// The label for "Delete conversation"
  String get deleteConversationLabel;

  /// The question asked while showing delete conversation dialog
  String get deleteConversationQuestion;

  /// The label for "Stream Chat"
  String get streamChatLabel;

  /// The text for showing searching for network
  String get searchingForNetworkText;

  /// The label for "Offline"
  String get offlineLabel;

  /// The label for "Try again"
  String get tryAgainLabel;

  /// The text for showing the members count based on [count]
  String membersCountText(int count);

  /// The text for showing the watchers count based on [count]
  String watchersCountText(int count);

  /// The label for "View Info"
  String get viewInfoLabel;

  /// The label for "Leave Group"
  String get leaveGroupLabel;

  /// The label for "Leave"
  String get leaveLabel;

  /// The label for "Leave conversation"
  String get leaveConversationLabel;

  /// The question asked while showing leave conversation dialog
  String get leaveConversationQuestion;

  /// The label for "Show in chat"
  String get showInChatLabel;

  /// The label for "Save Image"
  String get saveImageLabel;

  /// The label for "Save Video"
  String get saveVideoLabel;

  /// The label for "Upload Error"
  String get uploadErrorLabel;

  /// The label for "Giphy"
  String get giphyLabel;

  /// The label for "Shuffle"
  String get shuffleLabel;

  /// The label for "Send"
  String get sendLabel;

  /// The label for "With"
  String get withText;

  /// The text shown for "In"
  String get inText;

  /// The text shown for "You"
  String get youText;

  /// Gallery footer pagination text
  String galleryPaginationText({
    required int currentPage,
    required int totalPages,
  });

  /// The text shown for "File"
  String get fileText;

  /// The label for "Reply to message"
  String get replyToMessageLabel;

  /// The label for "View library"
  String get viewLibrary;

  /// Label for "Attachment limit exceeded:
  /// it's not possible to add more than $limit attachments"
  String attachmentLimitExceedError(int limit);

  /// The label for "Download"
  String get downloadLabel;

  /// The text for "Mute Group"/"Unmute Group" based on the value of [isMuted].
  String toggleMuteUnmuteGroupText({required bool isMuted});

  /// The text for "Mute User"/"Unmute User" based on the value of [isMuted].
  String toggleMuteUnmuteUserText({required bool isMuted});

  /// The text for "Are you sure you want to mute this group?"/"Are you sure you want to unmute this group?"
  /// based on the value of [isMuted].
  String toggleMuteUnmuteGroupQuestion({required bool isMuted});

  /// The text for "Are you sure you want to mute this user?"/"Are you sure you want to unmute this user?"
  /// based on the value of [isMuted].
  String toggleMuteUnmuteUserQuestion({required bool isMuted});

  /// The text for "MUTE"/"UNMUTE" based on the value of [isMuted].
  String toggleMuteUnmuteAction({required bool isMuted});
}

/// Default implementation of Translation strings for the stream chat widgets
class DefaultTranslations implements Translations {
  const DefaultTranslations._();

  /// Singleton instance of [DefaultTranslations]
  static const instance = DefaultTranslations._();

  @override
  String get launchUrlError => 'Cannot launch the url';

  @override
  String get loadingUsersError => 'Error loading users';

  @override
  String get noUsersLabel => 'There are no users currently';

  @override
  String get noPhotoOrVideoLabel => 'There is no photo or video';

  @override
  String get retryLabel => 'Retry';

  @override
  String get userLastOnlineText => 'Last online';

  @override
  String get userOnlineText => 'Online';

  @override
  String userTypingText(Iterable<User> users) {
    if (users.isEmpty) return '';
    final first = users.first;
    if (users.length == 1) {
      return '${first.name} is typing';
    }
    return '${first.name} and ${users.length - 1} more are typing';
  }

  @override
  String get threadReplyLabel => 'Thread Reply';

  @override
  String get onlyVisibleToYouText => 'Only visible to you';

  @override
  String threadReplyCountText(int count) => '$count Thread Replies';

  @override
  String attachmentsUploadProgressText({
    required int remaining,
    required int total,
  }) =>
      'Uploading $remaining/$total ...';

  @override
  String pinnedByUserText({
    required User pinnedBy,
    required User currentUser,
  }) {
    final pinnedByCurrentUser = currentUser.id == pinnedBy.id;
    if (pinnedByCurrentUser) return 'Pinned by You';
    return 'Pinned by ${pinnedBy.name}';
  }

  @override
  String get sendMessagePermissionError => "You don't have permission to send messages";

  @override
  String get emptyMessagesText => 'There are no messages currently';

  @override
  String get genericErrorText => 'Something went wrong';

  @override
  String get loadingMessagesError => 'Error loading messages';

  @override
  String resultCountText(int count) => '$count results';

  @override
  String get messageDeletedText => 'This message is deleted.';

  @override
  String get messageDeletedLabel => 'Message deleted';

  @override
  String get messageReactionsLabel => 'Message Reactions';

  @override
  String get emptyChatMessagesText => 'No chats here yet...';

  @override
  String threadSeparatorText(int replyCount) {
    if (replyCount == 1) return '1 Reply';
    return '$replyCount Replies';
  }

  @override
  String get connectedLabel => 'Connected';

  @override
  String get disconnectedLabel => 'Disconnected';

  @override
  String get reconnectingLabel => 'Reconnecting...';

  @override
  String get alsoSendAsDirectMessageLabel => 'Also send as direct message';

  @override
  String get addACommentOrSendLabel => 'Add a comment or send';

  @override
  String get searchGifLabel => 'Search GIFs';

  @override
  String get writeAMessageLabel => 'Write a message';

  @override
  String get instantCommandsLabel => 'Instant Commands';

  @override
  String fileTooLargeAfterCompressionError(double limitInMB) => 'The file is too large to upload. '
      'The file size limit is $limitInMB MB. '
      'We tried compressing it, but it was not enough.';

  @override
  String fileTooLargeError(double limitInMB) =>
      'The file is too large to upload. The file size limit is $limitInMB MB.';

  @override
  String get couldNotReadBytesFromFileError => 'Could not read bytes from file.';

  @override
  String get addAFileLabel => 'Add a file';

  @override
  String get photoFromCameraLabel => 'Photo from camera';

  @override
  String get uploadAFileLabel => 'Upload a file';

  @override
  String get uploadAPhotoLabel => 'Upload a photo';

  @override
  String get uploadAVideoLabel => 'Upload a video';

  @override
  String get videoFromCameraLabel => 'Video from camera';

  @override
  String get okLabel => 'OK';

  @override
  String get somethingWentWrongError => 'Something went wrong';

  @override
  String get addMoreFilesLabel => 'Add more files';

  @override
  String get enablePhotoAndVideoAccessMessage => 'Please enable access to your photos'
      '\nand videos so you can share them with friends.';

  @override
  String get allowGalleryAccessMessage => 'Allow access to your gallery';

  @override
  String get flagMessageLabel => 'Flag Message';

  @override
  String get flagMessageQuestion => 'Do you want to send a copy of this message to a'
      '\nmoderator for further investigation?';

  @override
  String get flagLabel => 'FLAG';

  @override
  String get cancelLabel => 'CANCEL';

  @override
  String get flagMessageSuccessfulLabel => 'Message flagged';

  @override
  String get flagMessageSuccessfulText => 'The message has been reported to a moderator.';

  @override
  String get deleteLabel => 'DELETE';

  @override
  String get deleteMessageLabel => 'Delete Message';

  @override
  String get banUserLabel => 'Ban User';

  @override
  String get deleteMessageQuestion => 'Are you sure you want to permanently delete this\nmessage?';

  @override
  String get banUserQuestion => 'Are you sure you want to permanently ban this\nuser?';

  @override
  String get banLabel => 'Ban';

  @override
  String get operationCouldNotBeCompletedText => "The operation couldn't be completed.";

  @override
  String get replyLabel => 'Reply';

  @override
  String togglePinUnpinText({required bool pinned}) {
    if (pinned) return 'Unpin from Conversation';
    return 'Pin to Conversation';
  }

  @override
  String get markAsUnreadLabel => 'Mark as Unread';

  @override
  String unreadCountIndicatorLabel({required int unreadCount}) {
    return '$unreadCount unread';
  }

  @override
  String toggleDeleteRetryDeleteMessageText({required bool isDeleteFailed}) {
    if (isDeleteFailed) return 'Retry Deleting Message';
    return 'Delete Message';
  }

  @override
  String get copyMessageLabel => 'Copy Message';

  @override
  String get editMessageLabel => 'Edit Message';

  @override
  String toggleResendOrResendEditedMessage({required bool isUpdateFailed}) {
    if (isUpdateFailed) return 'Resend Edited Message';
    return 'Resend';
  }

  @override
  String get photosLabel => 'Photos';

  String _getDay(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final date = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (date == today) {
      return 'today';
    } else if (date == yesterday) {
      return 'yesterday';
    } else {
      Jiffy.setLocale('en');
      return 'on ${Jiffy.parseFromDateTime(date).MMMd}';
    }
  }

  @override
  String sentAtText({required DateTime date, required DateTime time}) {
    Jiffy.setLocale('en');
    final atTime = Jiffy.parseFromDateTime(time.toLocal());
    return 'Sent ${_getDay(date)} at ${atTime.jm}';
  }

  @override
  String get todayLabel => 'Today';

  @override
  String get yesterdayLabel => 'Yesterday';

  @override
  String get channelIsMutedText => 'Channel is muted';

  @override
  String get noTitleText => 'No title';

  @override
  String get letsStartChattingLabel => 'Let’s start chatting!';

  @override
  String get sendingFirstMessageLabel => 'How about sending your first message to a friend?';

  @override
  String get startAChatLabel => 'Start a chat';

  @override
  String get loadingChannelsError => 'Error loading channels';

  @override
  String get deleteConversationLabel => 'Delete Conversation';

  @override
  String get deleteConversationQuestion => 'Are you sure you want to delete this conversation?';

  @override
  String get streamChatLabel => 'Stream Chat';

  @override
  String get searchingForNetworkText => 'Searching for Network';

  @override
  String get offlineLabel => 'Offline...';

  @override
  String get tryAgainLabel => 'Try Again';

  @override
  String membersCountText(int count) {
    if (count == 1) return '1 Member';
    return '$count Members';
  }

  @override
  String watchersCountText(int count) {
    if (count == 1) return '1 Online';
    return '$count Online';
  }

  @override
  String get viewInfoLabel => 'View Info';

  @override
  String get leaveGroupLabel => 'Leave Group';

  @override
  String get leaveLabel => 'LEAVE';

  @override
  String get leaveConversationLabel => 'Leave conversation';

  @override
  String get leaveConversationQuestion => 'Are you sure you want to leave this conversation?';

  @override
  String get showInChatLabel => 'Show in Chat';

  @override
  String get saveImageLabel => 'Save Image';

  @override
  String get saveVideoLabel => 'Save Video';

  @override
  String get uploadErrorLabel => 'UPLOAD ERROR';

  @override
  String get giphyLabel => 'Giphy';

  @override
  String get shuffleLabel => 'Shuffle';

  @override
  String get sendLabel => 'Send';

  @override
  String get withText => 'with';

  @override
  String get inText => 'in';

  @override
  String get youText => 'You';

  @override
  String galleryPaginationText({
    required int currentPage,
    required int totalPages,
  }) =>
      '${currentPage + 1} of $totalPages';

  @override
  String get fileText => 'File';

  @override
  String get replyToMessageLabel => 'Reply to Message';

  @override
  String get slowModeOnLabel => 'Slow mode ON';

  @override
  String get viewLibrary => 'View library';

  @override
  String attachmentLimitExceedError(int limit) => """
Attachment limit exceeded: it's not possible to add more than $limit attachments""";

  @override
  String get downloadLabel => 'Download';

  @override
  String toggleMuteUnmuteUserText({required bool isMuted}) {
    if (isMuted) {
      return 'Unmute User';
    } else {
      return 'Mute User';
    }
  }

  @override
  String toggleMuteUnmuteGroupQuestion({required bool isMuted}) {
    if (isMuted) {
      return 'Are you sure you want to unmute this group?';
    } else {
      return 'Are you sure you want to mute this group?';
    }
  }

  @override
  String toggleMuteUnmuteUserQuestion({required bool isMuted}) {
    if (isMuted) {
      return 'Are you sure you want to unmute this user?';
    } else {
      return 'Are you sure you want to mute this user?';
    }
  }

  @override
  String toggleMuteUnmuteAction({required bool isMuted}) {
    if (isMuted) {
      return 'UNMUTE';
    } else {
      return 'MUTE';
    }
  }

  @override
  String toggleMuteUnmuteGroupText({required bool isMuted}) {
    if (isMuted) {
      return 'Unmute Group';
    } else {
      return 'Mute Group';
    }
  }

  @override
  String get linkDisabledDetails => 'Sending links is not allowed in this conversation.';

  @override
  String get linkDisabledError => 'Links are disabled';

  @override
  String unreadMessagesSeparatorText() => 'New messages';

  @override
  String get enableFileAccessMessage => 'Please enable access to files'
      '\nso you can share them with friends.';

  @override
  String get allowFileAccessMessage => 'Allow access to files';

  @override
  String get markUnreadError => 'Error marking message unread. Cannot mark unread messages older than the'
      ' newest 100 channel messages.';

  @override
  String toggleBanRetryBanUser({String? userName}) {
    return 'Ban ${userName ?? 'User'}';
  }
}

/// Arabic implementation of Translation strings for the stream chat widgets
class ArabicTranslation implements Translations {
  const ArabicTranslation._();

  /// Singleton instance of [ArabicTranslation]
  static const instance = ArabicTranslation._();

  @override
  String get launchUrlError => 'لا أستطيع إطلاق الرابط';

  @override
  String get loadingUsersError => 'لا يمكن تحميل المستخدمين';

  @override
  String get noUsersLabel => 'لا يوجد مستخدمين';

  @override
  String get noPhotoOrVideoLabel => 'لا يوجد صورة او فيديو';

  @override
  String get retryLabel => 'اعادة المحاولة';

  @override
  String get userLastOnlineText => 'اخر ظهور';

  @override
  String get userOnlineText => 'متصل';

  @override
  String userTypingText(Iterable<User> users) {
    if (users.isEmpty) return '';
    final first = users.first;
    if (users.length == 1) {
      return '${first.name} يكتب';
    }
    return '${first.name} و ${users.length - 1} مزيد من يكتب';
  }

  @override
  String get threadReplyLabel => 'الرد على المحادثة';

  @override
  String get onlyVisibleToYouText => 'تظهر فقط لك';

  @override
  String threadReplyCountText(int count) => '$count ردود المحادثة';

  @override
  String attachmentsUploadProgressText({
    required int remaining,
    required int total,
  }) =>
      'يتم تحميل $remaining/$total ...';

  @override
  String pinnedByUserText({
    required User pinnedBy,
    required User currentUser,
  }) {
    final pinnedByCurrentUser = currentUser.id == pinnedBy.id;
    if (pinnedByCurrentUser) return 'تم تثبيته بواسطةك';
    return 'تم تثبيته بواسطة ${pinnedBy.name}';
  }

  @override
  String get sendMessagePermissionError => 'لا يمكنك ارسال رسالة لأي مستخدم مشترك';

  @override
  String get emptyMessagesText => 'لا يوجد رسائل';

  @override
  String get genericErrorText => 'حدث خطأ ما';

  @override
  String get loadingMessagesError => 'حدث خطأ في تحميل رسائل';

  @override
  String resultCountText(int count) => '$count نتائج';

  @override
  String get messageDeletedText => 'تم حذف هذه الرسالة';

  @override
  String get messageDeletedLabel => 'رسالة محذوفة';

  @override
  String get messageReactionsLabel => 'تفاعلات الرسائل';

  @override
  String get emptyChatMessagesText => 'لا يوجد رسائل في هذه المحادثة';

  @override
  String threadSeparatorText(int replyCount) {
    if (replyCount == 1) return '1 رد';
    return '$replyCount ردود';
  }

  @override
  String get connectedLabel => 'متصل';

  @override
  String get disconnectedLabel => 'غير متصل';

  @override
  String get reconnectingLabel => 'جاري اعادة الاتصال...';

  @override
  String get alsoSendAsDirectMessageLabel => 'أرسل أيضًا كرسالة مباشرة';

  @override
  String get addACommentOrSendLabel => 'أضف تعليقًا أو أرسل';

  @override
  String get searchGifLabel => 'أبحث عن GIF';

  @override
  String get writeAMessageLabel => 'اكتب رسالتك';

  @override
  String get instantCommandsLabel => 'الاوامر الفورية';

  @override
  String fileTooLargeAfterCompressionError(double limitInMB) => 'الملف كبير جدًا ولا يمكن تحميله'
      ' الحد الأعلى للملف هو $limitInMB ميجا. '
      'حاولنا ضغطه، ولكن لم يكن ذلك كافياً';

  @override
  String fileTooLargeError(double limitInMB) =>
      'The file is too large to upload. The file size limit is $limitInMB ميجا.';

  @override
  String get couldNotReadBytesFromFileError => 'لا يمكنك تحميل البيانات من هذا الملف';

  @override
  String get addAFileLabel => 'إضف ملفًا';

  @override
  String get photoFromCameraLabel => 'صورة من الكاميرا';

  @override
  String get uploadAFileLabel => 'حمل ملف';

  @override
  String get uploadAPhotoLabel => 'حمل صورة';

  @override
  String get uploadAVideoLabel => 'حمل فيديو';

  @override
  String get videoFromCameraLabel => 'فيديو من الكاميرا';

  @override
  String get okLabel => 'موافق';

  @override
  String get somethingWentWrongError => 'حدث خطأ ما';

  @override
  String get addMoreFilesLabel => 'إضف المزيد من الملفات';

  @override
  String get enablePhotoAndVideoAccessMessage =>
      'يرجى تمكين الوصول إلى صورك وفيديوهاتك حتى تتمكن من مشاركتها مع الأصدقاء.';
  @override
  String get allowGalleryAccessMessage => 'الرجاء تمكين الوصول إلى صورك';

  @override
  String get flagMessageLabel => 'إبلاغ عن رسالة';

  @override
  String get flagMessageQuestion => 'هل ترغب في إرسال نسخة من هذه الرسالة إلى'
      '\nمشرف للتحقيق في الأمر؟';

  @override
  String get flagLabel => 'إبلاغ';

  @override
  String get cancelLabel => 'الغاء';

  @override
  String get flagMessageSuccessfulLabel => 'تم الإبلاغ بنجاح';

  @override
  String get flagMessageSuccessfulText => 'تم الإبلاغ عن الرسالة إلى المشرف.';

  @override
  String get deleteLabel => 'حذف';

  @override
  String get deleteMessageLabel => 'حذف رسالة';

  @override
  String get banUserLabel => 'حظر المستخدم';

  @override
  String get deleteMessageQuestion => 'هل ترغب في حذف هذه الرسالة؟';

  @override
  String get banUserQuestion => 'هل ترغب في حظر هذا المستخدم؟';

    @override
  String get banLabel => 'حظر';

  @override
  String get operationCouldNotBeCompletedText => "لا يمكن حذف هذه الرسالة";

  @override
  String get replyLabel => 'رد';

  @override
  String togglePinUnpinText({required bool pinned}) {
    if (pinned) return 'إلغاء تثبيت من المحادثة';
    return 'تثبيت في المحادثة';
  }

  @override
  String get markAsUnreadLabel => 'تحديد كغير مقروء';

  @override
  String unreadCountIndicatorLabel({required int unreadCount}) {
    return '$unreadCount غير مقروء';
  }

  @override
  String toggleDeleteRetryDeleteMessageText({required bool isDeleteFailed}) {
    if (isDeleteFailed) return 'إعادة محاولة حذف الرسالة';
    return 'حذف الرسالة';
  }

  @override
  String toggleBanRetryBanUser({String? userName}) {
    return 'حظر ${userName ?? 'المستخدم'}';
  }

  @override
  String get copyMessageLabel => 'نسخ الرسالة';

  @override
  String get editMessageLabel => 'تعديل الرسالة';

  @override
  String toggleResendOrResendEditedMessage({required bool isUpdateFailed}) {
    if (isUpdateFailed) return 'إعادة إرسال الرسالة المعدلة';
    return 'إرسال';
  }

  @override
  String get photosLabel => 'صور';

  String _getDay(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final date = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (date == today) {
      return 'اليوم';
    } else if (date == yesterday) {
      return 'أمس';
    } else {
      Jiffy.setLocale('ar');
      return 'في ${Jiffy.parseFromDateTime(date).MMMd}';
    }
  }

  @override
  String sentAtText({required DateTime date, required DateTime time}) {
    Jiffy.setLocale('ar');
    final atTime = Jiffy.parseFromDateTime(time.toLocal());
    return 'تم الإرسال ${_getDay(date)} في ${atTime.jm}';
  }

  @override
  String get todayLabel => 'اليوم';

  @override
  String get yesterdayLabel => 'أمس';

  @override
  String get channelIsMutedText => 'تم كتم القناة';

  @override
  String get noTitleText => 'لا يوجد عنوان';

  @override
  String get letsStartChattingLabel => 'لنبدأ الدردشة!';

  @override
  String get sendingFirstMessageLabel => 'كيف ترسل رسالتك الأولى إلى صديق؟';

  @override
  String get startAChatLabel => 'ابدأ محادثة';
  @override
  String get loadingChannelsError => 'خطأ في تحميل القنوات';

  @override
  String get deleteConversationLabel => 'حذف المحادثة';

  @override
  String get deleteConversationQuestion => 'هل أنت متأكد أنك تريد حذف هذه المحادثة؟';

  @override
  String get streamChatLabel => 'دردشة ستريم';

  @override
  String get searchingForNetworkText => 'البحث عن الشبكة';

  @override
  String get offlineLabel => 'غير متصل...';

  @override
  String get tryAgainLabel => 'حاول مرة أخرى';

  @override
  String membersCountText(int count) {
    if (count == 1) return '1 عضو';
    return '$count أعضاء';
  }

  @override
  String watchersCountText(int count) {
    if (count == 1) return '1 متصل';
    return '$count متصلون';
  }

  @override
  String get viewInfoLabel => 'عرض المعلومات';

  @override
  String get leaveGroupLabel => 'مغادرة المجموعة';

  @override
  String get leaveLabel => 'مغادرة';

  @override
  String get leaveConversationLabel => 'مغادرة المحادثة';

  @override
  String get leaveConversationQuestion => 'هل أنت متأكد أنك تريد مغادرة هذه المحادثة؟';

  @override
  String get showInChatLabel => 'عرض في الدردشة';

  @override
  String get saveImageLabel => 'حفظ الصورة';

  @override
  String get saveVideoLabel => 'حفظ الفيديو';

  @override
  String get uploadErrorLabel => 'خطأ في التحميل';

  @override
  String get giphyLabel => 'جيفي';

  @override
  String get shuffleLabel => 'خلط';

  @override
  String get sendLabel => 'إرسال';

  @override
  String get withText => 'مع';

  @override
  String get inText => 'في';

  @override
  String get youText => 'أنت';

  @override
  String galleryPaginationText({
    required int currentPage,
    required int totalPages,
  }) =>
      '${currentPage + 1} من $totalPages';

  @override
  String get fileText => 'ملف';

  @override
  String get replyToMessageLabel => 'رد على الرسالة';

  @override
  String get slowModeOnLabel => 'الوضع البطيء مفعل';

  @override
  String get viewLibrary => 'عرض المكتبة';

  @override
  String attachmentLimitExceedError(int limit) => """
تجاوز حد المرفقات: لا يمكن إضافة أكثر من $limit مرفقات""";

  @override
  String get downloadLabel => 'تنزيل';

  @override
  String toggleMuteUnmuteUserText({required bool isMuted}) {
    if (isMuted) {
      return 'رفع كتم الصوت عن المستخدم';
    } else {
      return 'كتم صوت المستخدم';
    }
  }

  @override
  String toggleMuteUnmuteGroupQuestion({required bool isMuted}) {
    if (isMuted) {
      return 'هل أنت متأكد أنك تريد رفع كتم صوت هذه المجموعة؟';
    } else {
      return 'هل أنت متأكد أنك تريد كتم صوت هذه المجموعة؟';
    }
  }

  @override
  String toggleMuteUnmuteUserQuestion({required bool isMuted}) {
    if (isMuted) {
      return 'هل أنت متأكد أنك تريد رفع كتم صوت هذا المستخدم؟';
    } else {
      return 'هل أنت متأكد أنك تريد كتم صوت هذا المستخدم؟';
    }
  }

  @override
  String toggleMuteUnmuteAction({required bool isMuted}) {
    if (isMuted) {
      return 'رفع كتم الصوت';
    } else {
      return 'كتم الصوت';
    }
  }

  @override
  String toggleMuteUnmuteGroupText({required bool isMuted}) {
    if (isMuted) {
      return 'رفع كتم الصوت عن المجموعة';
    } else {
      return 'كتم صوت المجموعة';
    }
  }

  @override
  String get linkDisabledDetails => 'إرسال الروابط غير مسموح به في هذه المحادثة.';

  @override
  String get linkDisabledError => 'الروابط معطلة';

  @override
  String unreadMessagesSeparatorText() => 'رسائل جديدة';

  @override
  String get enableFileAccessMessage => 'يرجى تمكين الوصول إلى الملفات'
      '\nحتى تتمكن من مشاركتها مع الأصدقاء.';

  @override
  String get allowFileAccessMessage => 'السماح بالوصول إلى الملفات';

  @override
  String get markUnreadError => 'خطأ في تعليم الرسالة كغير مقروء. لا يمكن تعليم الرسائل غير المقروءة الأقدم من'
      ' أحدث 100 رسالة في القناة.';
}
