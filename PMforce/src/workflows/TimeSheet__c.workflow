<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>update_checkbox_on_allocation</fullName>
        <description>this will set &quot;isTimesheetAddedToday&quot; checkbox to &apos;True&apos;</description>
        <field>isTimesheetAddedToday__c</field>
        <literalValue>1</literalValue>
        <name>update checkbox on allocation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <targetObject>Project_Allocation__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_count_on_Allocation</fullName>
        <field>Today_TimeSheet__c</field>
        <formula>1</formula>
        <name>update count on Allocation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Project_Allocation__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>update_timesheet_count_on_Allocation</fullName>
        <description>update count on Allocation</description>
        <field>Today_TimeSheet__c</field>
        <formula>1</formula>
        <name>update timesheet count on Allocation</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Project_Allocation__c</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>Update timesheet count</fullName>
        <actions>
            <name>update_checkbox_on_allocation</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>update_timesheet_count_on_Allocation</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>TimeSheet__c.Date__c</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>TimeSheet__c.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
