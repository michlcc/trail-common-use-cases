/**
 * Gatilhos e frases de destaque (Fonte: https://trailhead.salesforce.com/content/learn/modules/apex_triggers/apex_triggers_intro)
 * Ao fazer uma chamada a partir de um gatilho, a chamada deve ser feita de forma assíncrona para que o processo
 *  do gatilho não impeça você de trabalhar enquanto aguarda a resposta do serviço externo. A chamada assíncrona
 *  é feita em um processo em segundo plano e a resposta é recebida quando o serviço externo a retorna.
 */
trigger CalloutTrigger on Account (before insert, before update) {
    CalloutClass.makeCallout();
}