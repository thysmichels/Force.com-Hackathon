@isTest(SeeAllData=true)
private class TestToolSearchPageController {
    
     static testMethod void testToolSearch() {
     
     Account a = new Account();
     a.Name = 'test';
     insert a;
     
     Contact c = new Contact();
     c.FirstName = 'first';
     c.LastName = 'last';
     c.AccountId = a.Id;
     insert c;
     
     Profile pf = [Select Id from Profile where Name = 'Customer Portal Manager Standard'];
     
     User u = new User();
     u.FirstName = 'Joe';
     u.LastName = 'Smith';
     u.Email = 'testuser@test123456789.com';
     u.CompanyName = 'test.com';
     u.Title = 'Test User';
     u.Username = 'testuser@test12349.com';
     u.Alias = 'tuser';
     u.CommunityNickname = 'Test User';
     u.TimeZoneSidKey = 'America/Denver';
     u.LocaleSidKey = 'en_US';
     u.EmailEncodingKey = 'ISO-8859-1';
     u.ProfileId = pf.Id;
     u.ContactId = c.Id;
     u.LanguageLocaleKey = 'en_US';
     insert u; 
     
     Test.StartTest();
     
      //instantiate a page     
     PageReference pg = Page.ToolSearch;
        Test.setCurrentPage(pg);
      
        pg.getParameters().put('acctname', 'test');
        pg.getParameters().put('ProfileValues', 'Active');
        pg.getParameters().put('RoleValues', 'Customer Portal Manager Standard');
        
             // instantiate the controller
        ToolSearchPageController controller=new ToolSearchPageController();
        System.assert(controller.runSearch() == null);
    // change to Role and Profile filter inputs -->    System.assertequals(controller.StatusToolValues[0], 'Ready');

    controller.toggleSort();
    System.assertequals (controller.sortDir, 'desc');

    List<String> testStatust = new List<String>();

    controller.sortField = 'Some invalid sort field';
    controller.runQuery();
    controller.refresh();
    controller.disableSelectedUsers();
    
    Test.StopTest();
    
      }
 }