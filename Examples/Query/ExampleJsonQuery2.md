# Example of use of Json Functions

Example: getting from a Json that contains data about exams
a row for each exam with Name, Surname of person and Exam Name and Date 

``` SQL

--- load json in @j variable

declare @j nvarchar(max) ='{
  "Attachments": true,
  "Progress": {
    "completedLearningItems": [
      {
        "title": "learn-bizapps.intro-business-process-flows.1-introduction",
        "type": "unit",
        "completedAt": "2021-04-30T15:25:29.0693367Z"
      },
      {
        "title": "learn.wwl.manage-azure-paas-resources-using-automated-methods.introduction",
        "type": "unit",
        "completedAt": "2021-04-30T15:29:54.8286851Z"
      },
      {
        "title": "learn.wwl.manage-azure-paas-resources-using-automated-methods.use-azure-subscriptions-tag-azure-resources",
        "type": "unit",
        "completedAt": "2021-05-04T15:34:32.0108147Z"
      },
      {
        "title": "learn.azure.intro-to-azure-fundamentals.introduction",
        "type": "unit",
        "completedAt": "2021-05-04T15:55:17.2565739Z"
      },
      {
        "title": "learn.wwl.analyze-text-with-text-analytics-service.introduction",
        "type": "unit",
        "completedAt": "2021-10-01T07:14:46.4475704Z"
      },
      {
        "title": "learn.wwl.introduction-to-azure-synapse-analytics.when-to-use",
        "type": "unit",
        "completedAt": "2021-10-01T07:21:30.709662Z"
      },
      {
        "title": "learn.mec.hybrid-learning-for-the-adolescent-learner.overview",
        "type": "unit",
        "completedAt": "2022-04-24T07:44:48.222352Z"
      }
    ]
  },
  "Ratings": null,
  "Challenges": null,
  "XP": {
    "totalPoints": 700,
    "level": {
      "levelNumber": 1,
      "pointsLow": 0,
      "pointsHigh": 1799
    },
    "nextLevelNumber": 2,
    "currentLevelPointsEarned": 700,
    "pointsToNextLevel": 1100,
    "achievements": []
  },
  "Assessments": null,
  "TechProfile": {
    "email": "franco.pigoli@outlook.com",
    "locale": "it-it",
    "country": "IT",
    "contactPointTopicSetting": "OptInExplicit",
    "gsi": null,
    "isAvatarTakenDown": null,
    "isInstructor": false,
    "isMecUser": false,
    "source": "docs",
    "acceptedPrivacyNotice": null,
    "authenticationModes": [
      {
        "id": "00037FFE807C4687",
        "type": "MSA",
        "tenantId": "9188040d-6c67-4c5b-b112-36a304b66dad",
        "upn": "franco.pigoli@outlook.com",
        "oid": "00000000-0000-0000-94f7-4ce9fb05ad48",
        "dateAcceptedPrivacyNotice": null,
        "dateAdded": "2019-07-22T21:44:36.3307357+00:00"
      }
    ],
    "interests": null,
    "groups": null,
    "transcriptSettings": {
      "publicLink": {
        "showLegalName": true,
        "showMCID": true,
        "showContactEmail": true
      },
      "print": {
        "showLegalName": true,
        "showMCID": true,
        "showContactEmail": true
      }
    },
    "certificationSettings": {
      "print": {
        "showLegalName": true,
        "showMCID": true,
        "showContactEmail": true
      }
    },
    "userId": "807c4687-7ffe-0003-0000-000000000000",
    "userName": "FrancoPigoli-6921",
    "displayName": "Franco Pigoli",
    "avatarUrl": null,
    "avatarThumbnailUrl": null,
    "isPrivate": false,
    "isMicrosoftUser": false,
    "isMvp": false,
    "qnaUserId": "1059165",
    "followerCount": 0,
    "followingCount": 0,
    "answersAccepted": 0,
    "reputationPoints": 1,
    "createdOn": "2019-06-03T11:04:10.5257433+00:00"
  },
  "Lists": [
    {
      "id": "8pz2cmokmn73e1",
      "userId": "807c4687-7ffe-0003-0000-000000000000",
      "name": "Renewal assessment material - 4-29-2021 (Data Factory e Synapse)",
      "description": "",
      "type": "collection",
      "lastModified": "2022-05-19T15:25:26+00:00",
      "totalItems": 5,
      "items": [
        {
          "id": "8pz2cmokmn73e1_docs-BB2C89130AD1FB5FAD08B96203E622D6",
          "listId": "8pz2cmokmn73e1",
          "type": "docs",
          "data": {
            "docId": "",
            "docVIId": "",
            "pageType": "",
            "pageKind": "",
            "uid": "learn.wwl.petabyte-scale-ingestion-azure-data-factory",
            "title": "",
            "url": "",
            "rawUrl": ""
          },
          "lastModified": "2021-04-29T06:49:24+00:00"
        },
        {
          "id": "8pz2cmokmn73e1_docs-C151C8F39A3C9D9BCAF6640EE3E56818",
          "listId": "8pz2cmokmn73e1",
          "type": "docs",
          "data": {
            "docId": "",
            "docVIId": "",
            "pageType": "",
            "pageKind": "",
            "uid": "learn.wwl.perform-code-free-transformation-scale-azure-data-factory",
            "title": "",
            "url": "",
            "rawUrl": ""
          },
          "lastModified": "2021-04-29T06:49:24+00:00"
        },
        {
          "id": "8pz2cmokmn73e1_docs-F3B3B575313D24A6F92C7CEC5F2E75AA",
          "listId": "8pz2cmokmn73e1",
          "type": "docs",
          "data": {
            "docId": "",
            "docVIId": "",
            "pageType": "",
            "pageKind": "",
            "uid": "learn.wwl.integrate-data-azure-data-factory",
            "title": "",
            "url": "",
            "rawUrl": ""
          },
          "lastModified": "2021-04-29T06:49:24+00:00"
        },
        {
          "id": "8pz2cmokmn73e1_docs-00C931F3F59AD2752CECA8980D6B8E5F",
          "listId": "8pz2cmokmn73e1",
          "type": "docs",
          "data": {
            "docId": "",
            "docVIId": "",
            "pageType": "",
            "pageKind": "",
            "uid": "learn.data-ai.design-azure-sql-data-warehouse",
            "title": "",
            "url": "",
            "rawUrl": ""
          },
          "lastModified": "2021-04-29T06:49:24+00:00"
        },
        {
          "id": "8pz2cmokmn73e1_docs-FA43F838CD2130B6CA76CACED8B4A1FB",
          "listId": "8pz2cmokmn73e1",
          "type": "docs",
          "data": {
            "docId": "",
            "docVIId": "",
            "pageType": "",
            "pageKind": "",
            "uid": "learn.data-ai.import-data-into-asdw-with-polybase",
            "title": "",
            "url": "",
            "rawUrl": ""
          },
          "lastModified": "2021-04-29T06:49:24+00:00"
        }
      ],
      "itemCount": 5,
      "sections": [],
      "sectionCount": 0,
      "isOfficial": false,
      "shouldLocalize": false,
      "isFallbackLocale": false,
      "showUserDisplayName": false,
      "challengeId": null,
      "studyGuideId": null,
      "moduleCount": 0,
      "completedModuleCount": 0,
      "remainingDuration": 0,
      "totalDuration": 0
    },
    {
      "id": "bookmarks",
      "userId": "807c4687-7ffe-0003-0000-000000000000",
      "name": "Bookmarks",
      "description": "",
      "type": "bookmarks",
      "lastModified": "2022-05-19T15:25:26+00:00",
      "totalItems": 0,
      "items": [],
      "itemCount": 0,
      "sections": [],
      "sectionCount": 0,
      "isOfficial": false,
      "shouldLocalize": false,
      "isFallbackLocale": false,
      "showUserDisplayName": false,
      "challengeId": null,
      "studyGuideId": null,
      "moduleCount": 0,
      "completedModuleCount": 0,
      "remainingDuration": 0,
      "totalDuration": 0
    }
  ],
  "Q&A": [],
  "Certifications": {
    "docsId": "807c4687-7ffe-0003-0000-000000000000",
    "privacySnapshots": [
      {
        "snapshotId": "27b830e8-d27d-45e5-8945-210571a6571c",
        "docsId": "807c4687-7ffe-0003-0000-000000000000",
        "renewalAssessmentUid": "acbdf90d-e45d-42fc-b8f0-d8d5fa2726e3",
        "certificationUid": "certification.azure-data-engineer",
        "locale": "en-us",
        "title": null,
        "createdAt": "2021-07-03T12:37:40.9755295+00:00",
        "timer": null,
        "snapshotScore": {
          "snapshotId": "27b830e8-d27d-45e5-8945-210571a6571c",
          "renewalAssessmentUid": "acbdf90d-e45d-42fc-b8f0-d8d5fa2726e3",
          "certificationUid": "certification.azure-data-engineer",
          "scoredAt": "2021-07-03T13:13:24.8447817+00:00",
          "questionnaireScores": [
            {
              "questionnaireUid": "68fdc26c-0f27-4c6e-838e-0a27924904a7",
              "title": "Petabyte-scale ingestion with Azure Data Factory or Azure Synapse Pipeline",
              "studyGuide": [],
              "questionsToPass": 5,
              "answersCorrect": 7,
              "passed": true,
              "questionsTotal": 7,
              "correctPercent": 100,
              "passingPercent": 71
            },
            {
              "questionnaireUid": "6f9dbf37-057d-4b92-b58d-a97d4b3ef991",
              "title": "Perform code-free transformation at scale with Azure Data Factory or Azure Synapse Pipeline",
              "studyGuide": [],
              "questionsToPass": 3,
              "answersCorrect": 3,
              "passed": true,
              "questionsTotal": 5,
              "correctPercent": 60,
              "passingPercent": 60
            },
            {
              "questionnaireUid": "806ae50b-244c-4c82-83ae-542bc0514530",
              "title": "Describe data integration patterns",
              "studyGuide": [],
              "questionsToPass": 3,
              "answersCorrect": 3,
              "passed": true,
              "questionsTotal": 4,
              "correctPercent": 75,
              "passingPercent": 75
            },
            {
              "questionnaireUid": "ef37212c-9862-47f4-953d-2666d007224d",
              "title": "Design a data warehouse with Azure Synapse Analytics",
              "studyGuide": [],
              "questionsToPass": 5,
              "answersCorrect": 5,
              "passed": true,
              "questionsTotal": 7,
              "correctPercent": 71,
              "passingPercent": 71
            },
            {
              "questionnaireUid": "850a83d3-f414-451b-a1ca-783369c42bac",
              "title": "Import data into Azure Synapse Analytics by using PolyBase",
              "studyGuide": [],
              "questionsToPass": 1,
              "answersCorrect": 2,
              "passed": true,
              "questionsTotal": 2,
              "correctPercent": 100,
              "passingPercent": 50
            }
          ],
          "assessmentIncomplete": false,
          "questionsAnswered": 0,
          "questionsToPass": 17,
          "answersCorrect": 20,
          "passed": true,
          "questionsTotal": 25,
          "correctPercent": 80,
          "passingPercent": 68
        }
      },
      {
        "snapshotId": "62cbb95d-4d2d-46dc-b969-562e78763aee",
        "docsId": "807c4687-7ffe-0003-0000-000000000000",
        "renewalAssessmentUid": "b11c4707-c985-44d3-b926-02f05aa89ffa",
        "certificationUid": "certification.azure-database-administrator-associate",
        "locale": "en-us",
        "title": null,
        "createdAt": "2022-05-19T13:44:11.1497293+00:00",
        "timer": null,
        "snapshotScore": {
          "snapshotId": "62cbb95d-4d2d-46dc-b969-562e78763aee",
          "renewalAssessmentUid": "b11c4707-c985-44d3-b926-02f05aa89ffa",
          "certificationUid": "certification.azure-database-administrator-associate",
          "scoredAt": "2022-05-19T14:37:18.6087711+00:00",
          "questionnaireScores": [
            {
              "questionnaireUid": "ccc4b4a9-c7d3-495c-ba29-46c5d07deabe",
              "title": "Configure SQL Server resources for optimal performance",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 2,
              "passed": true,
              "questionsTotal": 3,
              "correctPercent": 66,
              "passingPercent": 66
            },
            {
              "questionnaireUid": "689b3ebe-5d71-44d2-b388-6223ef8c1df4",
              "title": "Configure database authentication and authorization",
              "studyGuide": [],
              "questionsToPass": 3,
              "answersCorrect": 4,
              "passed": true,
              "questionsTotal": 5,
              "correctPercent": 80,
              "passingPercent": 60
            },
            {
              "questionnaireUid": "2208f931-6cf3-48ef-befe-c08918e6202b",
              "title": "Protect data in transit and at rest",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 4,
              "passed": true,
              "questionsTotal": 4,
              "correctPercent": 100,
              "passingPercent": 50
            },
            {
              "questionnaireUid": "af338a9d-d621-48a4-adde-91d8d4ff2934",
              "title": "Describe performance monitoring",
              "studyGuide": [
                {
                  "uid": "learn.wwl.describe-performance-monitoring",
                  "type": "Module",
                  "questionnaireUid": "af338a9d-d621-48a4-adde-91d8d4ff2934",
                  "data": null
                }
              ],
              "questionsToPass": 3,
              "answersCorrect": 2,
              "passed": false,
              "questionsTotal": 5,
              "correctPercent": 40,
              "passingPercent": 60
            },
            {
              "questionnaireUid": "afff35d1-fc8a-4d6e-9b54-bc26e4d119cd",
              "title": "Explore causes of performance issues",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 2,
              "passed": true,
              "questionsTotal": 3,
              "correctPercent": 66,
              "passingPercent": 66
            },
            {
              "questionnaireUid": "c41f0786-8a56-4098-9782-a9a53c637df2",
              "title": "Backup and restore databases",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 3,
              "passed": true,
              "questionsTotal": 4,
              "correctPercent": 75,
              "passingPercent": 50
            }
          ],
          "assessmentIncomplete": false,
          "questionsAnswered": 24,
          "questionsToPass": 14,
          "answersCorrect": 17,
          "passed": true,
          "questionsTotal": 24,
          "correctPercent": 70,
          "passingPercent": 58
        }
      },
      {
        "snapshotId": "d323cb39-f096-418a-8d00-9baeaf73b434",
        "docsId": "807c4687-7ffe-0003-0000-000000000000",
        "renewalAssessmentUid": "acbdf90d-e45d-42fc-b8f0-d8d5fa2726e3",
        "certificationUid": "certification.azure-data-engineer",
        "locale": "en-us",
        "title": null,
        "createdAt": "2022-06-13T13:55:46.2764048+00:00",
        "timer": null,
        "snapshotScore": {
          "snapshotId": "d323cb39-f096-418a-8d00-9baeaf73b434",
          "renewalAssessmentUid": "acbdf90d-e45d-42fc-b8f0-d8d5fa2726e3",
          "certificationUid": "certification.azure-data-engineer",
          "scoredAt": "2022-06-13T14:40:39.6468215+00:00",
          "questionnaireScores": [
            {
              "questionnaireUid": "01a4f1b0-6bbf-4947-89df-0b62742e50d4",
              "title": "Orchestrate data movement and transformation in Azure Data Factory or Azure Synapse Pipeline",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 4,
              "passed": true,
              "questionsTotal": 4,
              "correctPercent": 100,
              "passingPercent": 50
            },
            {
              "questionnaireUid": "2f6cd90d-74ed-4f98-bad3-9ee98d098d8b",
              "title": "Ingest data with Apache Spark notebooks in Azure Synapse Analytics",
              "studyGuide": [],
              "questionsToPass": 3,
              "answersCorrect": 5,
              "passed": true,
              "questionsTotal": 5,
              "correctPercent": 100,
              "passingPercent": 60
            },
            {
              "questionnaireUid": "dcad3aae-4253-4813-b68d-e4abd1b1ecb1",
              "title": "Query Azure Cosmos DB with SQL Serverless for Azure Synapse Analytics",
              "studyGuide": [],
              "questionsToPass": 3,
              "answersCorrect": 4,
              "passed": true,
              "questionsTotal": 5,
              "correctPercent": 80,
              "passingPercent": 60
            },
            {
              "questionnaireUid": "b83b585d-3829-485f-b611-217b35a33896",
              "title": "Use data loading best practices in Azure Synapse Analytics",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 4,
              "passed": true,
              "questionsTotal": 4,
              "correctPercent": 100,
              "passingPercent": 50
            },
            {
              "questionnaireUid": "cf873b4c-082a-4a9d-813f-c21b8b495740",
              "title": "Manage and monitor data warehouse activities in Azure Synapse Analytics",
              "studyGuide": [],
              "questionsToPass": 2,
              "answersCorrect": 3,
              "passed": true,
              "questionsTotal": 3,
              "correctPercent": 100,
              "passingPercent": 66
            },
            {
              "questionnaireUid": "444b4e1a-ae2a-488c-93f5-b6280da6753e",
              "title": "Secure a data warehouse in Azure Synapse Analytics",
              "studyGuide": [],
              "questionsToPass": 3,
              "answersCorrect": 4,
              "passed": true,
              "questionsTotal": 4,
              "correctPercent": 100,
              "passingPercent": 75
            }
          ],
          "assessmentIncomplete": false,
          "questionsAnswered": 25,
          "questionsToPass": 15,
          "answersCorrect": 24,
          "passed": true,
          "questionsTotal": 25,
          "correctPercent": 96,
          "passingPercent": 60
        }
      }
    ],
    "wwlCertifications": [
      {
        "id": "certification.nouid.1541",
        "name": null,
        "expiration": "2023-05-03T23:59:59+00:00",
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-05-03T00:00:00+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.azure-cosmos-db-developer-specialty",
        "name": null,
        "expiration": "2023-09-05T23:59:59+00:00",
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": true,
        "dateEarned": "2022-09-05T09:33:50+00:00",
        "extensionDate": "2024-09-05T23:59:59+00:00",
        "iconUrl": null,
        "stayCurrentEligibilityDate": "2023-03-09T23:59:59+00:00",
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.azure-database-administrator-associate",
        "name": null,
        "expiration": "2023-09-22T23:59:59+00:00",
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": true,
        "dateEarned": "2020-09-22T12:15:15+00:00",
        "extensionDate": "2024-09-22T23:59:59+00:00",
        "iconUrl": null,
        "stayCurrentEligibilityDate": "2023-03-26T23:59:59+00:00",
        "renewedDate": "2022-05-19T14:37:18+00:00",
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.azure-data-engineer",
        "name": null,
        "expiration": "2023-10-24T23:59:59+00:00",
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": true,
        "dateEarned": "2019-10-24T07:22:12+00:00",
        "extensionDate": "2024-10-24T23:59:59+00:00",
        "iconUrl": null,
        "stayCurrentEligibilityDate": "2023-04-27T23:59:59+00:00",
        "renewedDate": "2022-06-13T14:40:39+00:00",
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.mcsa-sql2016-database-development-certification",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-12-18T13:27:30+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.mcse-business-applications",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-08-01T07:22:19+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.mcsa-microsoft-dynamics-365-for-operations",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-07-25T13:31:58+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.mcse-data-management-analytics",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-07-19T07:16:13+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.azure-fundamentals",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-07-16T10:41:26+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.mcsa-sql2016-database-administration-certification",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2019-03-19T12:25:45+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      },
      {
        "id": "certification.nouid.507",
        "name": null,
        "expiration": null,
        "isEligibleForRecertification": false,
        "isPartOfStayCurrent": false,
        "dateEarned": "2008-07-28T14:11:50+00:00",
        "extensionDate": null,
        "iconUrl": null,
        "stayCurrentEligibilityDate": null,
        "renewedDate": null,
        "certificationNumber": null,
        "badgeShareUrl": null,
        "status": null,
        "certificationURL": null,
        "certificationRenewURL": null,
        "localizedContentMetadata": null
      }
    ],
    "wwlExamAppointments": null,
    "wwlQualifications": [
      {
        "examUid": "exam.dp-420",
        "examTitle": "Designing and Implementing Cloud-Native Applications Using Microsoft Azure Cosmos DB",
        "examNumber": "DP-420",
        "examPassed": true,
        "examDateTaken": "2022-09-05T09:33:50+00:00",
        "examBadgeShareUrl": "",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.dp-300",
        "examTitle": "Administering Microsoft Azure SQL Solutions",
        "examNumber": "DP-300",
        "examPassed": true,
        "examDateTaken": "2020-09-22T12:15:15+00:00",
        "examBadgeShareUrl": "",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.761",
        "examTitle": "Querying Data with Transact-SQL",
        "examNumber": "761",
        "examPassed": true,
        "examDateTaken": "2019-12-18T13:27:30+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/82c96c74-bd0f-4d18-af75-4872a9ef607f",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.dp-201",
        "examTitle": "Designing an Azure Data Solution",
        "examNumber": "DP-201",
        "examPassed": true,
        "examDateTaken": "2019-10-24T07:22:12+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/fd0cb73c-bbfd-411a-9818-bae92ac8a8cc",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.dp-200",
        "examTitle": "Implementing an Azure Data Solution",
        "examNumber": "DP-200",
        "examPassed": true,
        "examDateTaken": "2019-09-19T12:06:58+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/5cb2f6aa-c7c6-443b-b0ec-4367cf3ef9c0",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.mb2-716",
        "examTitle": "Microsoft Dynamics 365 Customization and Configuration",
        "examNumber": "MB2-716",
        "examPassed": true,
        "examDateTaken": "2019-08-01T07:22:19+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/65d5bd48-dc3e-46a1-b188-987d3e9d086d",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.mb6-894",
        "examTitle": "Development, Extensions and Deployment for Microsoft Dynamics 365 for Finance and Operations",
        "examNumber": "MB6-894",
        "examPassed": true,
        "examDateTaken": "2019-07-25T13:31:58+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/05336852-a43f-4ff1-bb54-0980358490e5",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.762",
        "examTitle": "Developing SQL Databases",
        "examNumber": "762",
        "examPassed": true,
        "examDateTaken": "2019-07-19T07:16:13+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/a9a72ec9-2812-434c-8d0f-853db877e5e5",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.az-900",
        "examTitle": "Microsoft Azure Fundamentals",
        "examNumber": "AZ-900",
        "examPassed": true,
        "examDateTaken": "2019-07-16T10:41:26+00:00",
        "examBadgeShareUrl": "",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.764",
        "examTitle": "Administering a SQL Database Infrastructure",
        "examNumber": "764",
        "examPassed": true,
        "examDateTaken": "2019-03-19T12:25:45+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/59619cc6-42f8-4023-b922-ad81c8d77907",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "exam.765",
        "examTitle": "Provisioning SQL Databases",
        "examNumber": "765",
        "examPassed": true,
        "examDateTaken": "2019-02-19T11:45:57+00:00",
        "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/05114a5d-e62b-4f39-87cd-2c13d0f04399",
        "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "PVUE",
        "examURL": null,
        "localizedContentMetadata": null
      },
      {
        "examUid": "",
        "examTitle": "TS: Microsoft SQL Server™ 2005 - Implementation and Maintenance",
        "examNumber": "431",
        "examPassed": true,
        "examDateTaken": "2008-07-28T14:11:50+00:00",
        "examBadgeShareUrl": "",
        "examScoreReportUrl": "",
        "examScoreReportType": "Dashboard",
        "examType": "InPerson",
        "examProvider": "Prometric",
        "examURL": null,
        "localizedContentMetadata": null
      }
    ],
    "wwlTranscript": {
      "profile": {
        "mctStatus": "Active",
        "mcId": "6384350",
        "firstName": "FRANCO",
        "middleName": "",
        "lastName": "PIGOLI",
        "preferredEmail": "franco.pigoli@outlook.com"
      },
      "activeCertifications": [
        {
          "id": "certification.nouid.1541",
          "name": "Trainer",
          "expiration": "2023-05-03T23:59:59+00:00",
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-05-03T00:00:00+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H116-3564",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/4ba81074-624f-418e-9965-fb7ad00ecc1c",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.azure-cosmos-db-developer-specialty",
          "name": "Microsoft Certified: Azure Cosmos DB Developer Specialty",
          "expiration": "2023-09-05T23:59:59+00:00",
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": true,
          "dateEarned": "2022-09-05T09:33:50+00:00",
          "extensionDate": "2024-09-05T23:59:59+00:00",
          "iconUrl": null,
          "stayCurrentEligibilityDate": "2023-03-09T23:59:59+00:00",
          "renewedDate": null,
          "certificationNumber": "I403-4159",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/bbfebd55-828e-4c4b-8210-62b1fb71a3c9",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.azure-database-administrator-associate",
          "name": "Microsoft Certified: Azure Database Administrator Associate",
          "expiration": "2023-09-22T23:59:59+00:00",
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": true,
          "dateEarned": "2020-09-22T12:15:15+00:00",
          "extensionDate": "2024-09-22T23:59:59+00:00",
          "iconUrl": null,
          "stayCurrentEligibilityDate": "2023-03-26T23:59:59+00:00",
          "renewedDate": "2022-05-19T14:37:18+00:00",
          "certificationNumber": "I273-3136",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/d0c33e05-6a74-44a2-be54-803e9ad9896c",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.azure-data-engineer",
          "name": "Microsoft Certified: Azure Data Engineer Associate",
          "expiration": "2023-10-24T23:59:59+00:00",
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": true,
          "dateEarned": "2019-10-24T07:22:12+00:00",
          "extensionDate": "2024-10-24T23:59:59+00:00",
          "iconUrl": null,
          "stayCurrentEligibilityDate": "2023-04-27T23:59:59+00:00",
          "renewedDate": "2022-06-13T14:40:39+00:00",
          "certificationNumber": "H253-0212",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/9eacaa3b-8784-44df-8b15-1337739a0796",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.mcsa-sql2016-database-development-certification",
          "name": "Microsoft® Certified Solutions Associate: SQL 2016 Database Development Charter Member",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-12-18T13:27:30+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H314-4059",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/197764d5-af6a-4232-b9f7-8864573202ec",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.mcse-business-applications",
          "name": "Microsoft® Certified Solutions Expert: Business Applications",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-08-01T07:22:19+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H201-6447",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/57bc9760-d522-448a-8304-263f38127f48",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.mcsa-microsoft-dynamics-365-for-operations",
          "name": "Microsoft® Certified Solutions Associate: Dynamics 365 for Operations",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-07-25T13:31:58+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H197-6498",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/14d7adea-65c4-4879-b909-9b84b057c3c9",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.mcse-data-management-analytics",
          "name": "Microsoft® Certified Solutions Expert: Data Management and Analytics",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-07-19T07:16:13+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H194-1102",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/128193e9-e13a-4fac-be8e-97ee3e8d010b",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.azure-fundamentals",
          "name": "Microsoft Certified: Azure Fundamentals",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-07-16T10:41:26+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H192-1754",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/d6996052-745f-43af-90b5-3cf4d6ff9ac1",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        },
        {
          "id": "certification.mcsa-sql2016-database-administration-certification",
          "name": "Microsoft® Certified Solutions Associate: SQL 2016 Database Administration Charter Member",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2019-03-19T12:25:45+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "H071-0525",
          "badgeShareUrl": "https://www.credly.com/earner/earned/share/d77f3b5f-c337-4a6c-a4f2-5b7131de566a",
          "status": "Active",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        }
      ],
      "expiredCertifications": [
        {
          "id": "certification.nouid.507",
          "name": "Microsoft® Certified Technology Specialist: SQL Server 2005",
          "expiration": null,
          "isEligibleForRecertification": false,
          "isPartOfStayCurrent": false,
          "dateEarned": "2008-07-28T14:11:50+00:00",
          "extensionDate": null,
          "iconUrl": null,
          "stayCurrentEligibilityDate": null,
          "renewedDate": null,
          "certificationNumber": "C514-4687",
          "badgeShareUrl": "",
          "status": "Retired",
          "certificationURL": null,
          "certificationRenewURL": null,
          "localizedContentMetadata": null
        }
      ],
      "passedExam": [
        {
          "examUid": "exam.dp-420",
          "examTitle": "Designing and Implementing Cloud-Native Applications Using Microsoft Azure Cosmos DB",
          "examNumber": "DP-420",
          "examPassed": true,
          "examDateTaken": "2022-09-05T09:33:50+00:00",
          "examBadgeShareUrl": "",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.dp-300",
          "examTitle": "Administering Microsoft Azure SQL Solutions",
          "examNumber": "DP-300",
          "examPassed": true,
          "examDateTaken": "2020-09-22T12:15:15+00:00",
          "examBadgeShareUrl": "",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.761",
          "examTitle": "Querying Data with Transact-SQL",
          "examNumber": "761",
          "examPassed": true,
          "examDateTaken": "2019-12-18T13:27:30+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/82c96c74-bd0f-4d18-af75-4872a9ef607f",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.dp-201",
          "examTitle": "Designing an Azure Data Solution",
          "examNumber": "DP-201",
          "examPassed": true,
          "examDateTaken": "2019-10-24T07:22:12+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/fd0cb73c-bbfd-411a-9818-bae92ac8a8cc",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.dp-200",
          "examTitle": "Implementing an Azure Data Solution",
          "examNumber": "DP-200",
          "examPassed": true,
          "examDateTaken": "2019-09-19T12:06:58+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/5cb2f6aa-c7c6-443b-b0ec-4367cf3ef9c0",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.mb2-716",
          "examTitle": "Microsoft Dynamics 365 Customization and Configuration",
          "examNumber": "MB2-716",
          "examPassed": true,
          "examDateTaken": "2019-08-01T07:22:19+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/65d5bd48-dc3e-46a1-b188-987d3e9d086d",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.mb6-894",
          "examTitle": "Development, Extensions and Deployment for Microsoft Dynamics 365 for Finance and Operations",
          "examNumber": "MB6-894",
          "examPassed": true,
          "examDateTaken": "2019-07-25T13:31:58+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/05336852-a43f-4ff1-bb54-0980358490e5",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.762",
          "examTitle": "Developing SQL Databases",
          "examNumber": "762",
          "examPassed": true,
          "examDateTaken": "2019-07-19T07:16:13+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/a9a72ec9-2812-434c-8d0f-853db877e5e5",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.az-900",
          "examTitle": "Microsoft Azure Fundamentals",
          "examNumber": "AZ-900",
          "examPassed": true,
          "examDateTaken": "2019-07-16T10:41:26+00:00",
          "examBadgeShareUrl": "",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.764",
          "examTitle": "Administering a SQL Database Infrastructure",
          "examNumber": "764",
          "examPassed": true,
          "examDateTaken": "2019-03-19T12:25:45+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/59619cc6-42f8-4023-b922-ad81c8d77907",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "exam.765",
          "examTitle": "Provisioning SQL Databases",
          "examNumber": "765",
          "examPassed": true,
          "examDateTaken": "2019-02-19T11:45:57+00:00",
          "examBadgeShareUrl": "https://www.credly.com/earner/earned/share/05114a5d-e62b-4f39-87cd-2c13d0f04399",
          "examScoreReportUrl": "https://examregistration.microsoft.com/?action=4&locale=en-us&returnToLearningUrl=https://www.microsoft.com/learning/en-us/dashboard.aspx",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "PVUE",
          "examURL": null,
          "localizedContentMetadata": null
        },
        {
          "examUid": "",
          "examTitle": "TS: Microsoft SQL Server™ 2005 - Implementation and Maintenance",
          "examNumber": "431",
          "examPassed": true,
          "examDateTaken": "2008-07-28T14:11:50+00:00",
          "examBadgeShareUrl": "",
          "examScoreReportUrl": "",
          "examScoreReportType": "Dashboard",
          "examType": "InPerson",
          "examProvider": "Prometric",
          "examURL": null,
          "localizedContentMetadata": null
        }
      ],
      "qualifications": [],
      "trainerHistory": [
        {
          "title": "MCT History",
          "activeFrom": "2019-05-03T00:00:00+00:00",
          "activeTo": "2023-05-03T00:00:00+00:00"
        }
      ]
    },
    "linkedAccount": {
      "id": "807c4687-7ffe-0003-0000-000000000000",
      "mcId": "6384350",
      "puid": "00037FFE807C4687"
    }
  },
  "NextSteps": {
    "docsId": "807c4687-7ffe-0003-0000-000000000000",
    "dismissals": [],
    "enrollments": [
      {
        "id": "c3202536-e561-48bc-ac4c-86eb4cfa4b2e",
        "partitionKey": "807c4687-7ffe-0003-0000-000000000000",
        "sourceType": "learningpath",
        "sourceId": "learn-bizapps.create-business-process-flow",
        "_ts": 1619796329
      },
      {
        "id": "db905f2d-6d31-46b9-a1a8-896f89f843f9",
        "partitionKey": "807c4687-7ffe-0003-0000-000000000000",
        "sourceType": "learningpath",
        "sourceId": "learn.wwl.automate-tasks-sql-server",
        "_ts": 1619796594
      },
      {
        "id": "f64ee8ba-3158-4ae1-960e-cbeeaa50534b",
        "partitionKey": "807c4687-7ffe-0003-0000-000000000000",
        "sourceType": "learningpath",
        "sourceId": "learn.az-900-describe-cloud-concepts",
        "_ts": 1620143717
      }
    ]
  }
}';

-- get from @j variable a row for each exam with Name, Surname of person and Exam Name and Date 

select
  json_value (@j,'$.Certifications.wwlTranscript.profile.firstName') as Nome,
  json_value (@j,'$.Certifications.wwlTranscript.profile.lastName') as Cognome,
  e.* 
from openjson (@j) a
 cross apply openjson (a.value) b
 cross apply openjson (b.value) c
 cross apply openjson (c.value) d
 cross apply openjson (d.value) 
 with
 (
  examTitle varchar(200) '$.examTitle',
  examDateTaken varchar(50) '$.examDateTaken'
 ) e
 
where 
  a.[key] = 'Certifications'
  and b.[key] = 'wwlTranscript'
  and c.[key] = 'passedExam'
;

```
