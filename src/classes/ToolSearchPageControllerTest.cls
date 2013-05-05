public with sharing class ToolSearchPageControllerTest {


  // the soql without the order and limit
  public String soql {get;set;}
  private String qlisoql {get;set;}
  // the collection of tools to display
  public List<User> tools {get;set;}
 
  // the current sort direction. defaults to asc
  public String sortDir {
    get  { if (sortDir == null) {  sortDir = 'asc'; } return sortDir;  }
    set;
  }
  
  public String sortField {
    get  { if (sortField == null) {sortField = 'Id'; } return sortField;  }
    set;
  }
  
  public String debugSoql {
    get { return soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10'; }
    set;
  }
 
  // init the controller and display some sample data when the page loads
  public ToolSearchPageControllerTest() {
    soql = 'select Id, Active2__c, Username, LastName, FirstName, Name, CompanyName, Division, Department, Title, Street, City, State, PostalCode, Country, Email, Phone, Fax, MobilePhone, Alias, CommunityNickname, IsActive, SmallPhotoUrl from User where Profile.Name LIKE \'%'+String.escapeSingleQuotes('Portal')+'%\'';
    
    runQuery();
  }
 
  // toggles the sorting of query from asc<-->desc
  public void toggleSort() {
    // simply toggle the direction
    sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
    // run the query again
    runQuery();
  }
 
  // runs the actual query
  public void runQuery() {
 
    try {
      tools = Database.query(soql + ' order by ' + sortField + ' ' + sortDir + ' limit 10');
    } catch (Exception e) {
      
    }
 
  }
 
  // runs the search with parameters passed via Javascript
  public PageReference runSearch() {
 
    String spectype = '';
    String classt = Apexpages.currentPage().getParameters().get('classt');
    String specdetail = Apexpages.currentPage().getParameters().get('specdetail');
    String statust = Apexpages.currentPage().getParameters().get('statust');
    String SpecType_1 = Apexpages.currentPage().getParameters().get('SpecType_1');
    String SpecType_2 = Apexpages.currentPage().getParameters().get('SpecType_2');
    String SpecType_3 = Apexpages.currentPage().getParameters().get('SpecType_3');
    String SpecType_4 = Apexpages.currentPage().getParameters().get('SpecType_4');
    String SpecType_5 = Apexpages.currentPage().getParameters().get('SpecType_5');
    String SpecType_6 = Apexpages.currentPage().getParameters().get('SpecType_6');
    String SpecType_7 = Apexpages.currentPage().getParameters().get('SpecType_7');
    String SpecType_8 = Apexpages.currentPage().getParameters().get('SpecType_8');
    String SpecType_9 = Apexpages.currentPage().getParameters().get('SpecType_9');
    String SpecType_10 = Apexpages.currentPage().getParameters().get('SpecType_10');
    String SpecType_11 = Apexpages.currentPage().getParameters().get('SpecType_11');
    String SpecType_12 = Apexpages.currentPage().getParameters().get('SpecType_12');
    String SpecType_13 = Apexpages.currentPage().getParameters().get('SpecType_13');
    String SpecType_14 = Apexpages.currentPage().getParameters().get('SpecType_14');
    String SpecType_15 = Apexpages.currentPage().getParameters().get('SpecType_15');
    String SpecType_16 = Apexpages.currentPage().getParameters().get('SpecType_16');
    String SpecType_17 = Apexpages.currentPage().getParameters().get('SpecType_17');
    String SpecType_18 = Apexpages.currentPage().getParameters().get('SpecType_18');
    
 
    soql = 'select Id, Active__c, Username, LastName, FirstName, Name, CompanyName, Division, Department, Title, Street, City, State, PostalCode, Country, Email, Phone, Fax, MobilePhone, Alias, CommunityNickname, IsActive, SmallPhotoUrl from User where Name != null';
    if (!SpecType_1.equals('false'))
      spectype += 'Asia';
    if (!SpecType_2.equals('false'))
      spectype += ';Europe';
    if (!SpecType_3.equals('false'))
      spectype += ';United Kingdom';
    if (!SpecType_4.equals('false'))
      spectype += ';yellow';
    if (!SpecType_5.equals('false'))
      spectype += '(;red';
    if (!SpecType_6.equals('false'))
      spectype += ';green';
    if (!SpecType_7.equals('false'))
      spectype += ';South America';
    if (!SpecType_8.equals('false'))
      spectype += ';North America';      
    if (!SpecType_9.equals('false'))
      spectype += ';Spain';
    if (!SpecType_10.equals('false'))
      spectype += ';zinc';
    if (!SpecType_11.equals('false'))
      spectype += ';steel';
    if (!SpecType_12.equals('false'))
      spectype += ';carbon';
    if (!SpecType_13.equals('false'))
      spectype += ';oversized';
    if (!SpecType_14.equals('false'))
      spectype += ';standard';
    if (!SpecType_15.equals('false'))
      spectype += ';metric';
    if (!SpecType_16.equals('false'))
      spectype += ';polishing';
    if (!SpecType_17.equals('false'))
      spectype += ';sizing';
    if (!SpecType_18.equals('false'))
      spectype += ';calibration';      
    if (!statust.equals(''))
      soql += ' and Status__c like \''+String.escapeSingleQuotes(statust)+'%\'';
    if (!classt.equals(''))
      soql += ' and Class__c like \''+String.escapeSingleQuotes(classt)+'%\'';
    if (!specdetail.equals(''))
      soql += ' and Spec_Detail__c like \'%'+String.escapeSingleQuotes(specdetail)+'%\'';
    if (!spectype.equals(''))
      soql += ' and Spec_Function__c includes (\''+ spectype +'\')';
 
    // run the query again
    runQuery();
 
    return null;
  }
 
  // use apex describe to build the picklist values
  public List<String> StatusToolValues {
    get {
      if (StatusToolValues == null) {
 
        StatusToolValues = new List<String>();
        Schema.DescribeFieldResult field = Tools__c.Status__c.getDescribe();
 
        for (Schema.PicklistEntry f : field.getPicklistValues())
          StatusToolValues.add(f.getLabel());
 
      }
      return StatusToolValues;          
    }
    set;
  }
  
  // use apex describe to build the User Profile picklist values
  public List<String> ProfileValues {
    get {
      if (ProfileValues == null) {
 
        ProfileValues = new List<String>();
        Schema.DescribeFieldResult field = User.Profile.Name.getDescribe();
 
        for (Schema.PicklistEntry f : field.getPicklistValues())
          ProfileValues.add(f.getLabel());
 
      }
      return ProfileValues;          
    }
    set;
  }
  
  // use apex describe to build the User Role picklist values
  public List<String> RoleValues {
    get {
      if (RoleValues == null) {
 
        RoleValues = new List<String>();
        Schema.DescribeFieldResult field = User.Role.Name.getDescribe();
 
        for (Schema.PicklistEntry f : field.getPicklistValues())
          RoleValues.add(f.getLabel());
 
      }
      return RoleValues;          
    }
    set;
  }

  public pageReference refresh(Integer pageNumber) 
  {
       setCon = null;
       setCon.setPageSize(100);
       noOfRecords = setCon.getResultSize();
      
       return null;
  }

  public PageReference disableSelectedUsers() 
  {
      List<User> updatedUsers = new List<User>();
      for (User u : (List<User>) setCon.getRecords())
      {
          if (u.isActive == true)
          {
            u.IsActive = false;
            updatedUsers.add(u);
          }
      }
      update updatedUsers;
      return null;
  }

  Public Integer noOfRecords{get; set;}

  public ApexPages.StandardSetController setCon {
        get {
                if (setCon == null)
                {
                  setCon = new ApexPages.StandardSetController(Database.getQueryLocator(soql));
                
                  setCon.setPageSize(100);
                  noOfRecords = setCon.getResultSize();
                }

                return setCon;
        }
        set;
    }   

    public List<User> getUsers() {
        return (List<User>) setCon.getRecords();
    }
}