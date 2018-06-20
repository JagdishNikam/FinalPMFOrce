<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_for_greater_Project_efforts</fullName>
        <description>Notify for greater Project efforts</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PMForce_Email_Templates/Project_Efforts_Escation_Template</template>
    </alerts>
    <alerts>
        <fullName>Send_email_to_Project_Manager_when_new_project_is_created</fullName>
        <ccEmails>dnyanesh.gawali@aress.com;</ccEmails>
        <ccEmails>prosenjit.mahalanobis@aress.com;</ccEmails>
        <description>Send email to Project Manager when new project is created</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PMForce_Email_Templates/Project_Creation_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>Update_Email</fullName>
        <field>Manager_Email__c</field>
        <formula>Project_Manager__r.Email</formula>
        <name>Update Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_Record_Type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>FP</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update Record Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_TM_record_type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>TM</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update TM record type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Noitify PM when greater allocated effots</fullName>
        <actions>
            <name>Notify_for_greater_Project_efforts</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>(Total_efforts_in_hrs_including_CR__c &gt; (80/100)*Allocated_Effort_Hours__c &amp;&amp;  RecordType.Name =&quot;FP&quot;)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Notify PM when new project created</fullName>
        <actions>
            <name>Send_email_to_Project_Manager_when_new_project_is_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Project_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set FP Record Type of Project</fullName>
        <actions>
            <name>update_Record_Type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Record_Type_txt__c</field>
            <operation>contains</operation>
            <value>FP</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set TM Record Type of Projects</fullName>
        <actions>
            <name>update_TM_record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Record_Type_txt__c</field>
            <operation>contains</operation>
            <value>TM</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Update project manager email</fullName>
        <actions>
            <name>Update_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>NOT(ISBLANK(Project_Manager__c))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
