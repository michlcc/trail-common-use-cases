/**
 * Trail from trailhead modules - Apex Triggers 
 * @author: Michelle LCC
 * Events Trigger - 
 *   before insert
 *   before update
 *   before delete
 *   after insert
 *   after update
 *   after delete
 *   after undelete
 */
trigger HelloWorldTrigger on Account (before insert) {

    for(Account a : Trigger.new) {
        a.Description = 'New description';
    }   
}