"Crossroads" by Ian Meeder

Include Dynamic Tables by Jesse McGrew.
Include Dynamic Objects by Jesse McGrew.
The player is in the Rotunda.

Part Game Rules

Chapter Values

Section Price

Price is a kind of value. 99G 99S 99C specifies a price with parts gold, silver, and copper. A thing has a price. The price of a thing is usually 0G 0S 0C.

Section Weight

Weight is a kind of value. The weights are light, normal, and heavy. A thing has a weight. The weight of a thing is usually normal.

Chapter Objects

Section Bottle

A bottle is a kind of container. A bottle can be empty or not empty. A bottle is usually empty. 

The printed name of a bottle is  "Bottle ([if empty]Empty[else][list of things in bottle][end if])"

The description of a bottle is "The bottle is made of a murky glass, but you can still make out the contents which just so happens to be [if empty]nothing[else][list of things in bottle][end if]."

Rule for printing the name of a bottle:
	say "[printed name]"; 
	omit contents in listing.

Carry out examining a bottle:
	say "[description]";
	omit contents in listing instead.

Section Clothing

A clothing is a kind of thing. A clothing is usually wearable.

A shirt is a kind of clothing.
Instead of wearing a shirt (called new shirt) when the player is wearing a shirt (called old shirt):
	say "(first removing [old shirt])";
	silently try taking off old shirt;
	try wearing new shirt.

A pair of socks is a kind of clothing. Understand "pairs of socks" as the plural of pair of socks.
Instead of wearing a pair of socks (called new pair) when the player is wearing a pair of socks (called old pair):
	say "(first removing [old pair])";
	silently try taking off old pair;
	try wearing new pair.

A necklace is a kind of clothing.
Instead of wearing a necklace (called new necklace) when the player is wearing a necklace (called old necklace):
	say "(first removing [old necklace])";
	silently try taking off old necklace;
	try wearing new necklace.

Shoes are a kind of clothing.
Instead of wearing shoes (called new shoes) when the player is wearing shoes (called old shoes):
	say "(first removing [old shoes])";
	silently try taking off old shoes;
	try wearing new shoes.

Section Currency

Money is a kind of thing. A coin is a kind of money.

A gold coin is a kind of coin. The price of a gold coin is 1G 0S 0C. The description of a gold coin is "It has some strange lettering on it that you cannot read on one side. The other side has the picture of some old man, probably someone important."

A silver coin is a kind of coin. The price of a gold coin is 0G 1S 0C. The description of a silver coin is "It has some strange lettering on it that you cannot read on one side. The other side has the picture of some bird, maybe a crow."

A copper coin is a kind of coin. The price of a gold coin is 0G 0S 1C. The description of a copper coin is "It has some strange lettering on it that you cannot read on one side. The other side has the picture of a tall building, obviously somewhere important."

A coin purse is a kind of thing. The description of a coin purse is "Overall, [the printed name] carries [price]." 
After printing the name of a coin purse (called the coin purse):
	if the player has the coin purse:
		say " - [price]"

Check inserting something (called the coins) into a coin purse:
	if the coins are not coins:
		say "That doesn't belong there." instead.

Check taking coins:
	if the player does not hold a coin purse:
		say "You don't want a bunch of coins bouncing around in your pocket. You will wait until you have something to put them in." instead;
		
