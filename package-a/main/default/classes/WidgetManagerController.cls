/**
 * Stub Apex Controller enabling runtime DI for its implementaiton via another package
 **/
public with sharing class WidgetManagerController {

    @AuraEnabled
    public static String handleButton(String userMessage) { 
        // Delegate to runtime defined class implementation injected via Custom Metadata from another package
        return ((IWidgetManagerController) Factory.newInstance(IWidgetManagerController.class)).handleButton(userMessage);
    }
}
