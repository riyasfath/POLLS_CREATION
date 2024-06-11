import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/poll_item_model.dart';
import '../services/create_poll_popup.dart';
import '../views/view_votes_screen.dart';

class HomeController extends GetxController {
  RxList<PollItem> polls = <PollItem>[].obs;
  Rx<String?> selectedOption = Rx<String?>(null);

  final DatabaseReference _pollsRef = FirebaseDatabase.instance.ref().child('polls');

  @override
  void onInit() {
    super.onInit();
    loadPolls();
  }

  void showCreatePollPopup(BuildContext context) async {
    CreatePollBottomSheet(onPollCreated: (poll) {
      polls.add(poll);
      savePolls();
    }).show(context);
  }

  void voteForOption(String option, int pollIndex) {
    if (polls.length > pollIndex && polls[pollIndex] != null) {
      selectedOption.value = option;
      polls[pollIndex].voteForOption(option);
      savePolls();
    }
  }

  Future<void> savePolls() async {
    final encodedPolls = polls.map((poll) => poll.toJson()).toList();
    await _pollsRef.set(encodedPolls);
  }

  void viewVotes(int pollIndex) {
    if (polls.length > pollIndex && polls[pollIndex] != null) {
      Get.to(() => ViewVotesPage(polls[pollIndex]));
    } else {
      Get.snackbar('Error', 'No poll available');
    }
  }

  Future<void> loadPolls() async {
    try {
      final snapshot = await _pollsRef.once();
      if (snapshot.snapshot.value != null) {
        final List<dynamic> pollsData = snapshot.snapshot.value as List<dynamic>;
        polls.value = pollsData.map((data) => PollItem.fromJson(data)).toList();
      }
    } catch (e) {
      print('Error loading polls: $e');
    }
  }
  void deletePoll(int pollIndex) {
    if (polls.length > pollIndex && polls[pollIndex] != null) {
      polls.removeAt(pollIndex);
      savePolls();
    }
  }
}