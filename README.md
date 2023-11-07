## TIPS GIT COMMANDS

- **  listar branches remotas **  ``` git branch -a ```
- ** criar branch local ** ``` git checkout [nome-nova-branch] - b ```
- ** enviar branch local para remota ** ``` git push -u origin [nome-da-branch] ```
- ** salvar alterações no stage ** ``` git add README.md ```
- ** salvar alteração  para o commit ** ``` git commit -m “More changes to the README” ```
- ** enviar commit ** ``` git push -u origin new-branch-2 ```
- ** trazer alterações remotas ** ``` git pull ```
- ** mesclar main remota com o branch remoto considerando o HEAD atual ** ``` git merge origin/main ```


## PREPARE VSCODE

1. Extensões
    * Debugger
    * Git
        > Local
        > Remoto
        > Scripts
2. Variáveis de ambiente
3. Atualização do Salesforce CLI
4. Projeto Salesforce
    * Manifest
    * Orgs e alias
    * Scratch org
    * Org do desenvolvedor
    * Testes com debug/logs
        extensão do vscode 
        > [Apex Replay Debugger](https://developer.salesforce.com/tools/vscode/en/apex/replay-debugger#:~:text=Get%20a%20list%20of%20debug,Replay%20Debugger%20with%20Current%20File)
            obs.: a extensão "Apex Replay Debugger" já está incluída na extensão "Salesforce Extension Pack"
        ativar o debug/log 
        > SFDX: Turn On Apex Debug Log for Replay Debugger
            obs.: verifique se existe as pastas debug/log no projeto ou crie: .sfdx>tools>debug>logs
        obter logs da org 
        > SFDX: Get Apex Debug Logs 
            obs.: deve estar aberto o developer console para funcionar
        debugger basta rodar o comando a seguir no log baixado: SFDX: Launch Apex Replay Debugger with Current File
            obs.: lembrar de colocar os brakpoints na classe que deseja observar o debugger contido no log
    * Testes e cobertura

## SF DEPLOY

1. Exemplo do Projeto SAF 2023 - Energy Cloud E&U - with Vlocity components
    ```
    $ sf project retrieve start -c -x manifest/[name-package].xml -o [alias-hlg]
    $ sf project deploy validate -x manifest/[name-package].xml -o [alias-hlg]
    $ sf project deploy start -x manifest/[name-package].xml -o [alias-hlg] -l NoTestRun
    $ sf project deploy start -x manifest/[name-package].xml -o [alias-prod] -l RunSpecifiedTests --tests [all test classes here separated by space]
    $ sf project deploy start -x manifest/[name-package].xml --target-org [alias-prod] --test-level RunAllTestsInOrg
    ```

    ### PASSO A PASSO VALIDAÇÕES P/ DEPLOY: 

    0. preparar as ferramentas do ambiente
    0.1. sincronizar os ambientes de sandbox com as branches (local)
    0.2. sincronização das modificações nas branches de origem (remoto)
    1. Montar o package a partir da sandbox DEV
    2. Executar o script deploySprint ``` sh scripts/shell\ scripts/retrieveAll.sh ``` 
    2. Executar o script deploySprint ``` sh scripts/shell\ scripts/deploySprint.sh ``` 
    3. Conferir as alterações na seção do git change
    4. Executar o deploy para homolog  ``` sf project deploy validate -x manifest/[name-package].xml -o [alias-hlg] ``` > validação na origem
    5. deploy valendo( ``` $ sf project deploy start -x manifest/[name-package].xml -o [alias-hlg] -l NoTestRun ```)

    ``` 
    sh scripts/shell\ scripts/retriveAll.sh 

    sfdx sgd:source:delta -W -a 58 --to "[branch-source]" --from "[branch-target]" --output "manifest/delta"
    sf sgd source delta -W -a 58 -f sandbox/homolog --to sandbox/dev --output manifest/delta
    ```

## REPOSITORY OVERVIEW

The trail-common-use-cases repository is in its infancy and there are no plans for periodic updates yet. Observations of the branches and content worked on will be included below.

    >[!NOTE]
    > Para o deploy vlocity seguir o preparo do ambiente conforme em [vlocity_build](https://github.com/vlocityinc/vlocity_build#install-nodejs)

    >[!IMPORTANT]
    > Incluir aqui...

    >[!WARNING]
    > Incluir aqui...