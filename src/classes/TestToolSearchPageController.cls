@isTest
private class TestToolSearchPageController {
    
     static testMethod void testToolSearch() {
     
     Profile pf = [Select Id from Profile where Name = 'Custom Portal Manger'];
     
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
     u.LanguageLocaleKey = 'en_US';
     insert u; 
     
     Test.StartTest();
     
      //instantiate a page     
     PageReference pg = Page.ToolSearch;
        Test.setCurrentPage(pg);
      
        pg.getParameters().put('classt', 'test first name');
        pg.getParameters().put('specdetail', 'test last name');
        pg.getParameters().put('statust', 'testt');
        pg.getParameters().put('spectype', 'test candidate source');
        pg.getParameters().put('SpecType_1', 'false');
        pg.getParameters().put('SpecType_2', 'false');
        pg.getParameters().put('SpecType_3', 'false');
        pg.getParameters().put('SpecType_4', 'false');
        pg.getParameters().put('SpecType_5', 'false');
        pg.getParameters().put('SpecType_6', 'false');
        pg.getParameters().put('SpecType_7', 'false');
        pg.getParameters().put('SpecType_8', 'false');
        pg.getParameters().put('SpecType_9', 'false');
        pg.getParameters().put('SpecType_10', 'false');
        pg.getParameters().put('SpecType_11', 'false');
        pg.getParameters().put('SpecType_12', 'false');
        pg.getParameters().put('SpecType_13', 'false');
        pg.getParameters().put('SpecType_14', 'false');
        pg.getParameters().put('SpecType_15', 'false');
        pg.getParameters().put('SpecType_16', 'false');
        pg.getParameters().put('SpecType_17', 'false');
        pg.getParameters().put('SpecType_18', 'false');
     
     // instantiate the controller
        ToolSearchPageController controller=new ToolSearchPageController();
        System.assert(controller.runSearch() == null);
    // change to Role and Profile filter inputs -->    System.assertequals(controller.StatusToolValues[0], 'Ready');

    controller.toggleSort();
    System.assertequals (controller.sortDir, 'desc');

    List<String> testStatust = new List<String>();

    controller.sortField = 'Some invalid sort field';
    controller.runQuery();
    //controller.refresh();
    //controller.disableSelectedUsers();
    
    Test.StopTest();
    
      }
 }