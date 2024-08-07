![SharpAPI GitHub cover](https://sharpapi.com/sharpapi-github-php-bg.jpg "SharpAPI Flutter Client")

# SharpAPI Flutter Client SDK

## 🚀 Automate with AI in just two lines of code. Save countless hours and enhance your app effortlessly.

### Leverage AI API to streamline workflows in E-Commerce, Marketing, Content Management, HR Tech, Travel, and more.

#### Save time on repetitive content analysis and generation tasks that your app users perform daily.

See more at [SharpAPI.com Website &raquo;](https://sharpapi.com/)

## What can it do for you?

* **E-commerce**
    - Quickly generate engaging product introductions to attract customers.
    - Automatically create personalized thank-you emails for enhanced customer experience.
    - Streamline product categorization for a well-organized catalog.
    - Sentiment Analysis: Understand and analyze sentiment in product reviews for data-driven decision-making.
* **Content & Marketing Automation**
    - Easily translate text for a global audience.
    - Spam Content Detection: Identify and filter out spam content effectively.
    - Contact Information Extraction: Extract phone numbers and email addresses from non-standard formats for
      streamlined communication.
    - Generate concise summaries and unique keywords/tags for improved content consumption.
    - Boost SEO efforts by automatically generating META tags based on content.
* **HR Tech**
    - Generate complex job descriptions effortlessly, saving time in the hiring process.
    - Skills and Position Insights: Identify related job positions and skills to streamline recruitment.
    - Automated Resume Parsing: Efficiently parse and extract information from resumes files for easy processing.
* **Travel, Tourism & Hospitality**
    - Analyze sentiment in travel reviews to improve services.
    - Streamline categorization for tours, activities, and hospitality products.

## Features

Please refer to the official:

- [API Documentation](https://sharpapi.com/documentation)
- **Multi-language Support**:
  Supporting 80 languages for every content or data analysis API endpoint.
  [Check the list here](https://botpress.com/blog/list-of-languages-supported-by-chatgpt).
- **Easy-to-Use RESTful Format**:
  With standardized set of endpoints - gain valuable insights through analysis endpoints, covering product categories,
  skills, and job positions, providing relevant scores.
- **Always the same, clean data formats**:
  Rest assured with consistent, predictable JSON format
  for all returned data. No need to worry about fuzzy AI data.
- **Tech Support**:
  Crafted by developers for developers, we provide continuous
  assistance throughout your journey.

## Installation

1. Add sharpapi_flutter_client to your `pubspec.yaml` file
    ```yaml
    dependencies:
      sharpapi_flutter_client: ^latest_version
    ```
   
2. Run `flutter pub get` to install the package.

3. Register at [SharpApi.com](https://sharpapi.com/) and get the API key.
   **That's it!**

## Usage

1. Import the package in your dart file
    ```dart
    import 'package:sharpapi_flutter_client/sharpapi_flutter_client.dart';
    ```
   
2. Initialize the `SharpApiConfigs` with your API key in the `main` method
    ```dart
   void main() {
      SharpApiConfigs.init(
        apiKey: 'YOUR_API_KEY',
      );

      runApp(const MyApp());
    }
    ```

**Each call usually takes somewhere between a couple of seconds to a minute.**

After that period a returned response will usually have `success` status and it's results will
be available for further processing.
Each API method returns different return format.
[Go to List of API methods/endpoints below for details&raquo;](#list-of-api-methodsendpoints)

**Our API guarantees to return correct format every time.** AI engines that SharpAPI
use in rare cases have a tendency to misbehave and timeout
or return incorrect data.
In those cases the returned `status` for the job will be `failed`.
You can rerun the exact same job request in that case.

As long as the job is still being processed by our engine it will keep
returning `pending` status.

## List of API methods/endpoints

For methods that have language parameter you can also
use `SharpApiLanguages` Enum values to make your code more readable.

### HR

#### Parse Resume/CV File

Parses a resume (CV) file from multiple formats (PDF/DOC/DOCX/TXT/RTF) and returns an extensive object of data points.

An optional output language parameter can also be provided (`English` value is set as the default one) .

```dart
  ///*** parse resume
  SharpApi.parseResume(
    resume: File(''),
    language: SharpApiLanguages.ENGLISH, // optional language
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Generate Job Description

Based on the list of extensive parameters this endpoint provides concise job details in the response format, including
the short description, job requirements, and job responsibilities.
The only mandatory parameter is `name`.

```dart
  ///*** generate job description
  SharpApi.generateJobDescription(
    name: 'ANY_JOB_TITLE',
    companyName: 'ANY_COMPANY_NAME',      // optional company name
    minimumEducation: 'Bachelor Degree',  // optional minimum education
    minimumWorkExperience: '2 years',     // optional minimum work experience
    employmentType: 'Full Time',          // optional employment type
    country: 'United States',             // optional country
    remote: true,                         // optional remote
    visaSponsored: true,                  // optional visa sponsored
    requiredSkills: ['skill1', 'skill2'], // optional required skills
    optionalSkills: ['skill3', 'skill4'], // optional optional skills
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    context: 'avoid using abbreviations', // optional context
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Related Skills

Generates a list of related skills with their weights as a float
value (1.0-10.0) where 10 equals 100%, the highest relevance score.

```dart
  ///*** related skills
  SharpApi.relatedSkills(
    skill: 'ANY_SKILL',
    language: SharpApiLanguages.ENGLISH,  // optional language
    maxQuantity: 5,                       // optional max quantity
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Related Job Positions

Generates a list of related job positions with their weights as
float value (1.0-10.0) where 10 equals 100%, the highest relevance score.

```dart
  ///*** related job positions
  SharpApi.relatedJobPositions(
    jobTitle: 'ANY_JOB_TITLE',
    language: SharpApiLanguages.ENGLISH,  // optional language
    maxQuantity: 5,                       // optional max quantity
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

### E-commerce

#### Product Review Sentiment

Parses the customer's product review and provides its sentiment (POSITIVE/NEGATIVE/NEUTRAL)
with a score between 0-100%. Great for sentiment report processing for any online store.

```dart
  ///*** product review sentiment
  SharpApi.productReviewSentiment(
    content: 'ANY_CONTENT',
    language: SharpApiLanguages.ENGLISH,  // optional language
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Product Categories

Generates a list of suitable categories for the product with relevance
weights as a float value (1.0-10.0) where 10 equals 100%, the highest relevance score.
Provide the product name and its parameters to get the best category matches possible.
Comes in handy with populating product catalogue data and bulk products' processing.

```dart
  ///*** product categories
  SharpApi.productCategories(
    content: 'ANY_CONTENT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    maxQuantity: 5,                       // optional max quantity
    context: 'avoid using abbreviations', // optional context
    voiceTone: 'neutral',                 // optional voice tone
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Generate Product Intro

Generates a shorter version of the product description. Provide as many details
and parameters of the product to get the best marketing introduction possible.
Comes in handy with populating product catalog data and bulk products processing.

```dart
  ///*** generate product intro
  SharpApi.generateProductIntro(
    content: 'ANY_CONTENT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    maxLength: 500,                       // optional max length
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Generate Thank You E-mail

Generates a personalized thank-you email to the customer after the purchase.
The response content does not contain the title, greeting or sender info at the end,
so you can personalize the rest of the email easily.

```dart
  ///*** generate thank you email
  SharpApi.generateThankYouEmail(
    content: 'ANY_CONTENT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    maxLength: 500,                       // optional max length
    context: 'avoid using abbreviations', // optional context
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

### Content

#### Paraphrase / Rephrase Text

Generates a paraphrased version of the provided text.
Only the `content` parameter is required. You can define the output language,
maximum character length, and tone of voice.

Additional instructions on how to process the text can be provided in the context parameter.
Please keep in mind that `max_length` serves as a strong suggestion
for the Language Model, rather than a strict requirement,
to maintain the general sense of the outcome.

You can set your preferred writing style by providing an optional `voice_tone` parameter.
It can be adjectives like `funny` or `joyous`, or even the name of a famous writer.

This API method also provides an optional `context` parameter,
which can be used to supply additional flexible instructions for content processing.

```dart
  ///*** paraphrase text
  SharpApi.paraphrase(
    text: 'ANY_TEXT',
    language: SharpApiLanguages.ENGLISH,   // optional language
    maxLength: 500,                        // optional length
    voiceTone: 'neutral',                  // optional voice tone
    context: 'avoid using abbreviations',  // optional context
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Proofread Text + Grammar Check

Proofreads (and checks grammar) a provided text.

```dart
  ///*** proofread text
  SharpApi.proofread(
    text: 'ANY_TEXT',
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Translate Text

Translates provided text to selected language. 80 languages are supported.
Please check included `SharpApiLanguages` _Enum_ class for details.

```dart
  ///*** translate text
  SharpApi.translate(
    text: 'ANY_TEXT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    context: 'avoid using abbreviations', // optional context
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Detect Spam

Checks if provided content passes a spam filtration test.
Provides a percentage confidence score and an explanation
for whether it is considered spam or not.
This information is useful for moderators to make a final decision.

```dart
  ///*** detect spam
  SharpApi.detectSpam(
    text: 'ANY_TEXT',
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Detect Phones Numbers

Parses the provided text for any phone numbers and returns the original detected
version and its E.164 format. Might come in handy in the case of processing
and validating big chunks of data against phone numbers or f.e. if you want
to detect phone numbers in places where they're not supposed to be.

```dart
  ///*** detect phones
  SharpApi.detectPhones(
    text: 'ANY_TEXT',
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Detect Emails

Parses the provided text for any possible emails. Might come in handy in case
of processing and validating big chunks of data against email addresses
or f.e. if you want to detect emails in places where they're not supposed to be.

```dart
  ///*** detect emails
  SharpApi.detectEmails(
    text: 'ANY_TEXT',
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Generate Keywords/Tags

Generates a list of unique keywords/tags based on the provided content.

```dart
  ///*** generate keywords
  SharpApi.generateKeywords(
    text: 'ANY_TEXT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```


#### Summarize Text

Generates a summarized version of the provided content. Perfect for generating
marketing introductions of longer texts.

```dart
  ///*** summarize text
  SharpApi.summarizeText(
    text: 'ANY_TEXT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    maxLength: 500,                       // optional max length
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

### SEO

#### Generate SEO Tags

Generates all most important META tags based on the content provided. Make sure to include
link to the website and pictures URL to get as many tags populated as possible.

```dart
  ///*** generate seo tags
  SharpApi.generateSeoTags(
    content: 'ANY_CONTENT',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

### Travel, Tourism & Hospitality

#### Travel Review Sentiment

Parses the Travel/Hospitality product review and provides its sentiment
(POSITIVE/NEGATIVE/NEUTRAL) with a score between 0-100%.
Great for sentiment report processing for any online store.

```dart
  ///*** travel review sentiment
  SharpApi.travelReviewSentiment(
    content: 'ANY_CONTENT',
    language: SharpApiLanguages.ENGLISH,  // optional language
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Tours & Activities Product Categories

Generates a list of suitable categories for the Tours & Activities product
with relevance weights as float value (1.0-10.0) where 10 equals 100%,
the highest relevance score. Provide the product name and its parameters
to get the best category matches possible. Comes in handy with populating
product catalogue data and bulk product processing.
Only first parameter `productName` is required.

```dart
  ///*** tours and activities product categories
  SharpApi.toursAndActivitiesProductCategories(
    productName: 'ANY_PRODUCT_NAME',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    context: 'avoid using abbreviations', // optional context
    maxQuantity: 5,                       // optional max quantity
    country: 'United States',             // optional country
    city: 'New York',                     // optional city
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

#### Hospitality Product Categories

Generates a list of suitable categories for the Hospitality type product
with relevance weights as float value (1.0-10.0) where 10 equals 100%,
the highest relevance score. Provide the product name and its parameters
to get the best category matches possible. Comes in handy with populating
products catalogs data and bulk products' processing.
Only first parameter `productName` is required.

```dart
  ///*** hospitality product categories
  SharpApi.hospitalityProductCategories(
    productName: 'ANY_PRODUCT_NAME',
    language: SharpApiLanguages.ENGLISH,  // optional language
    voiceTone: 'neutral',                 // optional voice tone
    context: 'avoid using abbreviations', // optional context
    maxQuantity: 5,                       // optional max quantity
    country: 'United States',             // optional country
    city: 'New York',                     // optional city
  ).then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

### 🤖 Technical API Endpoints

#### Subscription information / quota check
Endpoint to check details regarding the subscription's current period

```dart
  ///*** quota
  SharpApi.quota().then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

will result in:
```json
{
    "timestamp": "2024-03-19T12:49:41.445736Z",
    "on_trial": false,
    "trial_ends": "2024-03-17T07:57:46.000000Z",
    "subscribed": true,
    "current_subscription_start": "2024-03-18T12:37:39.000000Z",
    "current_subscription_end": "2024-04-18T12:37:39.000000Z",
    "subscription_words_quota": 100000,
    "subscription_words_used": 9608,
    "subscription_words_used_percentage": 0.1
}
```

`subscription_words_used_percentage` is a percentage of current monthly quota usage
and might serve as an alert to the user of the depleted credits.
With a value above 80%, it's advised to subscribe to more credits
at https://sharpapi.com/dashboard/credits to avoid service disruption.

These values are also available in the Dashboard at https://sharpapi.com/dashboard

#### Ping
Simple PING endpoint to check the availability of the API and it's internal timze zone (timestamp).

```dart
  ///*** ping
  SharpApi.ping().then((value) {
    /// do something with the [value] here
  }).catchError((error) {
    /// do something with the [error] here
  });
```

will result in:
```json
{
  "ping": "pong",
  "timestamp": "2024-03-12T08:50:11.188308Z"
}
```

---

### Do you think our API is missing some obvious functionality?

[Please let us know»](https://github.com/sharpapi/sharpapi-php-client/issues)

## Changelog

Please see [CHANGELOG](CHANGELOG.md) for more information on what has changed recently.

## Credits

- [Abdullah Mansour](https://github.com/abdullahmansss)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
