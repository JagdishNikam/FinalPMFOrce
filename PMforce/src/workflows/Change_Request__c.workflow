<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_to_Project_Manager_when_new_CR_is_created</fullName>
        <ccEmails>dnyanesh.gawali@aress.com;</ccEmails>
        <ccEmails>prosenjit.mahalanobis@aress.com;</ccEmails>
        <description>Send email to Project Manager when new CR is created</description>
        <protected>false</protected>
        <recipients>
            <field>manager_emial__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>PMForce_Email_Templates/CR_Creation_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>update_Actual_Efforts_on_Project</fullName>
        <field>Actual_CR_Efforts_in_hrs_del__c</field>
        <formula>Actual_CR_Efforts_in_hrs__c</formula>
        <name>update Actual Efforts on Project</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Project__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_TM_record_type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>TM_CR</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update TM record type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_email_on_CR</fullName>
        <field>manager_emial__c</field>
        <formula>Project__r.Project_Manager__r.Email</formula>
        <name>update email on CR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_email_on_CR1</fullName>
        <field>manager_emial__c</field>
        <formula>Project__r.Project_Manager__r.Email</formula>
        <name>update email on CR</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_record_type_to_FP</fullName>
        <field>RecordTypeId</field>
        <lookupValue>FP_CR</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>update record type to FP</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Notify PM when new CR created</fullName>
        <actions>
            <name>Send_email_to_Project_Manager_when_new_CR_is_created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Change_Request__c.CR_Name__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Set FP Record Type of CR</fullName>
        <actions>
            <name>update_record_type_to_FP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Change_Request__c.RecordType__c</field>
            <operation>contains</operation>
            <value>FP CR</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Set TM Record Type of CR</fullName>
        <actions>
            <name>update_TM_record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Change_Request__c.RecordType__c</field>
            <operation>contains</operation>
            <value>TM CR</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>update Actual Efforts on Project</fullName>
        <actions>
            <name>update_Actual_Efforts_on_Project</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Change_Request__c.Actual_CR_Efforts_in_hrs__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>update email on CR</fullName>
        <actions>
            <name>update_email_on_CR1</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Project__c.Manager_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
