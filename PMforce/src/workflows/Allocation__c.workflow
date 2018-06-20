<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_to_employee_when_allocated_to_new_poroject_CR</fullName>
        <description>Send email to employee when allocated to new poroject/CR</description>
        <protected>false</protected>
        <recipients>
            <field>EmployeeEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PMForce_Email_Templates/Project_Allocation_Template</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_employee_when_not_added_todays_timesheet</fullName>
        <ccEmails>dnyanesh.gawali@aress.com;</ccEmails>
        <ccEmails>prosenjit.mahalanobis@aress.com;</ccEmails>
        <description>Send email to employee when not added todays timesheet</description>
        <protected>false</protected>
        <recipients>
            <field>EmployeeEmail__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PMForce_Email_Templates/Daily_Timesheet_Warning</template>
    </alerts>
    <fieldUpdates>
        <fullName>update_count_again</fullName>
        <description>update Timesheet count to &apos;0&apos; again, after sending an email</description>
        <field>Today_TimeSheet__c</field>
        <formula>0</formula>
        <name>update count again</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_email</fullName>
        <field>EmployeeEmail__c</field>
        <formula>Employee__r.Email</formula>
        <name>update email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Send email to employees</fullName>
        <active>true</active>
        <description>This workflow will send an email notification to employee if they didnt add their daily timesheet</description>
        <formula>AND( isTimesheetAddedToday__c = False,  Today_TimeSheet__c = 1,  Allocation_Start_Date__c &lt;=  TODAY() )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Send_email_to_employee_when_not_added_todays_timesheet</name>
                <type>Alert</type>
            </actions>
            <actions>
                <name>update_count_again</name>
                <type>FieldUpdate</type>
            </actions>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send notification when allocated to project</fullName>
        <actions>
            <name>Send_email_to_employee_when_allocated_to_new_poroject_CR</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Allocation__c.EmployeeEmail__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Update Email</fullName>
        <actions>
            <name>update_email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Employee__r.Email))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
