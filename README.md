# trail-common-use-cases


##COMANDOS GIT

listar branches remotas -> git branch -a 
criar branch local -> git checkout [nome-nova-branch] - b
enviar branch local para remota -> git push -u origin [nome-da-branch]


PREPARAR O VSCODE

1. Extensões
    * Debugger
    * Git
        -> Local
        -> Remoto
        -> Scripts
2. Variáveis de ambiente
3. Atualização do Salesforce CLI
4. Projeto Salesforce
    * Manifest
    * Orgs e alias
    * Scratch org
    * Org do desenvolvedor
    * Testes com debug/logs
        extensão do vscode -> https://developer.salesforce.com/tools/vscode/en/apex/replay-debugger#:~:text=Get%20a%20list%20of%20debug,Replay%20Debugger%20with%20Current%20File.
            obs.: a extensão "Apex Replay Debugger" já está incluída na extensão "Salesforce Extension Pack"
        ativar o debug/log -> SFDX: Turn On Apex Debug Log for Replay Debugger
            obs.: verifique se existe as pastas debug/log no projeto ou crie: .sfdx>tools>debug>logs
        obter logs da org -> SFDX: Get Apex Debug Logs 
            obs.: deve estar aberto o developer console para funcionar
        debugger basta rodar o comando a seguir no log baixado: SFDX: Launch Apex Replay Debugger with Current File
            obs.: lembrar de colocar os brakpoints na classe que deseja observar o debugger contido no log
    * Testes e cobertura

DEPLOY

1. Safira Energia 2023

    $ sf project retrieve start -c -x manifest/package-classes-flows.xml -o saf-hlg
    $ sf project deploy validate -x manifest/package-classes-flows.xml -o saf-hlg
    $ sf project deploy start -x manifest/package-classes-flows.xml -o saf-hlg -l NoTestRun
    $ sf project deploy start -x manifest/package-classes-flows.xml -o saf-prod -l RunSpecifiedTests --tests ContactMergeConvertedTest ContentDocumentLinkTriggerHandlerTest CustomFunctionImplementationTest DRStringTest IntegrationProcedureInvocableTest LeadConversionTest TablesMostQIRemoteClassTest
    $ sf project deploy start -x manifest/package-classes-flows.xml --target-org saf-prod --test-level RunAllTestsInOrg


    PASSO A PASSO VALIDAÇÕES P/ DEPLOY 

    0 - preparar as ferramentas do ambiente
    0.1 - sincronizar os ambientes de sandbox com as branches (local)
    0.2 - sincronização das modificações nas branches de origem (remoto)
    1 - Montar o package a partir da sandbox DEV
    2 - Executar o script deploySprint (sh scripts/shell\ scripts/retrieveAll.sh)
    2 - Executar o script deploySprint (sh scripts/shell\ scripts/deploySprint.sh)
    3 - Conferir as alterações na seção do git change
    4 - Executar o deploy para homolog (sf project deploy validate -x manifest/deploy13.xml -o saf-hlg)-> validação na origem
    5 - deploy valendo($ sf project deploy start -x manifest/package.xml -o saf-hlg -l NoTestRun)

    sh scripts/shell\ scripts/retriveAll.sh


    sfdx sgd:source:delta -W -a 58 --to "sandbox/dev" --from "sandbox/homolog" --output "manifest/delta"
    sf sgd source delta -W -a 58 -f sandbox/homolog --to sandbox/dev --output manifest/delta

    OBSERVAÇÕES:
    - para o deploy vlocity seguir o preparo do ambiente conforme em https://github.com/vlocityinc/vlocity_build#install-nodejs
