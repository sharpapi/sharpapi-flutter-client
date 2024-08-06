class QuotaModel {
  String? timestamp;
  bool? onTrial;
  String? trialEnds;
  bool? subscribed;
  String? currentSubscriptionStart;
  String? currentSubscriptionEnd;
  int? subscriptionWordsQuota;
  int? subscriptionWordsUsed;
  int? subscriptionWordsUsedPercentage;

  QuotaModel({
    this.timestamp,
    this.onTrial,
    this.trialEnds,
    this.subscribed,
    this.currentSubscriptionStart,
    this.currentSubscriptionEnd,
    this.subscriptionWordsQuota,
    this.subscriptionWordsUsed,
    this.subscriptionWordsUsedPercentage,
  });

  factory QuotaModel.fromJson(Map<String, dynamic> json) => QuotaModel(
    timestamp: json['timestamp'],
    onTrial: json['on_trial'],
    trialEnds: json['trial_ends'],
    subscribed: json['subscribed'],
    currentSubscriptionStart: json['current_subscription_start'],
    currentSubscriptionEnd: json['current_subscription_end'],
    subscriptionWordsQuota: json['subscription_words_quota'],
    subscriptionWordsUsed: json['subscription_words_used'],
    subscriptionWordsUsedPercentage: json['subscription_words_used_percentage'],
  );
}