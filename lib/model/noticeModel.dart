class NoticeModels{
  String name;
  String noticeTitle;
  String noticeText;
  String imageURL;
  String time; // 실제 글 작성 시간
  NoticeModels(
      {required this.name,
      required this.noticeTitle,
      required this.noticeText,
      required this.imageURL,
      required this.time});
}