Carry out taking coins (called the coins):
	if the player hold a coin purse (called the player's coin purse):
		increase the price of the player's coin purse by the price of the coins;
		remove the coins from play instead.
		
Section Electric Light

An electric light is a kind of device.

Instead of switching on an electric light:
	if the noun is unlit:
		say "You turn [the noun] on.";
		now the noun is switched on;
		now the noun is lit;
	else if the noun is lit:
		say "[The noun] is already turned on."
	
Instead of switching off an electric light:
	if the noun is lit:
		say "You turn [the noun] off.";
		now the noun is switched off;
		now the noun is unlit;
	else if the noun is unlit:
		say "[The noun] is already turned off."

Section Lever

A lever is a kind of thing.

A lever can be broken or fixed. A lever is usually fixed.
		
Instead of switching on a lever (called lever):
	try activating lever.
	
Instead of switching off a lever (called lever):
	try activating lever.

Instead of turning a lever (called lever):
	try activating lever.

Instead of pulling a lever (called lever):
	try activating lever.

Instead of pushing a lever (called lever):
	try activating lever.

Section Liquid

A liquid is a kind of thing. A liquid can be drinkable or not drinkable. A liquid is usually drinkable.

Before taking a liquid (called the liquid):
	if the player does not have a bottle:
		say "You need something to put the [the liquid] in." instead;
	else if the player has a bottle (called the bottle):
		try filling the bottle with the liquid instead.	

Section Person

A person can be alive or dead. A person is usually alive.

Section Ambient Noise

A room has some text called the ambient noise. The ambient noise of a room is usually "".

A region has some text called the ambient noise. The ambient noise of a region is usually "".

Section Text Object

A text object is a kind of thing. A text object can be either read or unread. A text object is usually unread.

After examining a text object:
	now the noun is read.

A magazine is a kind of text object.

Instead of opening a magazine:
	try examining the noun;

Section Compass

The compass is a thing. The description of the compass is "A red and gold magnetic compass. On the back is engraved the message: 'Spin the Needle To Return'."

Understand "needle" as the compass.

Instead of spinning the compass:
	if the player does not carry the compass:
		now the player carries the compass;
	say "You spin the compass needle and the whole world seems to spin with it.";
	now the player is in the Rotunda.

Chapter Actions

Section Activating

Activating is an action applying to one visible thing.

Check activating:
	if the noun is not a lever:
		say "Nothing obvious happens."	

Section Attacking

Instead of attacking:
	say "Alex, stop trying to attack things." instead.

Section Drinking

The block drinking rule is not listed in the check drinking rulebook.

Understand "drink [something]" as drinking.

Check drinking a bottle (called the bottle):
	if the bottle is empty:
		say "There is nothing to drink." instead;
	else if the bottle contains something (called the liquid):
		try drinking the liquid instead.

Check drinking something (called the liquid):
	if the liquid is not a liquid:
		say "You can hardly drink [the liquid]." instead;
	else if the liquid is not drinkable:
		say "Yeah, I wouldn't drink that if I were you." instead;
	else if the liquid is owned by a person (called the owner) and the owner is not the player:
		say "I don't think [the owner] would appreciate you drinking their [liquid]." instead;
		
Carry out drinking something (called the liquid):
	if the player owns the liquid and the liquid is filling a bottle (called the bottle):
		now the bottle is empty;
		remove the liquid from play.
		
Report drinking something (called the liquid):
	say "You down the [the liquid]. How refreshing."

Section Fill

Filling it with is an action applying to two visible things.

Understand "fill [something] with [something]" as filling it with.

Check filling something (called the container) with something (called the liquid):
	if the container is not a container:
		say "Yeah, because trying to fill [the container] makes a lot of sense." instead;
	else if the liquid is not a liquid:
		say "Filling makes a lot more sense if [the liquid] were a liquid." instead;
	else if the liquid is owned by a person (called the owner) and the owner is not the player:
		say "What, do you just go around trying to take people's [liquid]?" instead;
	if the container is not a bottle:
		say "It would be more benneficial to fill a bottle or something." instead;
	else if the liquid is not a liquid and the container is a bottle:
		say "You should save this precious bottle for a liquid. Or a fairy if you can find one." instead;
	else if the liquid is a liquid and the container is not a bottle:
		say "You don't think trying to put [the liquid] into [the container] will go so well." instead;
	else if the liquid is a liquid and the container is a bottle and the container is not empty:
		say "You need to pour something out first." instead.

Carry out filling something (called the container) with something (called the liquid):
	let the new liquid be a new object cloned from the liquid;
	now the new liquid is in the container;
	now the new liquid is filling the container;
	now the new liquid is owned by the player;
	
Report filling something (called the container) with something (called the liquid):
	say "[The container] is now filled to the brim with [the liquid].";
	now the container is not empty.

Section Pouring Out

Pouring out is an action applying to one visible thing.

Understand "pour out [something]" as pouring out.

Check pouring out something (called the liquid):
	if the liquid is not a liquid and the liquid is not a bottle:
		say "Try pouring out [the liquid] yourself and tell me how far you get." instead;
	else if the liquid is a bottle (called the bottle) and the bottle is empty:
		say "There is nothing to pour out." instead;
	else if the liquid is a liquid and the liquid is not filling something:
		say "You cannot pour [the liquid] out.".
		
Carry out pouring out something (called the liquid):
	if the liquid is a liquid and the liquid is filling a bottle (called the bottle):
		now the bottle is empty;
		remove the liquid from play;
	else if the liquid is a bottle and the liquid is filled by a liquid (called the actualLiquid):
		now the liquid is empty;
		remove the actualLiquid from play.
		
Report pouring out something (called the liquid):
	if the liquid is a liquid and the liquid is filling a bottle (called the bottle):
		say "You pour the [the liquid] out. Now there is [liquid] all over the ground. I hope you're happy.";
	else if the liquid is a bottle and the liquid is filled by a liquid (called the actualLiquid):
		say "You pour the [the actualLiquid] out. Now there is [actualLiquid] all over the ground. I hope you're happy.".

Section Looking Behind

Looking behind is an action applying to one visible thing.

Understand "look behind [something]" as looking behind.

Carry out looking behind:
	say "You find [a list of things which are behind the noun] behind [the noun].";
	now every thing behind the noun is carried by the player;
	now every thing behind the noun is not behind the noun;

Section Buying

The block buying rule is not listed in the check buying rulebook.

Check buying:
	if the price of the noun is 00G 00S 00C:
		say "[The noun] [if the noun is plural-named]are[else]is[end if] not for sale." instead;
	else if the player does not have a coin purse:
		say "With what money? You're broke as a joke." instead;
	else if the player holds a coin purse (called the player's coin purse) and the price of the player's coin purse is 00G 00S 00C:
		say "With what money? You're broke as a joke." instead;
	else if the player holds a coin purse (called the player's coin purse) and the price of the player's coin purse is less than the price of the noun:
		say "You don't have enough money to buy such a lavish item. You need [price of the noun - the price of the player's coin purse] more." instead;
	else if the the noun is a liquid and the player does not carry an empty bottle:
		say "You'll need something to put it in." instead.
		
Carry out buying:
	if the noun is a liquid and the player holds an empty bottle (called the player's empty bottle):
		let the new noun be a new object cloned from the noun;
		now the new noun is owned by the player;
		try filling the player's empty bottle with the new noun;
	else:
		now the player owns the noun;
		now the player holds the noun;
	if the player holds a coin purse (called the player's coin purse):	
		now the price of the player's coin purse is the price of the player's coin purse - the price of the noun;

Report buying:
	if the player holds a coin purse (called the player's coin purse):
		say "You bought [the noun]! You have [price of the player's coin purse] left."

Section Inserting

Check inserting something (called the noun) into something (called the container):
	if the noun is not a liquid and the container is a bottle:
		say "You should save this precious bottle for a liquid. Or a fairy if you can find one." instead;
	else if the noun is a liquid and the container is not a bottle:
		say "You don't think trying to put [the noun] into [the container] will go so well." instead.

Section Listening

Instead of listening:
	let room be the location of the player;
	let room noise be the ambient noise of room;
	if room noise is "":
		let region be the map region of room;
		let region noise be the ambient noise of region;
		say "You hear [region noise].";
	else:
		say "You hear [room noise].".

Section Spinning

Spinning is an action applying to one visible thing.

Understand "spin [something]" as spinning.

Check spinning:
	unless the noun is the compass:
		say "what.".

Section Taking

Instead of taking something had by a dead person (called the dead person):
	say "You take [the noun] from [the dead person].";
	now the player has the noun;
	
Instead of taking something (called the item) owned by a person (called the owner):
	if the owner is not the player:
		say "You don't think [the owner] would appreciate you stealing [the item] from them. Besides, stealing is wrong!"

Section Talking

Talking to is an action applying to one visible thing.

Understand "talk to/with [something]" as talking to.

Check talking to:
	if the noun is not a person:
		say "[The noun] choose[if noun is plural-named]s[end if] to not respond to you. How rude.";
	else if the noun is a person:
		say "[The noun] must not have heard you.";
		

Section Using

Using is an action applying to one visible thing. Understand "use [something]", "go on [something]", "get on [something]" as using.

Check using:
	if the noun is not a device:
		say "No can do, Batman.";
	else if the noun is not switched on:
		say "[The noun] needs to be switched on first.";

Chapter Relations

Section Behind

Behind relates various things to one thing.

The verb to be behind means the behind relation. The verb to be in front of means the reversed behind relation.	

Section Filled

Filled relates one thing to one thing.

The verb to be filled by means the filled relation. The verb to be filling means the reversed filled relation.

Section Owning

Owning relates various things to one thing.

The verb to be owned by means the owning relation. The verb to own means the reversed owning relation.

Chapter Rulebooks

Section Going a Direction

The can't go through undescribed doors rule is not listed in any rulebook.

Part The Game

Chapter Prelude

The Prelude is a region.

Your Bedroom is in the Prelude.

There is a bottle.

Section Your Bedroom

[Rules]

A room can be clean or messy. A room is usually clean.  

Before looking in the Bedroom:
	if hamper contains shirt and hamper contains socks:
		now the Bedroom is clean;
		
Instead of examining Email:
	if computer is switched off: 
		try using the computer;
	else:
		now the email is read.
	
The ambient noise of Your Bedroom is "your roommates talking in the other room. Hopefully not about you."	
	
[Location]
Your Bedroom is a room. "You are in your Bedroom. It is a smallish squareish sort of place. Here, you only have your essentials for the summer, such as your computer, your bed, and a hamper in the corner. You even have a poster! Good for you. You can also hear David from the other room. Then again, you can hear David from any room.[if messy] Your room is quite messy. You should clean it sometime soon.[otherwise] Your room is impeccably clean. Much better than the pigsty it was earlier.[end if]". 

Your Bedroom is messy. 

The poster is scenery in your bedroom. "Ahh, Darth Vader."

The floor is scenery in your bedroom. 

On the floor is a a pair of socks called a discarded pair of socks.

The hamper is a container and scenery in the Bedroom. "It's a generic hamper."

The bed is a scenery in your bedroom. "A twin-sized bed with sheets folded  to perfection."

On the bed is a shirt called a slightly dirty shirt.

The computer is a device and scenery in the Bedroom. "[if switched on]You have an unread email from Ian Meeder[end if]"

A container called Inbox is part of the computer.

In the Inbox is a text object called Unread Email. The email is not portable.
Instead of taking the email:
	say "You swat at the computer and start to make monkey sounds. Nothing happens."

Never Trust Ian is a scene. Never Trust Ian begins when the email is read.

Every turn during Never Trust Ian:
	repeat through Table of Never Trust Ian Events:
		say "[event entry][paragraph break]";
		blank out the whole row;
		stop.

Table of Never Trust Ian Events
event
"From: Ian Meeder [bracket]mailto:imeeder@cox.net[close bracket][line break]Sent: Friday, August 01, 2014 1:16 AM[line break]To: imeeder@cox.net[line break]Subject: A gift for you.

Just think what will come around on your actual birthday! O_o

-Blubbers

As you read the email you start to feel a little woozy."
"The world is starting to spin again. You do not enjoy this."
"Ugh."
"Wait."
"This doesn't feel right. Not that it usually does, but this is different."
"The cool white color of your room is being replaced by yellows and browns as your vision beings to spin faster and faster."
"You think you're going to be sick."
"Slowly, as you fight back an overwhelming puking sensation, the spinning stops."
"You take a moment to compose yourself before you look at your surroundings."
"This is definitely not your room. It is cold and made of stone and you don't like it."
"A paper flutters down through the air and lands on the ground infront of you. You notice that it is the email that your good friend Ian sent you. Flipping it over, you read:

	'P.S. I recommend grabbing some graph paper and a pen - maps can be so useful.'"
"--- Welcome to Connor's Crazy Adventure Fun Time ---"

Never Trust Ian ends when the number of filled rows in the Table of Never Trust Ian Events is 0.

Instead of doing something during Never Trust Ian: 
	do nothing;

When Never Trust Ian ends:
	Move the player to the Rotunda;
	now the player carries Ian's Email.

Chapter The Rotunda

The Center is a region.

The Storage Room, The Rotunda, The End, Gondola Station, Fissure are in the Center.

Section The Email

Ian's email is a text object. The description of Ian's email is "On the front it reads:

'From: Ian Meeder [bracket]mailto:imeeder@cox.net[close bracket][line break]Sent: Friday, August 01, 2014 1:16 AM[line break]To: imeeder@cox.net[line break]Subject: A gift for you.

Just think what will come around on your actual birthday! O_o

-Blubbers'

Whereas on the back it reads: 

'P.S. I recommend grabbing some graph paper and a pen - maps can be so useful.
P.P.S. Like in real life. Go grab paper.'"

Section The Rotunda

The Rotunda is a room. "You stand in a huge circular chamber made entirely out of large stones that look like they came right out of the medieval ages. The room is even lit by torches. Looking up, you see the ribbed vaulted ceiling some 100 feet above you. The floor is decorated with various colored mosiac tiles in the shape of a compass rose. 

There are archways leading to dim corridors to the northwest, northeast, east, southeast, south, and southwest whereas to the west and north are doors. The west door looks to be a normal wooden door you would expect to see in an old castle. You know, from all those castles you've visited. The northern door is at least twice as large as the other door and is ornately carved."

The ambient noise of the rotunda is "the sound of your own breath masked by the soft crackling from the torches".

The compass rose is scenery in the Rotunda. "A large compass rose that takes up nearly half of the floor, its vibrant yellow points seeming to point infinately towards unknown worlds."

The torch is scenery in the Rotunda. "Quite bright and bolted to the wall." Understand "torches" as the torch.

The vaulted ceiling is a backdrop in the rotunda. "The ceiling climbs far into the air above you, perhaps even defying the laws of physics."

The compass is in the Rotunda.

Section The Storage Room

The small door is a door and scenery. "A small wooden door with a brass handle." It is west of the Rotunda and east of the Storage Room.

The Storage Room is a room. "You stand is a cold, dark room lit only by a single bulb from above. The room is made of the same stone and craftsmanship that the Rotunda is. The walls are lined with shelving and crates stacked to the roof.

The door leading back out to the Rotunda is to the east."

The ambient noise of the storage room is "the sound of your own breath masked echo against the stone walls".

The single bulb is scenery in the storage room. "A lone bulb hanging uncovered from the ceiling."

The metal shelving is plural-named scenery in the storage room. "Sturdy metal shelving lines the small storage room. The shelves are filled with heavy-looking crates. They kinda remind you of Indiana Jones or maybe Home Depot..."

The crates are plural-named scenery in the storage room. "They look too heavy to take off the shelves."

The wooden crate is a locked container in the Storage Room. "Sitting in a corner on ground level is a smaller wooden crate." The crowbar unlocks the wooden crate. The description of the wooden crate is "Although smaller than the other crates, it still looks far too heavy to lift.[if locked] The lid is held shut by two dozen nails.[otherwise] It's contents consist entirely of flashlights.[end if]". The wooden crate is fixed in place.

The cache of flashlights are scenery in the wooden crate. The description of the flashlights is "Probably several hundred small black flashlights."
Understand "flashlight" as the flashlights when the flashlight is not visible.

Instead of opening the crate:
	if the crate is locked:
		say "It is sealed tight by the nails.";
	else if the crate is unlocked and the crate is closed:
		say "You take off the lid and lay it to the side, revealing a bunch of flashlights.";
		now the crate is open;
	else if the crate is unlocked and the crate is open:
		say "The wooden crate is already open.";
		
Instead of closing the crate when the crate is open:
	say "You place the lid lightly back on top of the crate.";
	now the crate is closed.

Instead of unlocking the crate with something (called the key):
	if the key unlocks the crate:
		say "Prying around the edges with the crowbar, you loosen the lid.";
		now the crate is unlocked;
		try opening the crate;
	else:
		say "You can't get enough leverage with [the key]."

Instead of taking the flashlights:
	say "Lightly squeezing the flashlights, you take the ripest one.";
	move the flashlight to the player;

The flashlight is an electric light. The description of the flashlight is "A small black flashlight. You are surprised to find that there are already batteries in it."

Section The End

The ornate door is a door and scenery. "A huge double door. It is at least twice your height. The carvings in its face seem to be of the orient. Despite its size, there are two silver handles at waist level for someone of normal proportions." It is locked. It is north of the Rotunda and south of The End.

The End is a room.

The ambient noise of The End is "silence."

Section Gondola Station

The gondola car is a vehicle in the fissure. "The gondola car sits at the loading dock, ready to take you [if the player is in the gondola station]east[else]west[end if]." The description of the gondola car is "A modern-looking cable car. It seems to be a little rusted, but no matter."

The Gondola Station is east of the Rotunda. "[if unvisited]You walk down a long and winding corridor lit by more torches at a steady slope. Eventually you come to a metal door behind which you can hear a light breeze. Being adventurous, you open the door and emerge into the soft light on the other side.

[end if]You are in a huge alcove built into the side of a massive east-facing cliff. Looking out, all you can see is a massive white wall of fog. Far above you is a thick metal cable anchored to the cliff wall which extends out and disappears into fog.

To the west of you is the door leading back to the Rotunda."

The giant cable is a backdrop. It is in the Gondola Station and Fissure. "A thick metal cable jutting out of the alcove wall some 30 feet above you."

The fog is a backdrop. It is in the Gondola Station and Fissure. "An unmoving wall of fog extends in all directions."

The metal joint is a lever in the station. "[if broken]A metal joint [otherwise]A lever [end if]is fastened to the ground next to the loading dock." It is broken.
The description of the joint is "[if broken]A metal joint that looks like it can be rotated. It seems to be missing a part where there is a large hexagonal hole.[otherwise]A pretty basic looking lever.[end if]".

Instead of activating the joint while the joint is broken:
	say "You try, but you cannot get enough leverage."
	
Instead of putting the handle on the joint:
		try tying the handle to the joint;

Instead of inserting the handle into the joint:
		try tying the handle to the joint;
	
Instead of tying the handle to the joint:
	now the lever handle is a part of the joint;
	now the joint is fixed;
	now the printed name of the joint is  "lever";
	say "You attach the handle to the joint."
	
Instead of activating the lever:
		say "You pull and lever and immediately hear a screeching sound from out in the fog. The sound of a humming engine grows louder as the gondola car pulls along the giant cable. It crawls out of the fog and comes to a rest at the loading dock within the alcove.";
		now the Gondola Car is in the Gondola Station.
		
Instead of activating the lever when the player is in the Gondola Station and the gondola car is in the Gondola Station:
	say "Nothing happens."
	
Instead of going east when the Gondola Car is not in the Gondola Station and the player is in Gondola Station:
	say "And fall into the sea? No way, Jose."
	
Understand "lever", "handle" as the joint when the joint is fixed.

The ambient noise of the Gondola Station is "almost complete silence except for the occasional sound of the cable creaking and swaying from some unfelt wind".

Instead of going east when the Gondola Car is in the Gondola Station and the player is in Gondola Station:
	now the metal joint is in the Fissure;
	now the Gondola Car is in the Fissure;
	move player to Fissure;

Instead of going west when the gondola car contains the player and the gondola is in the Gondola Station:
	try silently exiting;
	try going west;
	
Instead of going east when the gondola car contains the player and the gondola is in the Gondola Station:
	try silently exiting;
	try going east;

Section Fissure

The Fissure is east of the Gondola Station. "[if unvisited]The gondola crawls back along the cable out into the fog. After a few seconds you can no longer see the cliff behind you. All around is the sea of fog. After a minute or two you see another cliff face emerge from out of the fog. The gondola comes to rest and you quickly jump off.

[end if]You stand at another great alcove, almost identical to the Gondola Station. The giant cable that the gondola car climbs along is anchored into the cliff wall above you, out of reach. 

In the easten wall of the alcove is a great fissure splitting the cliff wall where you see crude, rocky stairs descend further into the earth."

The ambient noise of the Fissure is "a low and steady humming coming from the fissure".

Instead of activating the lever when the player is in the Fissure and the gondola car is in the Fissure:
	say "Nothing happens."

Instead of going west when the Gondola Car is in the Fissure and the player is in Fissure:
	now the metal joint is in the Gondola Station;
	now the Gondola Car is in the Gondola Station;
	move player to Gondola Station;

Instead of going west when the gondola car contains the player and the gondola is in the Fissure:
	try silently exiting;
	try going west;
	
Instead of going east when the gondola car contains the player and the gondola is in the Fissure:
	try silently exiting;
	try going east;

Chapter Ninja Temple

The Ninja Temple is a region.

The Alcove, the Dark Cave, Dark Cavern, the Temple Gate are in the Ninja Temple.

Section Alcove

The Alcove is south of the Rotunda. "[if unvisited]You come to a staircase that seems endless, but continue up it anyway. After many minutes of climbing, you reach the top where you notice that the corridor made of carved stone has turned into an earthen tunnel. Following it, you are led outside.

[end if]You stand outside in a small alcove built high into a south face of a steep mountain. Looking out, all you can see is a layer of clouds maybe 100 feet below you. There is no way of telling how high up you are.  The sun is low in the sky and is casting long shadows on everything. 

Following the cliff northwest is a small path which disappears into the rock. North, above you, is the long staircase leading back to the rotunda." 

The ambient noise of the Alcove is "the sound of a great wind blowing past you".

Section Dark Cave

The Dark Cave is northwest of the Alcove."[if player does not carry something lit]It is too dark to see anything in this cave. The only thing visible is the opening to the southeast.[otherwise]A small dark cave in the side of the mountain. There are stalagmites and stalactites bursting from the ground and ceiling. 

To the northwest, the cave appears to continue. To the southeast is the an opening leading outside.[end if]"

The ambient noise of the dark cave is "the sound of the wind whistling past the cave entrance".

The stalagmites are scenery in the Dark Cave. "Like earthen fangs sprouting from the ground.[if something is behind the stalagmites] There appears to be something behind them.[end if]". Understand "stalagmite" as stalagmites.

The stalactites are scenery in the Dark Cave. "Like earthen fangs sprouting from the ceiling." Understand "stalactite" as stalactites.

The lever handle is a thing. The description of the lever handle is "A wooden pole with a hexagonal metal end."

The lever handle is behind the stalagmites.

Instead of doing something when the player does not carry something lit and the player is in Dark Cave:
	say "It is too dark to do that."
	
Instead of listening when the player does not carry something lit and the player is in the Dark Cave:
	say "You hear [the ambient noise of the Dark Cave].";
	
Instead of going southeast when the player does not carry something lit and the player is in Dark Cave:
	now the player is in the Alcove.

Section Dark Cavern

The Dark Cavern is northwest of the Dark Cave. "[if player does not carry something lit]It is too dark to see anything in this cave. The only thing visible is the opening to the northwest.[otherwise]A large cavern with a high ceiling that is covered in stalactites. Covering most of the floor of the cavern is a large pool of water.

To the northwest you can see the soft glow of the outside world reaching into the cavern. Back through the cave to the southeast leads to the entrance of the dark cave.[end if]"

The ambient noise of the Dark Cavern is "the infrequent chime of water droplets falling off stalactites and landing in the pool of water."

Instead of doing something when the player does not carry something lit and the player is in Dark Cavern:
	say "It is too dark to do that."
	
Instead of going northwest when the player does not carry something lit and the player is in Dark Cavern:
	now the player is in the Temple Gate.

Section Temple Gate

The Temple Gate is northwest of the Dark Cavern. "[if unvisited]You continue through the caverns, climbing upwards until you begin to see daylight.

[end if]You emerge and find yourself on the top of a narrow mountain peak, with steep jagged slopes leading down to a sea of clouds. In the distance you can see similar moss and juniper-topped peaks peeking out of the endless layer of clouds. 

To your west lies a large temple gate, painted a dried-blood red and decorated with ornate golden inlays. 

To the southeast is the cave opening leading back to the caverns."

Chapter Lighthouse

The Lighthouse Area is a region.

The Windy Path, Lighthouse Exterior Front, Lighthouse Exterior Back, Lighthouse Ground Floor, Lighthouse Basement are in the Lighthouse Area.

The storm clouds are a backdrop. "Dark clouds that stretch and cover the entire sky." They are in Windy Path, Lighthouse Exterior Front, and Lighthouse Exterior Back. Understand "sky" as the storm clouds.

The lighthouse building far is a backdrop. "A typical red and white striped lighthouse.[if off] It doesn't seem to be on. If the brewing storm is as bad as it looks, someone should turn it on soon.[otherwise] The light of the lighthouse passes by every few seconds, partially blinding you.[end if]". The lighthouse building far can be on or off. The lighthouse building is off. It is in Windy Path.

The lighthouse building near is a backdrop. "Yup, one of those red-white lighthouses. It is pretty beat up from the wind and ocean.[if off] There is no light coming from the top[otherwise] The light is on and passes by every few seconds, illuminating the ocean. There doesn't seem to be anything out there except the waves[end if]." The lighthouse building near can be on or off. The lighthouse building near is off.  The lighthouse building near is in the Lighthouse Exterior Front and the Lighthouse Exterior Back.

Section Windy Path

The Windy Path is southeast of the Rotunda. "[if unvisited] You walk through the archway in the southeast corner of the Rotunda. You find yourself immediately at the top of a long staircase that quickly winds out of sight around a corner and follow it downward.

The further you travel down, the damper the air feels. Suddenly you begin to smell salt on the air carried on a breeze that rushes past. Looking down, you notice that the steps here look slick with moisture. Eventuall you can see the opening at the bottom of the stairs and slip on the last step, barely catching yourself. Hesitantly, you step outside.

[end if]You stand on a small patch of ground almost at sea level protected by a cliff wall from a strong wind rushing past. . You can see the whitecaps of a violent ocean all around you. The sky is dark with a brewing storm. The strong wind blows the ocean into a fine mist that periodically sprays your face.

To the southeast is a narrow path that winds out to a lighthouse on a small island. Behind you to the northwest is a tall cliff face and the staircase leading back to the Rotunda."

Instead of going southeast when the player is not wearing something heavy and the player is in the Windy Path:
	say "You venture out from behind the protection of the cliff. The strength of the wind is able to push you around. If you try to walk out to the lighthouse as you are now, you will most likely get thrown into the sea by the wind. If only you weren't no light."

The ambient noise of the Windy Path is "the sound of the wind-thrown waves crashing against the winding path. Far away you hear the sporadic rumbling of the storm brewing".

Section Lighthouse Exterior Front

The Lighthouse Exterior Front is southeast of the Windy Path. "[if unvisited]You manage to walk slowly across the path, the turbulent sea occasionally breaking against the rocks to either side of you, spraying you with water. Slowly but surely you make it to the other side.

Looking back you can just make out a cliff that climbs several hundred feet into the sky and disappears in either direction. Guess there's not swimming around.

[end if]You stand on an islet surrounded by the roiling sea. The sky above is a dark gray and you can hear the sound of distant thunder. A storm is on its way. The island is just tall enough to save you from the constant sprays from the ocean waves. Although seemingly made of rocks, there is still grass beneath your feet.

The lighthouse tower stands before you with the stereotypical red and white stripes that all lighthouses seem to come with. There is no light coming from the lighthouse, but the light above the door means there must be some sort of power in the place. The screen door isn't latched down and continunally bangs against the lighthouse.

You can make out a pathway that leads southeast around the backside of the lighthouse." The printed name of Lighthouse Exterior Front is "Lighthouse Exterior - Front"

The ambient noise of Lighthouse Exterior Front is "the sound of waves crashing against the rocks and the rythmic beating of the screen door."

The Lighthouse Door is inside from the Lighthouse Exterior Front and outside from the Lighthouse Ground Floor. It is a door. The Lighthouse Door has a matching key the corroded brass key. The corroded brass key is in The End. The Lighthouse Door is closed. The Lighthouse Door is locked. It is not described. The description of the Lighthouse Door is "[if the player is in Lighthouse Exterior Front]The latch on the screen door is broken, causing it to slam back and forth in the strong winds. Behind is an old wooden door, painted aquamarine but chipped and worn from years of abuse.

Taped to the front is a faded handwritten note.[else]The door is old but sturdy. You can hear the muffled banging of the screen door on the other side.[end if]"

Instead of unlocking the lighthouse door with the corroded brass key:
	say "You turn the key in the lock and it snaps in your hand. [if the note is read]Sorry Sam. [end if]But hey, at least the door's unlocked now.";
	now the Lighthouse Door is unlocked.

The lighthouse keeper's note is text object. It is part of the Lighthouse Door. The description of the note is "In a messy script you can make out: 'Dropped key in well. Again. Out to get locksmith. Back when I'm back. - Sam'".

Instead of taking the note:
	say "If you take the note no one else will know what Sam is up to."

Section Lighthouse Exterior Back

The Lighthouse Exterior Back is southeast of the Lighthouse Exterior Front. "You stand behind the lighthouse on the back side of the tiny island. Nothing much except patches of grass and a small well. A path leads back northwest to the front of the lighthouse. There is also a slope leading down to a dock to the southeast from here." The printed name of the Lighthouse Exterior Back is "Lighthouse Exterior - Back".

The ambient noise of Lighthouse Exterior Back is "the sound of waves crashing against the rocks and the distant rumblings from the storm on the horizon."

The well is scenery in Lighthouse Exterior Back. It is not described. The description of the well is "A small circular well made out of irregular stones and mortar. The thing barely comes up to your knee. [if lowered]Looking down you see an old worn rope descend into darkness[else if raised]Looking down you see nothing but darkness[end if]. You find it hard to believe that there is fresh water down there. "

Understand "rope" as the well.

The well can be raised or lowered. The well is lowered.

The wooden bucket is a part of the well. The description of the wooden bucket is "A standard wooden bucket, equipped with standard Hole-in-the-Bottom® technology. Need a bucket that can't hold liquid? Try Hole-in-the-Bottom®!"

The wooden crank is a part of the well. The description of the crank is "An old wooden crank, used to raise and lower the well's bucket." 

Instead of turning the crank:
	if the well is lowered:
		say "You turn the wooden crank, pulling up [if the wooden bucket is a part of the well]a wooden bucket[else if the metal bucket is a part of the well]the metal bucket[else]the well's empty rope[end if] from below.";
		now the well is raised;
	else if the well is raised:
		say "You turn the wooden crank, lowering [if the wooden bucket is a part of the well]the wooden bucket[else if the metal bucket is a part of the well]the metal bucket[else]the well's empty rope[end if] into the depths below.";
		now the well is lowered;
		if the metal bucket is a part of the well:
			now corroded brass key is inside the metal bucket.

Instead of taking the wooden bucket when the wooden bucket is a part of the well:
	if the well is lowered:
		say "The bucket is far out of reach, best to bring it up first.";
	if the well is raised:
		say "You untie the bucket from the well and stash it away for later.";
		now the player carries the wooden bucket.
		
Instead of tying the metal bucket to the well:
	if the well is lowered:
		say "The end of the rop is far out of reach, best to bring it up first.";
	if the well is raised:
		if the wooden bucket is a part of the well:
			try taking the wooden bucket;
		if the metal bucket is not empty:
			say "You remove the contents of the metal bucket first.";
			repeat with item running through things contained by the metal bucket:
				now the player carries item;
		say "You attach the metal bucket to the rope.";
		now the metal bucket is a part of the well.

Instead of taking the metal bucket when the metal bucket is a part of the well:
	say "Sam the Lighthouse Keeper could probably use this bucket more than you.".

Section Lighthosue Ground Floor

The printed name of Lighthouse Ground Floor is "Lighthouse - Ground Floor." The description of Lighthouse Ground Floor is "You're in a room."

Section Lighthouse Basement

Lighthouse Basement is down from Lighthouse Ground Floor.

Chapter OfficeSpace

OfficeSpace is a region.

Reception Lobby, Utility Closet, Hallway, Break Room, Printer Room are in OfficeSpace.

The fluorescent lights are a backdrop. The description of the fluorescent lights is "The devil burns bright in those things." They are in OfficeSpace.

Section Reception Lobby

Reception Lobby is northwest of the Rotunda and south of the Hallway. "[if unvisited]You walk down a short hallway and reach a glass door. As you approach it, it slides open for you.

[end if]You are in a larger-than-average sized room. The first thing you notice is the terrible glow of fluorescent bulbs from overhead. Directly in front of you is a receptionist's desk. Behind it hangs a clock. To your left there are several chairs lined up against a wall along with a small table. Against the opposite wall from that is a fish tank. In a corner stands a potted ficus tree. 

To the north, next to the receptionist's desk is a plain white door. To the southeast is the hallway leading back to the Rotunda."

The receptionist's desk is scenery and a supporter in the Reception Lobby. "A wooden reception desk. Looks like it came right out of the 90s. On the front is plastered the ostentatious logo for Business Corp. LLC"

The clock is scenery in the Lobby. "It reads 4:10. The second hand is ticking in place."

The small table is scenery in the Lobby. "A small square table."

The fish tank is scenery in the Lobby. "Also lit by fluorescents. There is one sad goldfish swimming about. Such a huge tank for such a small fish."

The ficus tree is scenery in the Lobby. "Upon further inspection, you realize it is fake."

The placard is a thing on the receptionist's desk. "There is a placard on the receptionist's desk. It reads 'Hello, my name is Martha'. How friendly. But Martha is nowhere to be seen." The description of the placard is "It reads, 'Hello, my name is Martha'."
Instead of taking the placard:
	say "I don't think Martha would appreciate that.";
	
On the table is a magazine called the Meerkat Edition of National Geographic. The description of National Geographic is "Huh, Adult meerkats can kill and eat poisonous snakes and scorpions without being hurt because they've become immune to the venom. Pretty badass."

On the table is a magazine called the June 2008 Edition of People Magazine. The description of People Magazine is "According to the readers, Barrack Obama is sexier than John McCain - 57% to 43%. Kinda horrifying how close those figures are."

The ambient noise of the Lobby is "the low hum of those terrible fluorescents above you. The constant bubbling from the fish tank filter is, however, comforting"

The plain white door is a door and scenery. "A normal looking door with a card-swipe panel next to it." It is north of the Reception Lobby. It is locked. The ID card unlocks the plain white door. The printed name of the ID card is "ID card".
Instead of unlocking the plain white door with the ID card:
	say "You swipe the card and you hear the click of the door unlocking.";
	now the player is in the Hallway.
Instead of opening the plain white door when the plain white door is locked:
	say "It is locked. There is a card-swipe panel next to [the noun]."
Understand "panel" as the plain white door. Understand "swipe [something preferably held] on/over [something]" as unlocking it with (with nouns reversed).  Understand "swipe [something] with [something preferably held]" as unlocking it with. 

Section Hallway

The Hallway is a room. "You stand in the middle of a thin white hallway lit by fluorescent tubes. There are doors in every direction. At the southwest part of the hallway is a door that says 'Utility Closet'. The south end of the hallway is the door that leads back to the Reception Lobby."

Janitor door is a door and scenery. The description of the janitor door is "It says 'Utility Closet'." It is southwest of the Hallway and east of the Utility Closet. The printed name of janitor door is "utility closet door".
Understand "utility", "closet" as the janitor door.

The ambient noise of the Hallway is "the irritating buzz of those terrible fluorescents above you".

Section Utility Closet

The Utility Closet is a room. "A small room filled with cleaning supplies and other various maintenance items. Behind you, on the east wall, is the door."

The rickety shelving is a supporter and scenery in the utility closet. "Rickety metal shelving full of various cleaning supplies."

On the shelving is a copper coin called 17 copper coins. The price of the 17 copper coins is 0G 0S 17C. Understand "coin" as the 17 copper coins.

The crowbar is a thing in the utility closet. "A red and black crowbar leans against one of the shelves on the ground." The description of the crowbar is "A red and black crowbar. Good for prying things."

The metal bucket is a container in the utility closet. "In the corner is a plain metal bucket with the handle of an old mop sticking out of it." The description of the metal bucket is "A small metal bucket with a thin wire handle."
In the metal bucket is an old mop. The description of the mop is "An old mop, dirty from years of use."

After taking the metal bucket:
	say "Man, you have large pockets."
	
Instead of filling the metal bucket with a liquid (called the liquid):
	say "Carrying a whole bucket full of [liquid] would be way too annoying to carry around.".

The ambient noise of the Utility Closet is "the low hum of those terrible fluorescents above you".

Section Break Room

The Break Room is west of the Hallway.

Section Printer Room

The Printer Room is southeast of the Hallway. The Hallway is west of the Printer Room.

Chapter Dinoworld

Dinoworld is a region.

River Crossing, Lookout Point, Primordial Pools are in Dinoworld.

The ambient noise of Dinoworld is "a distant back and forth of birdsong accented by the buzz of timing insect life."

Section River Crossing

The River Crossing is northeast of the Rotunda. "[if unvisited]You walk down the long passage which quickly becomes wider and wider, eventually becoming the natural walls of a cave. Before you know it, you are outside the cave and out in the middle of a vast jungle. You turn around and only see a tall cliff face - far too tall to climb.

[end if]You stand before a wide river cutting it's way through the jungle. It looks as though one might usually cross here to the northeast, however the water level currently seems too high. Despite the heavy growth, you can make out a path following the river along its bank to the northwest and to the southeast. The path through the jungle going back to the Rotunda is to the southwest."

The ambient noise of the River Crossing is "the sound of birds and other wildlife moving through the vines and leaves. The river plays softly in the background."

Section Lookout Point

The Lookout Point is northwest of the River Crossing. "[if unvisited]You follow this path for at least a mile as it climbs up a steep slope. Eventually you come to a point at a cliff edge where you can see out across the tropical jungle. There are many smoking volcanos in the distance and in the sky you see huge birds. Looking closer you realize that they look more like giant bats. One passes by much closer to your vantage point and it is unmistakable - it is a pterodactyl. 

[otherwise]You stand on the edge of a cliff, looking out at the prehistoric jungle. In the distance you see volcanoes and large flying reptiles. [end if]Beneath where you stand, the river goes over a waterfall, flowing southeast toward the River Crossing. The path is quite easy to follow back there."

The one-armed skeleton is a person in the Lookout Point. "Leaning against a nearby rock formation is a one-armed skeleton." The description of the skeleton is "All the flesh has been picked off the bones. The clothes look like they have been torn apart to get to the flesh.[if the skeleton wears something] Around [printed name]'s neck is [the list of things worn by the skeleton].[end if]". The skeleton is dead. The printed name of the skeleton is "the one-armed skeleton".
The ID card is a necklace worn by the skeleton. The description of the ID card is "A Business Corp. LLC ID card for one Michael White. Looks like he has two arms in the picture."

After examining the ID card:
	now the printed name of the skeleton is "Michael White";
	now the skeleton is proper-named;
	now the printed name of the ID card is "Business Corp. LLC ID card".

Understand "Michael", "White", "Michael White" as the skeleton when the skeleton is proper-named.

Section Primordial Pools

The Primordial Pools is southeast of the River Crossing.

Chapter Wizards Workshop

Wizards Workshop is a region.

The Starry Clearing, the HutInterior, Great Library, Potion Lab, Wizzard's Bedroom are in Wizards Workshop.

Section Starry Clearing

The Starry Clearing is southwest of the Rotunda. "[if unvisited]You travel down a short hallway lit by torches and built out of the same stone as the Rotunda. It abruptly lets out into a dark forest. Although almost pitch black, the trees do not seem ominous. This tunnel of trees lets out into a clearing.

[end if]You stand in at the edge of a clearing in the forest. Underneath your feet is a cobblestone path overgrown by the forest. It leads across the clearing to a small hut. Despite the sun having set hours ago, the light from the stars above illuminates the entire clearing. That, and the light from the sliver of moon that seems to be positioned directly above the hut. A warm glow beckons you from a single window to come inside. A wispy trail of smoke can be seen coming out of a chimney on top of the hut."

The ambient noise of the Starry Clearing is "the comforting chirping of crickets."

The hut is backdrop in the Starry Clearing. "A small stone hut. The roof and door is made of wood, perhaps from the trees around you."

The trees are a backdrop in the Starry Clearing. "Only the tops of the trees can be seen on the edge of the clearing. Everything else is too dark to make out."

The moon is a backdrop in the Starry Clearing. "A thin crescent moon positioned directly above the hut."

The stars are a backdrop in the Starry Clearing. "The arm of some great galaxy reaches across the sky."

Section Shack

The hut door is a door and scenery. It is inside from the Starry Clearing and outside from HutInterior.

The ambient noise of the HutInterior is "the crackling firewoord in the fireplace."

HutInterior is a room. The printed name of HutInterior is "Hut Interior". "You stand in the small hut. It is only one room filled with all the necessities of a forest lifestyle. In the center of the hut is a wooden pillar holding the roof up. In one corner sits a small bed made of straw. Against another wall is a lit fireplace which illuminates most of the room. There is a small wooden table pulled close to the fireplace."

The lantern is in the HutInterior. "Hanging on a hook on the center pillar is an old oil lantern." The description of the lantern is "One of those really old lanterns that you imagine miners using in the middle ages."
Instead of taking the lantern:
	say "It is slightly out of reach.";
	
The small wooden table is scenery in the HutInterior. "A small wooden table with small gashes and abrasions in its surface."

The straw bed is scenery in the HutInterior. "An uncomfortable-looking bed made out of packed straw. The sheets are thrown sloppily across it."

The wooden pillar is scenery in the HutInterior.

On the small wooden table is a coin purse called leather coin pouch. The price of the pouch is 0G 0S 37C. The description of pouch is "An old and beaten leather pouch. The contents of the pouch are worth [price]."

On the small wooden table is a fork, a knife, a dirty plate.

The portal is a door. The portal can be activated or unactivated. It is unactivated. It is east from the end and outside from the end.

Section Great Library

The Great Library is a room.

Section Potion Room

The Potion Lab is east from the Great Library.

Section Wizzard's Bedrrom

The Wizzard's Bedroom is west of the Great Library.

Chapter The City

Underground City is a region.

Western City Center, Fountain City Center, Eastern City Center, Small Plaza, Narrow Street, Rundown Shops, Back Alley, Tavern, Abandoned Building, Abandoned Building Basement, and Secret Room are in Underground City.

Fountain City Center is in Underground City.

The ambient noise of the underground city is "the low hum of the bussling city."

Section City Center - West

Western City Center is east of the Fissure. The printed name of Western City Center is "City Center - West". "[if unvisited]Nervously, you begin to walk down this long and narrow crevasse, depp into the earth. The passageway is dimly lit by a warm light from below that seems to bring with it a dry gust of air. As you reach this light, the stairs become more even and the passageway widens and straightens out. 

Stepping through an archway, a vast city speads out before your eyes. The archway behind you is built into the wall of a massive dome of rock that envelops the city. The center of the dome is a small oculus which lets in a harsh light that illuminates the tops of the sprawling city. Climbing further down, you descend into the bussling crowd.

[end if]You stand at the edge of a great plaza in the enter of the city. The plaza extends eastward toward a great cathedral. Between here and there is a large fountain spurting higher than the buildings that surround the plaza. A dilapitated building sits at the south end of the plaza with boarded up windows and peeling paint. Toward the north the crowd snakes toward a smaller plaza."

Section City Center - Fountain

Fountain City Center is east of Western City Center. The printed name of Fountain City Center is "City Center - Fountain". "You stand next to a large fountain spurting high above you. Crowds of people are meandering aroundt he fountain, many sitting at it's side. Several groups of children are playing in the fountain, splashing the crystal clear water into the faces of their friends and running away. How cute. Food vendors with carts are walking slowly around the fountian, selling various meat-shaped things on sticks.

At the north end of the plaza, facing the fountain is a grand-looking tavern with a constant stream of people flowing in and out."

The fountain water is a liquid in Fountain City Center. The printed name of fountain water is "water". The fountain water is not described. The description of the fountain water is "The water is crystal clear and cool.".

The circular fountain is scenery in the Fountain City Center. The description of the circular fountain is "A large circular fountain right in the center of the city. The center of the fountain is a large statue of birds swarming up towards the center of the dome. They look to be crows or perhaps even raven. Out of the highest bird sprays a jet of cool clear water. Most of the fountain is a large shallow pool. Kids are playing around the center statue while their parents look on from the sids. In the water you can see tons of sparkling coins."

The fountain coins are coins in the Fountain City Center. The fountain coins are not described. The price of the fountain coins is 1G73S18C. 
Report taking the fountain coins:
	say "You scramble around the fountain for what feels like eternity trying to pick up all the coins you can. You manage to get [the price of the noun]!" instead.

Section City Center - East

Eastern City Center is east of Fountain City Center. The printed name of Eastern City Center is "City Center - East". "You stand at the east end of the great palza in the center of this underground city. Before you is a giant Cathedral that expands even higher into the sky than the fountain at the center of the plaza. Guards in shining gold and black armor stand in front of a huge wooden doors.

There is a dark alley between buildings to the north that leads along the face of the cathedral."

Section Small Plaza

Small Plaza is north of Western City Center. "The plaza you stand in is a good deal smaller than the central plaza. Here the people begin to disperse in different directions and head throughout the city. A small tree, the first you've seen that isn't a palm tree, sits in a small planter in the corner of the small plaza. It looks as though this plaza used to be an important center of the city, but now looks a little run down.

A narrow street runs eastward behind the shops and taverns that line the grand plaza on the other side."

Section Narrow Street 

Narrow Street is east of Small Plaza. "The thin street is filthy and swarming with flies and cockroaches. Above you are clotheslines with various sad-looking cloths haning up to dry.

To the west leads to a small plaza with what looks like a small tree."

Section Rundown Shops

Rundown Shops is east of Narrow Street and north of Eastern City Center. "Here a bunch of small rundown shops line the street. Most of the shops look closed or about to go out of business. It's strange to see such a discrepancy from just one street over. 

To the west the street runs toward a small plaza in the distance. To the east, the street winds narrowly behind the cathedral. Southward lies the front of the cathedral and the eastern side of the great plaza."

The hooded man is a person in the Rundown Shops. "A hooded man stands behind a small stand with an assortment of items for sale." The description of the hooded man is "You can't see his face except for his nose sticking out from behind the shadows of the hood. He gestures at you to come over."

The wooden stand is scenery in the Rundown Shops. The description of the stand is "A wooden stand built from uneven and assorted pieces of scrap wood. You're surprised that it can even stand."

The shop fronts is scenery in the Rundown Shops. The description of the shop fronts is "A bunch of boarded up windows and beaten signs adorn the shops along the street."

The iron boots are clothing on the wooden stand. The iron boots are plural-named. The iron boots are heavy. The iron boots are owned by the hooded man. The description of the iron boots is "[if the noun is owned by the hooded man]'I see you're intrested in these here boots. No one be able to push you round wit these. Only [price] and they can be yours'[else]These soles of the boots are studded with a think heavy iron plate. Not exactly comfortable or easy to walk in, but they sure do have their purpose[end if]." The price of the iron boots is 0G 24S 99C.

The rubber chicken is on the wooden stand. The rubber chicken is owned by the hooded man. The description of the rubber chicken is "[if the noun is owned by the hooded man]'A good taste! I like that in a customer. This rare item is a favorite of mine, I'll have you know. I'd hate to see it go. Unless you were to offer the right price. Perhaps, [price]?'[else]You try to remember why you bought this.[end if]." The price of the rubber chicken is 0G 0S 10C.

The magnifying glass is on the wooden stand. The magnifying glass is owned by the hooded man. The description of the magnifying glass is "[if the noun is owned by the hooded man]'Ye have a good eye! Crafted in a foreign land, this item gives the user the ability to see the unseeable! Fer the right price, but of course'[else]A brass magnifying glass with a ruby-jeweled handle. A little gawdy, but it works[end if]." The price of the magnifying glass is 0G 11S 49C.

Instead of talking to the hooded man when the player is in the Rundown Shops:
	say "'What are you buyin?'";
	say "[line break]-- Items for Sale --";
	repeat with item running through things owned by the hooded man:
		say "[line break][price of item] - [item ]";

Section Back Alley

Back Alley is east from Rundown Shops. "The alley ends at a door built into the back wall of the cathedral. Tall black metal fencework stops you from being able to get into the lush grounds surrounding the cathedral.

The alley goes back westward toward the rundown shops."

Section Tavern

Tavern is inside from Fountain City Center. "The tavern is a pretty lievely place. There is a constant flow of people coming in and out. At most of the tables there appear to be a card game going and laughter periodically burts out. Good to know this isn't one of those 'I challenge you to a duel' taverns. However there don't seem to be any open chairs at any of the tables anyway. Despite all the people coming in a out, the only empty seat in the place is at the bar.

Standing behind said bar is the bartender, staring at you and doing the typical 'cleaning the glass with a rag' motion that all bartenders seem to be experts at."

The bar is scenery in the Tavern. The description of the bar is "An old and worn-down bar. There are patrons filling up the stools, swapping stories and getting hammered."

The patrons are plural-named scenery in the Tavern. The patrons are a person. The description of the patrons is "The place is packed from wall to wall with laughter and friendly faces. The people at the tables seem to be immersed in a plethora of varying card and dice games. Meanwhile the people at the bar seem to be drinking as much and as fast as they can.".

The tavern bartender is a person in the Tavern. The bartender is not described. The description of the bartender is "Man, he's really cleaning that glass.".

Apple Juice is a liquid in the tavern. Apple Juice is owned by the bartender. Apple Juice is not described. The description of Apple Juice is "Tastes and smells like apples. Who would have known?" The price of Apple Juice is 0G0S15C.

Beer is a liquid in the tavern. Beer is owned by the bartender. Beer is not described. The description of beer is "The liquid of the gods. Its amber color and sparkling bubbles give you hope for humanity. It has the power to give instant courage and the power to take away balance. Not to be trifiled with." The price of beer is 0G0S65C.

Milk is a liquid in the tavern. Milk is owned by the bartender. The milk is not described. The description of milk is "You know, milk. It's like white and stuff. Comes out of a cow. Kinda weird that people drink it now that you think about it." The price of milk is 0G0S10C.

Instead of talking to the bartender:
	say "'Thirsty, traveler?'";
	say "[line break]-- Drinks for Sale--";
	repeat with drink running through liquids owned by the bartender:
		say "[line break][price of drink] - [drink]";

Section Abandoned Building

Abandoned Building is inside from Western City Center.

Section Basement

Abandoned Building Basement is down from Abandoned Building.

Section Sectret Room

Secret Room is inside from Basement.

Part Testing

When play begins (this is the run property checks at the start of play rule):
	repeat with item running through things:
		if description of the item is "":
			say "[item] has no description.";
	repeat with room running through rooms:
		if ambient noise of room is "":
			let region be the map region of room;
			if ambient noise of region is "":
				say "[room] has no ambient noise."