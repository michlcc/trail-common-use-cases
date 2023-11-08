/**
 * Usando exceções de gatilho (Fonte: https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_intro)
 * metodo addError:
 * É um método no sObject, que gera um erro fatal dentro de um gatilho impedindo que registros sejam salvos 
 * quando determinadas condições forem atendidas.
 * Faz com que todo o conjunto de operações seja revertido, exceto quando o DML em massa é chamado com sucesso parcial.
 */
trigger AccountDeletion on Account (before delete) {
    // Prevent the deletion of accounts if they have related opportunities.
    for (Account a : [SELECT Id FROM Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity) AND
                     Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related opportunities;)');
    }
}