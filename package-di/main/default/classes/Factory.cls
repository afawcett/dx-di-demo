public with sharing class Factory {

    private static Map<Type, Type> classesByInterface;

    public static Object newInstance(Type interfaceType) {
        if(classesByInterface==null) {
            // Query custom metadata records for interface impls
            classesByInterface = new Map<Type, Type>();                    
            for(ClassFactory__mdt record : [select Interface__c, Class__c from ClassFactory__mdt]) {
                classesByInterface.put(Type.forName(record.Interface__c), Type.forName(record.CLass__c));
            }           
        }
        // Resolve interface impl
        Type implementingType = classesByInterface.get(interfaceType);
        if(implementingType==null) {
            throw new AuraHandledException('Error missing dependency on interface ' + interfaceType + ', check installed packages.');
        }
        return implementingType.newInstance();
    }

    public class FactoryException extends Exception {}
}
