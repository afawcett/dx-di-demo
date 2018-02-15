/**
 * Interface used by extension packages to injection at runtime behaviour into the base Lightning Component, 
*    implementations are registered via Custom Metadata type records in such packages
 **/
public interface IWidgetManagerController {
    String handleButton(String userMessage);
}
