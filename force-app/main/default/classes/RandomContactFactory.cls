public class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numContacts, String lastName) {
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 1; i <= numContacts; i++) {
            Contact newContact = new Contact(
                FirstName = 'Test ' + i,
                LastName = lastName
            );
            contacts.add(newContact);
        }
        return contacts;
    }

}