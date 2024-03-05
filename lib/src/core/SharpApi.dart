import 'dart:io';

import 'package:sharpapi_flutter_client/src/content_and_marketing/conent_and_marketing_api_service.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/detect_spam_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/keywords_and_tags_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/phone_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/summarize_content_model.dart';
import 'package:sharpapi_flutter_client/src/content_and_marketing/models/translate_text_model.dart';
import 'package:sharpapi_flutter_client/src/core/di/injection.dart';
import 'package:sharpapi_flutter_client/src/core/models/category_model.dart';
import 'package:sharpapi_flutter_client/src/core/models/review_sentiment_model.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/e_commerce_api_service.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/models/product_intro_model.dart';
import 'package:sharpapi_flutter_client/src/e_commerce/models/thank_you_email_model.dart';
import 'package:sharpapi_flutter_client/src/hr/dto/generate_job_description_dto.dart';
import 'package:sharpapi_flutter_client/src/hr/hr_api_service.dart';
import 'package:sharpapi_flutter_client/src/hr/models/generate_job_description_model.dart';
import 'package:sharpapi_flutter_client/src/hr/models/parse_resume_model.dart';
import 'package:sharpapi_flutter_client/src/hr/models/related_job_positions_model.dart';
import 'package:sharpapi_flutter_client/src/hr/models/related_skills_model.dart';
import 'package:sharpapi_flutter_client/src/seo/models/generate_seo_tags_model.dart';
import 'package:sharpapi_flutter_client/src/seo/seo_api_service.dart';
import 'package:sharpapi_flutter_client/src/travel_tourism_hospitality/travel_tourism_hospitality_api_service.dart';

class SharpApi {
  ///*** generate job description
  static Future<GenerateJobDescriptionModel> generateJobDescription({
    required String name,
    String? companyName,
    String? minimumEducation,
    String? minimumWorkExperience,
    String? employmentType,
    String? country,
    bool? remote,
    bool? visaSponsored,
    List<String>? requiredSkills,
    List<String>? optionalSkills,
    String language = 'English',
  }) async {
    GenerateJobDescriptionDto generateJobDescriptionDto = GenerateJobDescriptionDto(
      name: name,
      companyName: companyName,
      minimumEducation: minimumEducation,
      minimumWorkExperience: minimumWorkExperience,
      employmentType: employmentType,
      country: country,
      remote: remote,
      visaSponsored: visaSponsored,
      requiredSkills: requiredSkills,
      optionalSkills: optionalSkills,
      language: language,
    );

    GenerateJobDescriptionModel? generateJobDescriptionModel;

    try {
      generateJobDescriptionModel = await sl<HrApiService>().generateJobDescription(
        generateJobDescriptionDto: generateJobDescriptionDto,
      );
    } catch (error) {
      rethrow;
    }

    return generateJobDescriptionModel;
  }

