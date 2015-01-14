/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.viralpatel.servlet.listener;

 
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
/**
 *
 * @author huang
 */

   
 
public class SessionListener implements HttpSessionListener
{
    private int sessionCount = 0;
 
    public void sessionCreated(HttpSessionEvent event)
    {
        synchronized (this) 
        {
            sessionCount++;
        }
 
        System.out.println("Session Created: " + event.getSession().getId());
        System.out.println("Total Sessions: " + sessionCount);
    }
 
    public void sessionDestroyed(HttpSessionEvent event) 
    {
        synchronized (this)
        {
            sessionCount--;
        }
        System.out.println("Session Destroyed: " + event.getSession().getId());
        System.out.println("Total Sessions: " + sessionCount);
    }
}

