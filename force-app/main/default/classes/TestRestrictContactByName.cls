@isTest
private class TestRestrictContactByName {
    
    @isTest
    static void testValidContact() {
        // create a valid contact
        Contact validContact = new Contact(LastName = 'Smith', Email = 'smith@example.com');
        insert validContact;
        // ensure the contact was inserted successfully
        Contact retrievedContact = [SELECT Id FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals(validContact.Id, retrievedContact.Id);
    }
    
    @isTest
    static void testInvalidContact() {
        // create an invalid contact
        Contact invalidContact = new Contact(LastName = 'INVALIDNAME');
        insert invalidContact;
        try {
            // if the contact was inserted successfully, fail the test
            System.assert(false, 'Expected exception was not thrown');
        } catch (DmlException e) {
            // ensure the error message is correct
            System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', e.getMessage());
        }  
    }
    
    @isTest
    static void testUpdateValidContact() {
        // create a valid contact
        Contact validContact = new Contact(LastName = 'Smith', Email = 'smith@example.com');
        insert validContact;
        // update the contact with a valid last name
        validContact.LastName = 'Johnson';
        update validContact;
        // ensure the contact was updated successfully
        Contact retrievedContact = [SELECT Id, LastName FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals('Johnson', retrievedContact.LastName);
    }
    
}