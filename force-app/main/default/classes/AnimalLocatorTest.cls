// AnimalLocatorTest.cls
@isTest
public class AnimalLocatorTest {
    public class AnimalLocatorMock implements HttpCalloutMock {
        private String mockResponseBody;
        
        public AnimalLocatorMock(String mockResponseBody) {
            this.mockResponseBody = mockResponseBody;
        }
        
        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody(mockResponseBody);
            response.setStatusCode(200);
            return response;
        }
    }
    
    @isTest
    public static void testGetAnimalNameById() {
        // Create a mock response
        String mockResponse = '{"name": "Lion"}';
        AnimalLocatorTest.AnimalLocatorMock animalLocatorMock = new AnimalLocatorTest.AnimalLocatorMock(mockResponse);
        Test.setMock(HttpCalloutMock.class, animalLocatorMock);
        
        Test.startTest();
        String animalName = AnimalLocator.getAnimalNameById(123);
        Test.stopTest();
        
        System.assertEquals('Lion', animalName);
    }
}