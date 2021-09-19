import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:remote_jobs_rest_api/models/job_post.dart';

class URLStrings {
  static String jobURL = 'https://remotive.io/api/remote-jobs?limit=';
}

class JobService {
  Future<List<Job>> getJobs(int limit) async {
    var client = http.Client();
    var jobModel;
    try {
      var response =
          await client.get(Uri.parse(URLStrings.jobURL + limit.toString()));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        jobModel = JobModel.fromJson(jsonMap).jobs;

      }
    } catch (Exception) {
      return jobModel;
    }
    return jobModel;
  }
  Future<List<Job>> searchJobs(int limit) async {
    var client = http.Client();
    var jobModel;
    try {
      var response =
      await client.get(Uri.parse(URLStrings.jobURL + limit.toString()));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        jobModel = JobModel.fromJson(jsonMap).jobs;

      }
    } catch (Exception) {
      return jobModel;
    }
    return jobModel;
  }
}
