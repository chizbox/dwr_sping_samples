package com.zoneacademy;

public class Communicator {
	
	public String doCommunicate(String messageFromBrowser){
		System.out.println("Message From Browser:" + messageFromBrowser);
		return "In reply to your message \"" +  messageFromBrowser + "\": hi from server";
	}
}
