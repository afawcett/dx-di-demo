/**
 * This class implements an interface exposed by another package to fullfil a dependency
 *   it is registered via Custom Metadata so that the base package is aware of it, this is effectively DI via Custom Metadata
 **/
public with sharing class WidgetManagerControllerImpl implements IWidgetManagerController {
    public String handleButton(String userMessage) {
        return 'Your message in reverse is ' + userMessage.reverse();
    }
}
