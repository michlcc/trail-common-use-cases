# SUMMARY GUIDE TO SALESFORCE DEVELOPER PLATFORM 

Salesforce platform developer training repository ...BUILDING

## TIPS GIT COMMANDS

- **listar branches remotas**  ``` git branch -a ```
- **criar branch local** ``` git checkout [nome-nova-branch] - b ```
- **enviar branch local para remota** ``` git push -u origin [nome-da-branch] ```
- **salvar alterações no stage** ``` git add README.md ```
- **salvar alteração  para o commit** ``` git commit -m “More changes to the README” ```
- **enviar commit** ``` git push -u origin new-branch-2 ```
- **trazer alterações remotas** ``` git pull ```
- **mesclar main remota com o branch remoto considerando o HEAD atual** ``` git merge origin/main ```
- **uma maneira de visualizar o histórico de commits exibindo os primeiros sete caracteres do hash SHA-1 e a mensagem de commit dos commits no branch atual.** ``` git log --oneline ```
- **apresenta o histórico de commits em um gráfico ASCII exibindo as diferentes ramificações no repositório e seus commits** ``` git log --oneline --graph ```
- **exibe o mesmo gráfico ASCII exibido usando o modificador --graph, mas também inclui os nomes das ramificações para os diferentes commits exibidos** ``` git log --oneline --graph --decorate ```
- **mais dicas de comandos em:** trailhead [Trabalhe com seu histórico no Git](https://trailhead.salesforce.com/content/learn/modules/git-and-git-hub-basics/work-with-your-history-in-git?trail_id=set-up-your-workspace-and-install-developer-tools)


## PREPARE VSCODE

VSCODE EXTENSIONS AND PRE INSTALLATIONS EVALUATED

- [ ] Visual StudioCode
- [ ] Java
   - Environment variables
- [ ] Node.js and npm
- [ ] Git
- [X] Debugger
   - extensão do vscode: [Apex Replay Debugger](https://developer.salesforce.com/tools/vscode/en/apex/replay-debugger#:~:text=Get%20a%20list%20of%20debug,Replay%20Debugger%20with%20Current%20File). Note: a extensão "Apex Replay Debugger" já está incluída na extensão "Salesforce Extension Pack"
   - ativar o debug/log: SFDX: Turn On Apex Debug Log for Replay Debugger. Note: verifique se existe as pastas debug/log no projeto ou crie: .sfdx>tools>debug>logs
   - obter logs da org: SFDX: Get Apex Debug Logs. Note: deve estar aberto o developer console para funcionar
   - para usar o debugger basta rodar o comando a seguir no log baixado: SFDX: Launch Apex Replay Debugger with Current File. Note: lembrar de colocar os brakpoints na classe que deseja observar o debugger contido no log
- [ ] Code coverage

## DEVELOPER ORG

- [ ] settings vscode:
   - backup vscode settings in personal or company account 
- [ ] scratch org
- [ ] scripts examples:
   - homolog deployment model
   - deployment model in scratch org
   - deployment model in prod  

## SALESFORCE DEPLOYMENT EXAMPLES

### Energy Cloud E&U - with Vlocity components - Projeto SAF 2023

STEP BY STEP FOR DEPLOY: 

**Note:** Para o deploy vlocity seguir o preparo do ambiente conforme em [vlocity_build](https://github.com/vlocityinc/vlocity_build#install-nodejs)

1. preparar as ferramentas do ambiente
- sincronizar os ambientes de sandbox com as branches (local)
- sincronização das modificações nas branches de origem (remoto)
2. Montar o package a partir da sandbox DEV
3. Executar o script deploySprint ``` sh scripts/shell\ scripts/retrieveAll.sh ``` 
4. Executar o script deploySprint ``` sh scripts/shell\ scripts/deploySprint.sh ``` 
5. Conferir as alterações na seção do git change
6. Executar o deploy para homolog  ``` sf project deploy validate -x manifest/[name-package].xml -o [alias-hlg] ``` > validação na origem
7. deploy valendo( ``` $ sf project deploy start -x manifest/[name-package].xml -o [alias-hlg] -l NoTestRun ```)

SUMMARY COMMANDS

```
sf project retrieve start -c -x manifest/[name-package].xml -o [alias-hlg]
sf project deploy validate -x manifest/[name-package].xml -o [alias-hlg]
sf project deploy start -x manifest/[name-package].xml -o [alias-hlg] -l NoTestRun
sf project deploy start -x manifest/[name-package].xml -o [alias-prod] -l RunSpecifiedTests --tests [all test classes here separated by space]
sf project deploy start -x manifest/[name-package].xml --target-org [alias-prod] --test-level RunAllTestsInOrg
sh scripts/shell\ scripts/retriveAll.sh
sfdx sgd:source:delta -W -a 58 --to "[branch-source]" --from "[branch-target]" --output "manifest/delta"
sf sgd source delta -W -a 58 -f sandbox/homolog --to sandbox/dev --output manifest/delta
```

## REPOSITORY OVERVIEW

The trail-common-use-cases repository is in its infancy and there are no plans for periodic updates yet. Observations of the branches and content worked on will be included below.

> [!NOTE]
> Incluir aqui...

> [!IMPORTANT]
> Incluir aqui...

> [!WARNING]
> Incluir aqui...