  ///*** related skills
  static Future<RelatedSkillsModel> relatedSkills({
    required String skill,
    String language = 'English',
  }) async {
    RelatedSkillsModel? relatedSkillsModel;

    try {
      relatedSkillsModel = await sl<HrApiService>().relatedSkills(
        skill: skill,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return relatedSkillsModel;
  }

  ///*** related job positions
  static Future<RelatedJobPositionModel> relatedJobPositions({
    required String jobTitle,
    String language = 'English',
  }) async {
    RelatedJobPositionModel? relatedJobPositionModel;

    try {
      relatedJobPositionModel = await sl<HrApiService>().relatedJobPositions(
        jobTitle: jobTitle,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return relatedJobPositionModel;
  }

  ///*** parse resume
  static Future<ParseResumeModel> parseResume({
    required File resume,
    String language = 'English',
  }) async {
    ParseResumeModel? parseResumeModel;

    try {
      parseResumeModel = await sl<HrApiService>().parseResume(
        resume: resume,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return parseResumeModel;
  }

  ///*** product review sentiment
  static Future<ReviewSentimentModel> productReviewSentiment({
    required String content,
    String language = 'English',
  }) async {
    ReviewSentimentModel? productReviewModel;

    try {
      productReviewModel = await sl<ECommerceApiService>().productReviewSentiment(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return productReviewModel;
  }

  ///*** product categories
  static Future<List<CategoryModel>> productCategories({
    required String content,
    String language = 'English',
  }) async {
    List<CategoryModel>? productCategoriesModel;

    try {
      productCategoriesModel = await sl<ECommerceApiService>().productCategories(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return productCategoriesModel;
  }

  ///*** product intro
  static Future<ProductIntroModel> generateProductIntro({
    required String content,
    String language = 'English',
  }) async {
    ProductIntroModel? productIntroModel;

    try {
      productIntroModel = await sl<ECommerceApiService>().generateProductIntro(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return productIntroModel;
  }

  ///*** thank you email
  static Future<ThankYouEmailModel> generateThankYouEmail({
    required String content,
    String language = 'English',
  }) async {
    ThankYouEmailModel? thankYouEmailModel;

    try {
      thankYouEmailModel = await sl<ECommerceApiService>().generateThankYouEmail(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return thankYouEmailModel;
  }

  ///*** generate seo tags
  static Future<GenerateSeoTagsModel> generateSeoTags({
    required String content,
    String language = 'English',
  }) async {
    GenerateSeoTagsModel? generateSeoTagsModel;

    try {
      generateSeoTagsModel = await sl<SeoApiService>().generateSeoTags(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return generateSeoTagsModel;
  }

  ///*** travel review sentiment
  static Future<ReviewSentimentModel> travelReviewSentiment({
    required String content,
    String language = 'English',
  }) async {
    ReviewSentimentModel? travelReviewSentimentModel;

    try {
      travelReviewSentimentModel = await sl<TravelTourismHospitalityApiService>().travelReviewSentiment(
        content: content,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return travelReviewSentimentModel;
  }

  ///*** tours and activities product categories
  static Future<List<CategoryModel>> toursAndActivitiesProductCategories({
    required String productName,
    String? country,
    String? city,
    String language = 'English',
  }) async {
    List<CategoryModel>? toursAndActivitiesProductCategoriesModel;

    try {
      toursAndActivitiesProductCategoriesModel = await sl<TravelTourismHospitalityApiService>().toursAndActivitiesProductCategories(
        content: productName,
        country: country,
        city: city,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return toursAndActivitiesProductCategoriesModel;
  }

  ///*** tours and activities product categories
  static Future<List<CategoryModel>> hospitalityProductCategories({
    required String productName,
    String? country,
    String? city,
    String language = 'English',
  }) async {
    List<CategoryModel>? hospitalityProductCategoriesModel;

    try {
      hospitalityProductCategoriesModel = await sl<TravelTourismHospitalityApiService>().hospitalityProductCategories(
        content: productName,
        country: country,
        city: city,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return hospitalityProductCategoriesModel;
  }

  ///*** translate

  static Future<TranslateTextModel> translate({
    required String text,
    required String language,
  }) async {
    TranslateTextModel? translateModel;

    try {
      translateModel = await sl<ContentAndMarketingApiService>().translate(
        text: text,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return translateModel;
  }

  ///*** detect spam

  static Future<DetectSpamModel> detectSpam({
    required String text,
  }) async {
    DetectSpamModel? detectSpamModel;

    try {
      detectSpamModel = await sl<ContentAndMarketingApiService>().detectSpam(
        text: text,
      );
    } catch (error) {
      rethrow;
    }

    return detectSpamModel;
  }

  ///*** detect phones

  static Future<List<PhoneNumberModel>> detectPhones({
    required String text,
  }) async {
    List<PhoneNumberModel>? detectPhonesModel;

    try {
      detectPhonesModel = await sl<ContentAndMarketingApiService>().detectPhones(
        text: text,
      );
    } catch (error) {
      rethrow;
    }

    return detectPhonesModel;
  }

  ///*** detect emails
  static Future<List<String>> detectEmails({
    required String text,
  }) async {
    List<String>? detectEmailsModel;

    try {
      detectEmailsModel = await sl<ContentAndMarketingApiService>().detectEmails(
        text: text,
      );
    } catch (error) {
      rethrow;
    }

    return detectEmailsModel;
  }

  ///*** summarize text
  static Future<SummarizeContentModel> summarizeText({
    required String text,
    String language = 'English',
  }) async {
    SummarizeContentModel? summarizeTextModel;

    try {
      summarizeTextModel = await sl<ContentAndMarketingApiService>().summarizeText(
        text: text,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return summarizeTextModel;
  }

  ///*** generate keywords

  static Future<KeywordsAndTagsModel> generateKeywords({
    required String text,
    String language = 'English',
  }) async {
    KeywordsAndTagsModel? generateKeywordsModel;

    try {
      generateKeywordsModel = await sl<ContentAndMarketingApiService>().generateKeywords(
        text: text,
        language: language,
      );
    } catch (error) {
      rethrow;
    }

    return generateKeywordsModel;
  }
}
