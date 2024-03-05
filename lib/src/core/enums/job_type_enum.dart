enum SharpApiJobTypeEnum {
  ECOMMERCE_REVIEW_SENTIMENT,
  ECOMMERCE_PRODUCT_CATEGORIES,
  ECOMMERCE_PRODUCT_INTRO,
  ECOMMERCE_THANK_YOU_EMAIL,
  HR_PARSE_RESUME,
  HR_JOB_DESCRIPTION,
  HR_RELATED_SKILLS,
  HR_RELATED_JOB_POSITIONS,
  TTH_REVIEW_SENTIMENT,
  TTH_TA_PRODUCT_CATEGORIES,
  TTH_HOSPITALITY_PRODUCT_CATEGORIES,
  CONTENT_DETECT_PHONES,
  CONTENT_DETECT_EMAILS,
  CONTENT_DETECT_SPAM,
  CONTENT_SUMMARIZE,
  CONTENT_KEYWORDS,
  CONTENT_TRANSLATE,
  SEO_GENERATE_TAGS,
}

extension SharpApiJobTypeEnumExtension on SharpApiJobTypeEnum {
  String get label {
    switch (this) {
      case SharpApiJobTypeEnum.ECOMMERCE_REVIEW_SENTIMENT:
        return 'Product Review Sentiment';
      case SharpApiJobTypeEnum.ECOMMERCE_PRODUCT_CATEGORIES:
        return 'Product Categories';
      case SharpApiJobTypeEnum.ECOMMERCE_PRODUCT_INTRO:
        return 'Generate Product Intro';
      case SharpApiJobTypeEnum.ECOMMERCE_THANK_YOU_EMAIL:
        return 'Generate Thank You E-mail';
      case SharpApiJobTypeEnum.HR_PARSE_RESUME:
        return 'Parse Resume/CV File';
      case SharpApiJobTypeEnum.HR_JOB_DESCRIPTION:
        return 'Generate Job Description';
      case SharpApiJobTypeEnum.HR_RELATED_SKILLS:
        return 'Related Skills';
      case SharpApiJobTypeEnum.HR_RELATED_JOB_POSITIONS:
        return 'Related Job Positions';
      case SharpApiJobTypeEnum.TTH_REVIEW_SENTIMENT:
        return 'Travel Review Sentiment';
      case SharpApiJobTypeEnum.TTH_TA_PRODUCT_CATEGORIES:
        return 'Tours & Activities Product Categories';
      case SharpApiJobTypeEnum.TTH_HOSPITALITY_PRODUCT_CATEGORIES:
        return 'Hospitality Product Categories';
      case SharpApiJobTypeEnum.CONTENT_DETECT_PHONES:
        return 'Detect Phone Numbers';
      case SharpApiJobTypeEnum.CONTENT_DETECT_EMAILS:
        return 'Detect Emails';
      case SharpApiJobTypeEnum.CONTENT_DETECT_SPAM:
        return 'Detect Spam';
      case SharpApiJobTypeEnum.CONTENT_SUMMARIZE:
        return 'Summarize Content';
      case SharpApiJobTypeEnum.CONTENT_KEYWORDS:
        return 'Generate Keywords/Tags';
      case SharpApiJobTypeEnum.CONTENT_TRANSLATE:
        return 'Translate Text';
      case SharpApiJobTypeEnum.SEO_GENERATE_TAGS:
        return 'Generate SEO Tags';
    }
  }

  String get category {
    switch (this) {
      case SharpApiJobTypeEnum.ECOMMERCE_REVIEW_SENTIMENT:
      case SharpApiJobTypeEnum.ECOMMERCE_PRODUCT_CATEGORIES:
      case SharpApiJobTypeEnum.ECOMMERCE_THANK_YOU_EMAIL:
      case SharpApiJobTypeEnum.ECOMMERCE_PRODUCT_INTRO:
        return 'E-commerce';
      case SharpApiJobTypeEnum.HR_PARSE_RESUME:
      case SharpApiJobTypeEnum.HR_JOB_DESCRIPTION:
      case SharpApiJobTypeEnum.HR_RELATED_SKILLS:
      case SharpApiJobTypeEnum.HR_RELATED_JOB_POSITIONS:
        return 'HR Tech';
      case SharpApiJobTypeEnum.TTH_REVIEW_SENTIMENT:
      case SharpApiJobTypeEnum.TTH_TA_PRODUCT_CATEGORIES:
      case SharpApiJobTypeEnum.TTH_HOSPITALITY_PRODUCT_CATEGORIES:
        return 'Travel, Tourism & Hospitality';
      case SharpApiJobTypeEnum.CONTENT_DETECT_PHONES:
      case SharpApiJobTypeEnum.CONTENT_DETECT_EMAILS:
      case SharpApiJobTypeEnum.CONTENT_DETECT_SPAM:
      case SharpApiJobTypeEnum.CONTENT_TRANSLATE:
      case SharpApiJobTypeEnum.CONTENT_KEYWORDS:
      case SharpApiJobTypeEnum.CONTENT_SUMMARIZE:
        return 'Content';
      case SharpApiJobTypeEnum.SEO_GENERATE_TAGS:
        return 'SEO';
    }
  }
}