import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/features/introduction/domain/contact.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_repository.g.dart';

@riverpod
ContactRepository contactRepository(ContactRepositoryRef ref) {
  return ContactRepository();
}

class ContactRepository {
  List<Contact> fetchContacts() {
    return const [
      Contact(
        tooltip: 'LinkedIn',
        url: 'https://www.linkedin.com/in/tolulope-olaniyan-589089167',
        icon: FontAwesomeIcons.linkedin,
      ),
      Contact(
        tooltip: 'Github',
        url: 'https://www.github.com/oltoch',
        icon: FontAwesomeIcons.github,
      ),
      Contact(
        tooltip: 'otchrisola@gmail.com',
        url: 'mailto:otchrisola@gmail.com',
        icon: FontAwesomeIcons.solidEnvelope,
      ),
      Contact(
        tooltip: '+234 813 8349 445',
        url: 'tel:+2348138349445',
        icon: FontAwesomeIcons.phone,
      ),
    ];
  }
}
