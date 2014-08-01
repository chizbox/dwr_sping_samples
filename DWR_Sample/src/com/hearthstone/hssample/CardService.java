package com.hearthstone.hssample;

import java.util.ArrayList;
import java.util.List;

public class CardService {

	List<Card> cardList;

	public List<Card> getAllCards() {
		cardList = new ArrayList<Card>();

		Card cardTemp = new Card();
		cardTemp.setName("Azure Drake");
		cardTemp.setDescription("BattleCry: draw a card, spell damage +1");
		cardTemp.setRarity("Rare");

		cardList.add(cardTemp);

		cardTemp = new Card();
		cardTemp.setName("Ragnaros the Fire Lord");
		cardTemp.setDescription("At the end of your turn Deal 8 damage to random enemy");
		cardTemp.setRarity("Legendary");

		cardList.add(cardTemp);

		cardTemp = new Card();
		cardTemp.setName("Cairne Bloodhoof");
		cardTemp.setDescription("Deathrattele:summon a 4/5 minion");
		cardTemp.setRarity("Legendary");

		cardList.add(cardTemp);

		cardTemp = new Card();
		cardTemp.setName("Bloodmage Thalnos");
		cardTemp.setDescription("Deathrattele:draw a card, spell damage +1");
		cardTemp.setRarity("Legendary");

		cardList.add(cardTemp);

		return cardList;
	}

	public static void main(String args[]) {
		CardService cardService = new CardService();

		List<Card> cardList = cardService.getAllCards();

		for (Card card : cardList) {
			System.out.println(card.getName());
		}
	}

}
