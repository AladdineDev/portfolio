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
        tooltip: "LinkedIn",
        url: "https://www.linkedin.com/in/aladdine-abdou/",
        icon: FontAwesomeIcons.linkedin,
      ),
      Contact(
        tooltip: "Github",
        url: "https://www.github.com/Aaldn",
        icon: FontAwesomeIcons.github,
      ),
      Contact(
        tooltip: "aladdine.abdou@gmail.com",
        url: "mailto:aladdine.abdou@gmail.com",
        icon: FontAwesomeIcons.solidEnvelope,
      ),
      Contact(
        tooltip: "+33 7 82 54 34 70",
        url: "tel:+33782543470",
        icon: FontAwesomeIcons.phone,
      ),
    ];
  }
}
