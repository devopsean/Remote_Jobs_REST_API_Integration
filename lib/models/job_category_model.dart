// To parse this JSON data, do
//
//     final jobCategoryModel = jobCategoryModelFromJson(jsonString);

import 'dart:convert';

JobCategoryModel jobCategoryModelFromJson(String str) => JobCategoryModel.fromJson(json.decode(str));

String jobCategoryModelToJson(JobCategoryModel data) => json.encode(data.toJson());

class JobCategoryModel {
  JobCategoryModel({
    this.the0LegalNotice,
    this.jobCount,
    this.jobs,
  });

  String the0LegalNotice;
  int jobCount;
  List<Job> jobs;

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) => JobCategoryModel(
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
    this.name,
    this.slug,
  });

  int id;
  String name;
  String slug;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}
