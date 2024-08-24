import 'package:demo_app/main.dart';
import 'package:flutter/material.dart';

const baseUrl = 'https://trogon.info/tutorpro/edspark/api/';
const authToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM ";
// const authToken =
//     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE5IiwidXNlcl9pZCI6IjE5Iiwicm9sZV9pZCI6IjIiLCJyb2xlX2xhYmVsIjoiVXNlciIsInBob25lIjoiOTk0NjgwMTEwMCJ9.D0tUEBGDi8gtc1vEK6GL4aFdwDEd6uBCpIQ7G0J5fEM";
Size size = MediaQuery.of(navigatorKey.currentState!.context).size;
BuildContext globalContext = navigatorKey.currentState!.context;
