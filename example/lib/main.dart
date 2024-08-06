import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:sharpapi_flutter_client/sharpapi_flutter_client.dart';

void main() {
  SharpApiConfigs.init(
    apiKey: 'YOUR_API_KEY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SharpAPI Example App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(
        title: 'SharpAPI Example App',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool isJobStatusPolling = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // SharpAPI For Hr
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SharpAPI For Hr',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          PrimaryElevatedButton(
                            title: 'Generate Job Description',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    generateJobDescription();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Related Skills',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    relatedSkills();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Related Job Positions',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    relatedJobPosition();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Parse Resume',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    selectResume();
                                  },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16.0),

                // SharpAPI For E-commerce
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SharpAPI For E-commerce',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          PrimaryElevatedButton(
                            title: 'Product Review Sentiment',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    productReviewSentiment();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Product Categories',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    productCategories();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Generate Product Intro',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    generateProductIntro();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Generate Thank You E-mail',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    generateThankYouEmail();
                                  },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16.0),

                // SharpAPI For SEO
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SharpAPI For SEO',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          PrimaryElevatedButton(
                            title: 'Generate SEO Tags',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    generateSeoTags();
                                  },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16.0),

                // SharpAPI For Travel, Tourism & Hospitality
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SharpAPI For Travel, Tourism & Hospitality',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          PrimaryElevatedButton(
                            title: 'Travel Review Sentiment',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    travelReviewSentiment();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Tours And Activities Product Categories',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    toursAndActivitiesProductCategories();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Hospitality Product Categories',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    hospitalityProductCategories();
                                  },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16.0),

                // SharpAPI For Content & Marketing Automation
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SharpAPI For Content & Marketing Automation',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          PrimaryElevatedButton(
                            title: 'Translate Text',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    translate();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Detect Spam',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    detectSpam();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Detect Phones',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    detectPhones();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Detect Emails',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    detectEmails();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Summarize Text',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    summarizeText();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Generate Keywords',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                                    generateKeywords();
                                  },
                          ),
                          PrimaryElevatedButton(
                            title: 'Paraphrase Text',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                              paraphrase();
                            },
                          ),
                          PrimaryElevatedButton(
                            title: 'Proofread Text',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                              proofread();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                const SizedBox(height: 16.0),

                // subscription info
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Subscription Info',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          PrimaryElevatedButton(
                            title: 'Quota',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                              quota();
                            },
                          ),
                          PrimaryElevatedButton(
                            title: 'Ping',
                            onPressed: isJobStatusPolling
                                ? null
                                : () {
                              ping();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void snippet() async {
    ///*** quota
    SharpApi.quota().then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

    ///*** ping
    SharpApi.ping().then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

    ///*** paraphrase text
    SharpApi.paraphrase(
      text: "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in light rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is. It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the track will be good, maybe it will be bad. It was so-so on the [simulator]. Don't knock it 'til you try it. I hear there are a lot of people complaining about the direction [F1 president] Stefano [Domenicali] and [owners] Liberty have been going [but] I think they have been doing an amazing job b.\"",
      language: SharpApiLanguages.ENGLISH,   // optional language
      maxLength: 500,                        // optional length
      voiceTone: 'neutral',                  // optional voice tone
      context: 'avoid using abbreviations',  // optional context
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

    ///*** proofread text
    SharpApi.proofread(
      text: "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in light rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is. It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the track will be good, maybe it will be bad. It was so-so on the [simulator]. Don't knock it 'til you try it. I hear there are a lot of people complaining about the direction [F1 president] Stefano [Domenicali] and [owners] Liberty have been going [but] I think they have been doing an amazing job b.\"",
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

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

    ///*** parse resume
    SharpApi.parseResume(
      resume: File(''),
      language: SharpApiLanguages.ENGLISH, // optional language
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

    ///*** product review sentiment
    SharpApi.productReviewSentiment(
      content: 'ANY_CONTENT',
      language: SharpApiLanguages.ENGLISH,  // optional language
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

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

    ///*** travel review sentiment
    SharpApi.travelReviewSentiment(
      content: 'ANY_CONTENT',
      language: SharpApiLanguages.ENGLISH,  // optional language
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

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

    ///*** detect spam
    SharpApi.detectSpam(
      text: 'ANY_TEXT',
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

    ///*** detect phones
    SharpApi.detectPhones(
      text: 'ANY_TEXT',
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

    ///*** detect emails
    SharpApi.detectEmails(
      text: 'ANY_TEXT',
    ).then((value) {
      /// do something with the [value] here
    }).catchError((error) {
      /// do something with the [error] here
    });

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
  }

  void displayErrorSnackBar({
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: Theme.of(context).colorScheme.error,
        showCloseIcon: true,
      ),
    );
  }

  void displaySuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Success, Job Description Generated!\ncheck logs for details.',
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        showCloseIcon: true,
      ),
    );
  }

  // SharpAPI For Hr
  void generateJobDescription() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.generateJobDescription(
      name: 'flutter developer',
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Job Description *****');
      debugPrint(value.jobShortDescription);

      debugPrint('***** Job Requirements *****');
      debugPrint(value.jobRequirements);

      debugPrint('***** Job Responsibilities *****');
      debugPrint(value.jobResponsibilities);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void relatedSkills() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.relatedSkills(
      skill: 'flutter developer',
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Skill *****');

      debugPrint(value.skill);

      debugPrint('***** Related Skills *****');

      value.relatedSkills?.forEach((element) {
        debugPrint('skill: ${element.name}');
        debugPrint('weight: ${element.weight}');
        debugPrint('-----------------');
      });
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void relatedJobPosition() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.relatedJobPositions(
      jobTitle: 'flutter developer',
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Job *****');

      debugPrint(value.jobPosition);

      debugPrint('***** Related Positions *****');

      value.relatedJobPosition?.forEach((element) {
        debugPrint('skill: ${element.name}');
        debugPrint('weight: ${element.weight}');
        debugPrint('-----------------');
      });
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void parseResume() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.parseResume(
      resume: resumeFile!,
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Candidate Name *****');
      debugPrint(value.candidateName);

      debugPrint('***** Candidate Email *****');
      debugPrint(value.candidateEmail);

      debugPrint('***** Candidate Phone *****');
      debugPrint(value.candidatePhone);

      debugPrint('***** Candidate Address *****');
      debugPrint(value.candidateAddress);

      debugPrint('***** Candidate Language *****');
      debugPrint(value.candidateLanguage);

      debugPrint('***** Candidate Spoken Languages *****');
      value.candidateSpokenLanguages?.forEach((element) {
        debugPrint(element);
      });

      debugPrint('***** Candidate Honors And Awards *****');
      value.candidateHonorsAndAwards?.forEach((element) {
        debugPrint(element);
      });

      debugPrint('***** Candidate Courses And Certifications *****');
      value.candidateCoursesAndCertifications?.forEach((element) {
        debugPrint(element);
      });

      debugPrint('***** Candidate Positions *****');
      value.positions?.forEach((element) {
        debugPrint('skill: ${element.skills}');
        debugPrint('country: ${element.country}');
        debugPrint('end date: ${element.endDate}');
        debugPrint('start date: ${element.startDate}');
        debugPrint('job details: ${element.jobDetails}');
        debugPrint('company name: ${element.companyName}');
        debugPrint('position name: ${element.positionName}');
        debugPrint('-----------------');
      });

      debugPrint('***** Candidate Education Qualifications *****');
      value.educationQualifications?.forEach((element) {
        debugPrint('degree: ${element.degreeType}');
        debugPrint('country: ${element.country}');
        debugPrint('end date: ${element.endDate}');
        debugPrint('start date: ${element.startDate}');
        debugPrint('school name: ${element.schoolName}');
        debugPrint('-----------------');
      });
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  File? resumeFile;

  void selectResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'txt',
        'rtf',
      ],
      type: FileType.custom,
    );

    if (result != null) {
      resumeFile = File(result.files.single.path!);

      int sizeInBytes = resumeFile!.lengthSync();
      double sizeInMb = sizeInBytes / (1024 * 1024);

      if (sizeInMb >= 6) {
        resumeFile = null;

        displayErrorSnackBar(
          message: 'File size should be less than 6MB',
        );
      } else {
        parseResume();
      }
    } else {
      // User canceled the picker
    }
  }

  // SharpAPI For E-commerce
  void productCategories() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.productCategories(
      content:
          'Razer Blade 16 Gaming Laptop: NVIDIA GeForce RTX 4090-13th Gen Intel 24-Core i9 HX CPU - 16 inch Dual Mode Mini LED (4K UHD+ 120Hz & FHD+ 240Hz) - 32GB RAM - 2TB SSD - Compact GaN Charger - Windows 11',
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      for (var element in value) {
        debugPrint('category: ${element.name}');
        debugPrint('weight: ${element.weight}');
        debugPrint('-----------------');
      }
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void productReviewSentiment() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.productReviewSentiment(
      content:
          'I got a variant of this laptop 4090 with miniLED and surprise, it does not work in SDR and if you enable HDR to make the miniLED work it causes so much back light bleed you can see light follow the mouse and around the the text. I found out Razer has two variants of the panel one called BOE and one called AUO. The BOE i got is whats broken, and they have the audacity to sell an inferior version of the laptop (early 2023) with a huge faulty screen.refer to my images to see how bad the MiniLED looks when HDR is enable, and without HDR well, the miniLED simply does not work. Great job Razer, will be returning this as I have no way of telling if I get the BOE or AUO variant of the screen. Do some research on this if you going for the MiniLED version.Other than the screen which is one of main reasons you likely buying this, the performance is amazing and temps are great.',
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Score *****');
      debugPrint(value.score.toString());

      debugPrint('***** Opinion *****');
      debugPrint(value.opinion);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void generateProductIntro() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.generateProductIntro(
      content:
          'Razer Blade 16 Gaming Laptop: NVIDIA GeForce RTX 4090-13th Gen Intel 24-Core i9 HX CPU - 16 inch Dual Mode Mini LED (4K UHD+ 120Hz & FHD+ 240Hz) - 32GB RAM - 2TB SSD - Compact GaN Charger - Windows 11 NVIDIA GEFORCE RTX 4090 GRAPHICS: Packed for pure performance with 1.50 gPD (Graphics Power Density) and delivers up to 35% more graphic power per inch than any other 16 inch gaming laptop 13TH GEN INTEL CORE I9 13950HX PROCESSOR: From full-blown AAA gaming to full-on content creation, run resource-intensive tasks flawlessly with the most powerful mobile processor leveraging desktop-grade silicon NEXT GEN DUAL-MODE MINI LED DISPLAY: Switch between ultra-sharp 4K for creative work and ultra-fast refresh rates for silky-smooth gameplay, backed by 1K nits peak brightness and 100% DCI-P3 color accuracy 16 INCH DISPLAY IN A 15 INCH BODY: Built with similar chassis dimensions to a typical 15” gaming laptop, its just as ultra-portable yet offers even more screen real estate—a solution that’s the best of both worlds ULTRA-COMPACT GAN CHARGER (UP TO 330W): Stay ready to go with a charger that’s not only faster and more power-efficient than standard adapters but also up to 60% smaller ANODIZED ALUMINUM UNIBODY: CNC-milled from a single aluminum block, the chassis achieves optimal strength-to-weight ratio and is anodized with a matte black finish for a smooth, scratch-resistant surface',
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Intro *****');
      debugPrint(value.productIntro);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void generateThankYouEmail() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.generateThankYouEmail(
            content:
                "[I'M From] Honey Mask 4.23oz | wash off type, real honey 38.7%, Deep moisturization, Nourishment,Hydrating and Clear Complexion.")
        .then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Email *****');
      debugPrint(value.email);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  // SharpAPI For SEO
  void generateSeoTags() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.generateSeoTags(
      content:
          "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in light rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is. It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the track will be good, maybe it will be bad. It was so-so on the [simulator]. Don't knock it 'til you try it. I hear there are a lot of people complaining about the direction [F1 president] Stefano [Domenicali] and [owners] Liberty have been going [but] I think they have been doing an amazing job.\"",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Title *****');
      debugPrint(value.metaTags?.title);

      debugPrint('***** Description *****');
      debugPrint(value.metaTags?.description);

      debugPrint('***** Keywords *****');
      debugPrint(value.metaTags?.keywords);

      debugPrint('***** Author *****');
      debugPrint(value.metaTags?.author);

      debugPrint('***** ogUrl *****');
      debugPrint(value.metaTags?.ogUrl);

      debugPrint('***** ogType *****');
      debugPrint(value.metaTags?.ogType);

      debugPrint('***** ogImage *****');
      debugPrint(value.metaTags?.ogImage);

      debugPrint('***** ogTitle *****');
      debugPrint(value.metaTags?.ogTitle);

      debugPrint('***** ogSiteName *****');
      debugPrint(value.metaTags?.ogSiteName);

      debugPrint('***** ogDescription *****');
      debugPrint(value.metaTags?.ogDescription);

      debugPrint('***** twitterCard *****');
      debugPrint(value.metaTags?.twitterCard);

      debugPrint('***** twitterImage *****');
      debugPrint(value.metaTags?.twitterImage);

      debugPrint('***** twitterTitle *****');
      debugPrint(value.metaTags?.twitterTitle);

      debugPrint('***** twitterCreator *****');
      debugPrint(value.metaTags?.twitterCreator);

      debugPrint('***** twitterDescription *****');
      debugPrint(value.metaTags?.twitterDescription);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  // SharpAPI For Travel, Tourism & Hospitality
  void travelReviewSentiment() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.travelReviewSentiment(
      content:
          "We had a great stay at the Jen Orchard!! Super comfortable rooms and beds. The delicious and extensive breakfast buffet is absolutely worth it as well. The pool is really cool and offers amazing views. We didn't get to enjoy it as much as we wanted due to thunderstorms, but you can even stay here if you have a late flight, which we had. The changing rooms have free lockers that easily fit your hand luggage and there are showers to freshen up and change before leaving for the airport. Location is perfect, right above an MRT station. Staff is really friendly. Would definitely stay here again when in Singapore.",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Score *****');
      debugPrint(value.score.toString());

      debugPrint('***** Opinion *****');
      debugPrint(value.opinion);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      displayErrorSnackBar(
        message: e.message,
      );

      debugPrint('error ==>> ${e.message}');
    });
  }

  void toursAndActivitiesProductCategories() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.toursAndActivitiesProductCategories(
      productName: "Oasis of the Bay",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      for (var element in value) {
        debugPrint('category: ${element.name}');
        debugPrint('weight: ${element.weight}');
        debugPrint('-----------------');
      }
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void hospitalityProductCategories() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.hospitalityProductCategories(
      productName: "Hotel Crystal 大人専用",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      for (var element in value) {
        debugPrint('category: ${element.name}');
        debugPrint('weight: ${element.weight}');
        debugPrint('-----------------');
      }
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  // SharpAPI For Content & Marketing Automation
  void translate() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.translate(
      text: "Hello, how are you?",
      language: SharpApiLanguages.ENGLISH,
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Translated Text *****');
      debugPrint(value.content);

      debugPrint('***** Translated Language *****');
      debugPrint(value.fromLanguage);

      debugPrint('***** Translated Language *****');
      debugPrint(value.toLanguage);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void detectSpam() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.detectSpam(
      text:
          "Hello, this is John from Finance Plus. I've called before,  We've helped other individuals like you improve their credit. Please give me a call later.",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Pass *****');
      debugPrint(value.pass.toString());

      debugPrint('***** Score *****');
      debugPrint(value.score.toString());

      debugPrint('***** Reason *****');
      debugPrint(value.reason);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void detectPhones() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.detectPhones(
      text: "Where to find us \n Call with a sales tech advisor: Call: 1800-394-7486 \n or our Singapore office +65 8888 8888",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      for (var element in value) {
        debugPrint('***** Phone *****');
        debugPrint(element.detectedNumber);
        debugPrint(element.parsedNumber);

        debugPrint('-----------------');
      }
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void detectEmails() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.detectEmails(
      text:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Contact us at example@email.com or lorem.ipsum@email.com for more information.",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      for (var element in value) {
        debugPrint('***** Email *****');
        debugPrint(element.toString());
        debugPrint('-----------------');
      }
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void summarizeText() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.summarizeText(
      text:
          "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in light rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is. It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the track will be good, maybe it will be bad. It was so-so on the [simulator]. Don't knock it 'til you try it. I hear there are a lot of people complaining about the direction [F1 president] Stefano [Domenicali] and [owners] Liberty have been going [but] I think they have been doing an amazing job.\"",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Summary *****');
      debugPrint(value.summary);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void generateKeywords() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.generateKeywords(
      text:
          "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in light rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is. It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the track will be good, maybe it will be bad. It was so-so on the [simulator]. \"",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      value.keywords?.forEach((element) {
        debugPrint('keyword: ${element.toString()}');
        debugPrint('-----------------');
      });
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void paraphrase() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.paraphrase(
      text: "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in light rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is. It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the track will be good, maybe it will be bad. It was so-so on the [simulator]. Don't knock it 'til you try it. I hear there are a lot of people complaining about the direction [F1 president] Stefano [Domenicali] and [owners] Liberty have been going [but] I think they have been doing an amazing job b.\"",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Paraphrase *****');
      debugPrint(value.paraphrase);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void proofread() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.proofread(
      text: "Red Bull's Max Verstappen says this weekend's Las Vegas Grand Prix is \"99% show and 1% sporting event\". \n\n The triple world champion said he is \"not looking forward\" to the razzmatazz around the race, the first time Formula 1 cars have raced down the city's famous Strip. \n\n Other leading drivers were more equivocal about the hype.\n\n Aston Martin's Fernando Alonso said: \"With the investment that has been made and the place we are racing, it deserves a little bit [of] different treatment and extra show.\" \n\n The weekend was kick-started on Wednesday evening with a lavish opening ceremony.\n\n It featured performances from several music stars, including Kylie Minogue and Journey, and culminated in the drivers being introduced to a sparsely populated crowd in rain by being lifted into view on hydraulic platforms under a sound-and-light show. \n\n Lewis Hamilton said: \"It's amazing to be here. It is exciting - such an incredible place, so many lights, a great energy, a great buzz. \n\n \"This is one of the most iconic cities there is.  It is a big show, for sure. It is never going to be like Silverstone [in terms of history and purity]. But maybe over time the people in the community here will grow to love the sport.\" \n\n Hamilton added: \"It is a business, ultimately. You'll still see good racing here. \n\n \"Maybe the  track will be good, maybe it will be bad. It was so-so on the [simulator]. Don't knock it 'til you try it. I hear there are a lot of people complaining about the direction [F1 president] Stefano [Domenicali] and [owners] Liberty have been going [but] I think they have been doing an amazing job.\"",
    ).then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Proofread *****');
      debugPrint(value.proofread);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  // subscription info
  void quota() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.quota().then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Timestamp *****');
      debugPrint(value.timestamp);

      debugPrint('***** Subscription Words Quota *****');
      debugPrint(value.subscriptionWordsQuota.toString());

      debugPrint('***** Subscription Words Used *****');
      debugPrint(value.subscriptionWordsUsed.toString());

      debugPrint('***** Subscription Words Used Percentage *****');
      debugPrint(value.subscriptionWordsUsedPercentage.toString());

      debugPrint('***** On Trial *****');
      debugPrint(value.onTrial.toString());

      debugPrint('***** Trial Ends *****');
      debugPrint(value.trialEnds);

      debugPrint('***** Subscribed *****');
      debugPrint(value.subscribed.toString());

      debugPrint('***** Current Subscription Start *****');
      debugPrint(value.currentSubscriptionStart);

      debugPrint('***** Current Subscription End *****');
      debugPrint(value.currentSubscriptionEnd);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }

  void ping() async {
    setState(() {
      isJobStatusPolling = true;
    });

    SharpApi.ping().then((value) {
      setState(() {
        isJobStatusPolling = false;
      });

      displaySuccessSnackBar();

      debugPrint('***** Timestamp *****');
      debugPrint(value.timestamp);

      debugPrint('***** Ping *****');
      debugPrint(value.ping);
    }).catchError((e) {
      setState(() {
        isJobStatusPolling = false;
      });

      debugPrint('error ==>> ${e.message}');

      displayErrorSnackBar(
        message: e.message,
      );
    });
  }
}

class PrimaryElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const PrimaryElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
    );
  }
}