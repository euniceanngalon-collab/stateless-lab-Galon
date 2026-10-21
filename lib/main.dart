
import 'package:flutter/material.dart';

void main() {
  runApp(const DirectoryApp());
}

// This class stores the fixed information of each student.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// This constant list contains five hard-coded student records.
const List<Student> students = [
  Student(
    name: 'Eunice Galon',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'eunice@example.com',
  ),
  Student(
    name: 'Jana D. Torino',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'jana@example.com',
  ),
  Student(
    name: 'Lovely Rozano',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'lovely@example.com',
  ),
  Student(
    name: 'Yaohan M. Macoto',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'yaohan@example.com',
  ),
  Student(
    name: 'Jelyn T. Tac-an',
    course: 'BS Information Technology',
    yearLevel: 1,
    email: 'jelyn@example.com',
  ),
];

// Stateless because this app only sets the theme and displays the directory.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Directory',
      theme: ThemeData(
        // Customization 1: Pink color scheme for the app.
        colorSchemeSeed: const Color(0xFFFF1493),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF0F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF69B4),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const DirectoryScreen(),
    );
  }
}

// Stateless because it displays the fixed directory and student list.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85,
        title: const Column(
          children: [
            Text(
              '🎀 Campus Directory 🎀',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Barbie Charm School',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SectionHeader(title: '♡ Students ♡'),
          const SizedBox(height: 16),
          for (final student in students)
            StudentCard(student: student),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              '♡ Dream • Learn • Grow ♡',
              style: TextStyle(
                color: Color(0xFFFF1493),
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Stateless because the section title is provided by its parent.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF1493),
          ),
        ),
        const Divider(
          thickness: 2,
          color: Color(0xFFFF69B4),
        ),
      ],
    );
  }
}

// Stateless because it only displays the icon and text it receives.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: const Color(0xFFFF1493),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF704060),
            ),
          ),
        ),
      ],
    );
  }
}

// Stateless because it displays the Student data passed by its parent.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 2: Rounded corners and a pink border.
      margin: const EdgeInsets.only(bottom: 14),
      color: Colors.white,
      elevation: 3,
      shadowColor: const Color(0xFFFFB6D9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: Color(0xFFFFB6D9),
          width: 1.5,
        ),
      ),
      child: Padding(
        // Customization 3: Extra padding inside each student card.
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                CircleAvatar(
                  // Customization 4: Pink avatar with the student's initial.
                  radius: 28,
                  backgroundColor: const Color(0xFFFFD6E9),
                  child: Text(
                    student.name[0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF1493),
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                const Icon(
                  Icons.favorite,
                  color: Color(0xFFFF69B4),
                  size: 18,
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF1493),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    student.course,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF704060),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level: ${student.yearLevel}',
                  ),
                  const SizedBox(height: 6),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
