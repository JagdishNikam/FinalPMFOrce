public class ProjectPageController{
    
    public String employeeId { get; set;}
    public String employeeName {get; set;} 
    public String employeecode{get;set;}
    public String crName {get;set;}
    public String CRId {get;set;}
    
    public List<Allocation__c>  listOfProjects {get;set;}
    public List<Allocation__c> listOfCR {get;set;}
    //Map of PageParameters 
    public Map<string,string> pageParams=ApexPages.currentPage().getParameters();
    
    public ProjectPageController(){}
    
    public ProjectPageController(ApexPages.StandardController con){
       employeeId = ApexPages.currentPage().getParameters().get('employeeId');
     
       if(employeeId != null){
        listOfProjects   = [SELECT Id,Project__r.Name,Project__r.Project_Name__c,Project__r.Project_Manager__c,Project__r.Stage__c,Project__r.Phase__c,
                             Allocation_End_Date__c,Allocation_Start_Date__c,Allocated_Effort_Hrs__c,Remarks__c,
                             Employee__c,Employee__r.FirstName,Name,Project__c,Employee__r.Employee_ID__c,cr__c
                             FROM Allocation__c where Employee__r.Employee_ID__c=:employeeId and cr__c = false];
            
           system.debug('++++++++++listOfProjects+++++++'+listOfProjects);
           employeeName =   string.valueOf(listOfProjects[0].Employee__r.FirstName);
           
           listOfCR = [SELECT Id, Change_RequestL__r.Project__r.Name,Project__r.Project_Name__c,Project__r.Project_Manager__c,Change_RequestL__r.Id,Change_RequestL__r.Name,Change_RequestL__r.Stage__c,
                             Change_RequestL__r.Change_Details__c,Allocation_End_Date__c,Allocation_Start_Date__c,Allocated_Effort_Hrs__c,Remarks__c,
                             Employee__c,Employee__r.FirstName,Name,Project__c,Employee__r.Employee_ID__c,cr__c
                             FROM Allocation__c where Employee__r.Employee_ID__c=:employeeId and cr__c = true];
        }  
    }
      
}