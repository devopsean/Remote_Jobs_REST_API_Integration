// To parse this JSON data, do
//
//     final jobModel = jobModelFromJson(jsonString);

import 'dart:convert';

JobModel jobModelFromJson(String str) => JobModel.fromJson(json.decode(str));

String jobModelToJson(JobModel data) => json.encode(data.toJson());

class JobModel {
  JobModel({
    this.the0LegalNotice,
    this.jobCount,
    this.jobs,
  });

  String the0LegalNotice;
  int jobCount;
  List<Job> jobs;

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    the0LegalNotice: json["0-legal-notice"],
    jobCount: json["job-count"],
    jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "0-legal-notice": the0LegalNotice,
    "job-count": jobCount,
    "jobs": List<dynamic>.from(jobs.map((x) => x.toJson())),
  };
}

class Job {
  Job({
    this.id,
    this.url,
    this.title,
    this.companyName,
    this.category,
    this.tags,
    this.jobType,
    this.publicationDate,
    this.candidateRequiredLocation,
    this.salary,
    this.description,
  });

  int id;
  String url;
  String title;
  String companyName;
  String category;
  List<dynamic> tags;
  String jobType;
  DateTime publicationDate;
  String candidateRequiredLocation;
  String salary;
  String description;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    url: json["url"],
    title: json["title"],
    companyName: json["company_name"],
    category: json["category"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
    jobType: json["job_type"],
    publicationDate: DateTime.parse(json["publication_date"]),
    candidateRequiredLocation: json["candidate_required_location"],
    salary: json["salary"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "title": title,
    "company_name": companyName,
    "category": category,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "job_type": jobType,
    "publication_date": publicationDate.toIso8601String(),
    "candidate_required_location": candidateRequiredLocation,
    "salary": salary,
    "description": description,
  };
}
