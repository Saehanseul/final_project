import 'package:final_project/features/post/view_models/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostScreen extends ConsumerStatefulWidget {
  const PostScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostScreenState();
}

class _PostScreenState extends ConsumerState<PostScreen> {
  List<Map<String, String>> moodList = [
    {"mood": "😀", "key": "mood1"},
    {"mood": "😍", "key": "mood2"},
    {"mood": "🙂", "key": "mood3"},
    {"mood": "🥳", "key": "mood4"},
    {"mood": "😭", "key": "mood5"},
    {"mood": "🤬", "key": "mood6"},
    {"mood": "🫠", "key": "mood7"},
    {"mood": "🤮", "key": "mood8"},
  ];

  String text = "";
  String selectedMood = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFEBE6C6),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "🔥 MOOD 🔥",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "How do you feel?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                style: const TextStyle(
                  fontSize: 12, // 텍스트 크기를 14로 설정. 원하는 크기로 조절 가능
                ),
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                maxLines: 7, // 여러 줄 입력이 가능하도록 설정
                keyboardType: TextInputType.multiline, // 키보드 타입을 다중 줄로 설정
                decoration: InputDecoration(
                  hintText: 'Write it down here!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    // 테두리 설정
                    borderSide: const BorderSide(),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    // 활성화되었을 때의 테두리 설정
                    borderSide: const BorderSide(
                      color: Colors.black, // 활성화되었을 때의 테두리 색상을 검은색으로 설정
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "What's your mood?",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Mood(
                    mood: "😀",
                    onTap: () {
                      setState(() {
                        selectedMood = "😀";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "😍",
                    onTap: () {
                      setState(() {
                        selectedMood = "😍";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "🙂",
                    onTap: () {
                      setState(() {
                        selectedMood = "🙂";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "🥳",
                    onTap: () {
                      setState(() {
                        selectedMood = "🥳";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "😭",
                    onTap: () {
                      setState(() {
                        selectedMood = "😭";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "🤬",
                    onTap: () {
                      setState(() {
                        selectedMood = "🤬";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "🫠",
                    onTap: () {
                      setState(() {
                        selectedMood = "🫠";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                  Mood(
                    mood: "🤮",
                    onTap: () {
                      setState(() {
                        selectedMood = "🤮";
                      });
                    },
                    selectedMood: selectedMood,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(postProvider.notifier)
                          .postUpload(text, selectedMood);
                      setState(() {
                        text = "";
                        selectedMood = "";
                      });
                      context.push("/home");
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.purpleAccent.shade100,
                      shadowColor: Colors.black, // 그림자 색상
                      elevation: 5, // 그림자 높이
                    ),
                    child: const Text(
                      'Post',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Mood extends StatelessWidget {
  final String mood;
  final VoidCallback onTap;
  final String selectedMood;

  const Mood({
    super.key,
    required this.mood,
    required this.selectedMood,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: mood == selectedMood ? Colors.purpleAccent : Colors.white,
          border: const Border(
            top: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            left: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            right: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            bottom: BorderSide(
              color: Colors.black,
              width: 4, // bottom 테두리를 더 두껍게 설정
            ),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          mood,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
