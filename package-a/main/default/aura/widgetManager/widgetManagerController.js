({
    handleClick : function(cmp, event, helper) {
        var action = cmp.get("c.handleButton");
        action.setParams({ userMessage : cmp.find('someinput').get('v.value') });
        action.setCallback(this, function(response) {
            // Some nice boiler plate code...
            var state = response.getState();
            var toastEvent = $A.get("e.force:showToast");
            if (state === "SUCCESS") {
                toastEvent.setParams({ "title": "Message", "message": response.getReturnValue(), type: "info" });
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        toastEvent.setParams({ "title": "Message", "message": errors[0].message, type: "error" });
                    }
                } else {
                toastEvent.setParams({ "title": "Message", "message": "Unknown error", type: "error" });
                }
            }
            // Displauy message
            toastEvent.fire();        
            // Close dialog        
            var dismissActionPanel = $A.get("e.force:closeQuickAction");
            dismissActionPanel.fire();            
        });
        $A.enqueueAction(action);        
    }
})
