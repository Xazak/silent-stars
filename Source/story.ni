"Silent Stars" by Zaq Grow

Use dynamic memory allocation of at least 16384.

Include Basic Screen Effects by Emily Short.
Include Locksmith by Emily Short. Use sequential action.
Include Plugs and Sockets by Sean Turner.
Include Power Sources by Emily Short.
Include Computers by Emily Short.
Include Bulk Limiter by Eric Eve.
Include Epistemology by Eric Eve.
Include Shipboard Directions by Mikael Segercrantz.
Include Considerate Holdall by Jon Ingold.

Volume 1 - Setting Things Up

Book 1 - Abstractions, Generalizations, and Basic Physics

Part 1 - Redefining Standard Rules and Style

The describe what's on scenery supporters in room descriptions rule is not listed in any rulebook.

[To use these in text, include html-style tags within the text with square brackets: [i]italic type[/i], [b]bold type[/b]]

To say i -- beginning say_i -- running on: (- style underline; -).
To say /i -- ending say_i -- running on: (- style roman; -).
To say b -- beginning say_b -- running on: (- style bold; -).
To say /b -- ending say_b -- running on: (- style roman; -).

To say br: say line break; [use "[br]"]

Before printing the name of something while listing contents:
	if the holder of the noun contains exactly 1 thing, say "single ".

Before printing the name of a lit thing (called the item) while taking inventory in the dark:
	if the item is bright, say "shining ";
	if the item is dim, say "glowing ";

[cf examples 60 and 330 for possible alternatives to this rule]
Rule for printing a number of something (called the item):
	if the listing group size is 2, say "a couple [printed plural name of item]";
	if the listing group size is at least 3 and the listing group size is at most 5, say "a few [printed plural name of item]";
	if the listing group size is at least 6 and the listing group size is at most 8, say "several [printed plural name of item]";
	if the listing group size is at least 9, say "many [printed plural name of item]".

Part 2 - Space, Time, Physics

The time of day is 01:00 AM.
[invoke during game text using "[time of day as 24h time]"]
To say (relevant time - a time) as 24h time:
	let H be the hours part of relevant time;
	let M be the minutes part of relevant time;
	say "[if H is less than 10]0[end if][H]:[if M is less than 10]0[end if][M]".

Definition: a number is round if the remainder after dividing it by 10 is 0.
Definition: a supporter is occupied rather than empty if something is on it.
Definition: a container is occupied rather than empty if something is in it.

A thing can be notable or mundane. A thing is usually mundane.

Definition: a thing is miniscule if its bulk is 0.
Definition: a thing is tiny if its bulk is 1.
Definition: a thing is small if its bulk is at least 2 and its bulk is at most 4.
Definition: a thing is midsized if its bulk is at least 5 and its bulk is at most 9.
Definition: a thing is large if its bulk is at least 10.

Color is a kind of value. The colors are translucent, red, orange, yellow, green, blue, indigo, violet, grey, silver, pink, white, and black. A thing has color. A thing is usually silver. Understand the color property as describing a thing.

[rain suggested trapping the putting X in/taking X out events to change the color accordingly, wouldn't work for initial setup]
[To say the color of (item - a translucent thing):
	if the item encloses something:
		let bleen be the color of a random thing enclosed by the item;
		say "[bleen]";
	otherwise:
		say "transparent";]

A room is usually dark.

Neighboring relates rooms to each other.
The verb to abut (he abuts, they abut, he abutted, it is abutted, he is abutting) implies the neighboring relation.

The verb to be next to implies the neighboring relation.

Definition: a thing is immediate if it is in the location.
Definition: a thing (called the item) is nearby if the location of the item is next to the location of the player.
Definition: a thing is proximate:
	if it is immediate, yes;
	if it is nearby, yes;
	no;

A thing can be hot or cold. A thing is usually cold.

A room can be watery or dry. A room is usually dry.

To decide if the player is underwater:
	if the location is watery, yes;
	no;

Understand "your" as a thing when the item described is enclosed by the person asked.

Part 3 - Standard Actions

The standard report waiting rule is not listed in any rulebook.

Report an actor waiting:
	if the player is in Dreamspace:
		say "This is the waiting haiku." instead;
	else:
		say "This is the waiting message." instead;

Part 4 - Status Line, Game HUD, Misc

To set the status line:
	now the right hand status line is "[time of day as 24h time]";

To beep:
	say "Beep!"

Book 2 - Let There Be Light

Part 1 - Units and Definitions

Every room has some text called the dark-description. The dark-description is usually "(dark desc is empty)[br][description][br]"

Every thing has some text called the dark-description. The dark-description is usually "(dark desc is empty)[br][description][br]"

A thing can be bright or dim. A thing is usually dim. [how much light?]
A thing can be diffuse or direct. A thing is usually diffuse. [is it a flashlight or a lantern?]
A thing can be infrared. [this is a flag to allow unlit things to be visible in the dark regardless of actual light level]

[A container can be translucent. [this will allow light to travel into a container from the parent room, but prevent visibility otherwise(as soon as i get around to writing that part)]]

Definition: a thing is shining if it is lit and it is bright.
Definition: a thing is glowing if it is lit and it is dim.

Definition: a room is bright if it encloses a shining thing.
Definition: a room is dim:
	if it encloses a glowing thing and it does not enclose a shining thing, yes;

[these are meant to be on-the-fly calculations and the actual lighted/dark status of a room should probably not be relied upon as a measurement as it will change during play]
[these don't account for shining things being inside opaque containers right now]
To decide if the light level is bright:
	if the location encloses a shining thing, yes;
	no.
	
To decide if the light level is dim:
	if the location encloses a lit thing (called the luminant):
		if the luminant is shining, no;
		otherwise yes;
	no.

To decide if the light level is murky:
	if the location does not enclose a lit thing, yes;
	no.

Part 2 - New Rules

The can't act in the dark rule is not listed in any rulebook.
The first visibility rule:
	consider the new-visibility rulebook instead.

The new-visibility rules is a rulebook. The new-visibility rules have outcomes there is sufficient light (failure), there is mediocre light (failure), and there is insufficient light (success).

["There is sufficient light" and "There is mediocre light" are functionally the same, so the only way to tell the difference between the two is to trap the exceptions appropriately]
A new-visibility rule (this is the visibility level rule):
	if the light level is bright:
		there is sufficient light; [being in a bright room always passes all vis checks]
	otherwise if the actor is carrying a bright direct thing:
		there is sufficient light; [so does having a flashlight in hand]
	otherwise if the actor is carrying a dim direct thing:
		there is mediocre light; [but if the flashlight is getting weak...]
	otherwise if the light level is dim:
		if the noun is familiar, there is sufficient light; [we'll make an exception if the player has examined it before]
		otherwise there is mediocre light;
	otherwise if the noun is infrared:
		there is sufficient light; [make an exception for anything else flagged infrared]
	otherwise:
		there is insufficient light. [if none of the above is true, the player is probably in the dark]

[The shining-glowing exception causes a dark room to become lit if the room contains lit things, so by definition a dark room is one that does not contain any lit things, and thus nothing should be in scope. An exception might be made for familiar things the player has dropped; need to do more work]

[This rule is here to further assist the stock light adjustments conform to the new definitions:
If a room contains lit objects, AND is dark, it should be made lighted
If a room has no lit objects inside it, AND it is lighted, it should be made dark
A room can be forced to be lit by the use of a privately-named scenery object if needed
The initial "X is lighted/dark" statements should ONLY be used to set the initial lighting state of a given room]
The supplementary light adjustment rule is listed after the adjust light rule in the turn sequence rulebook.
This is the supplementary light adjustment rule:
	if the location is dark:
		if the light level is bright or the light level is dim:
			now the location is lighted;
	otherwise:
		if the light level is murky:
			now the location is dark.

Part 3 - New Activities

[Emma knows where is in the ship by memory anyway, so don't bother obscuring the names of rooms]
Rule for printing the name of a room (called the place) (this is the new room-name rule):
	[only certain actions and activities should get the full light treatment, everything else just gets the room]
	let light-description-toggle be false;
	if the current action is looking, now light-description-toggle is true;
	[if the player is in Dreamspace, now light-description-toggle is false;]
	[if the look action was automatically generated, we're going to skip announcing the name of the room again for now; would be a good place to insert a message later]
	if the printing the announcement of light activity is going on, say "..." instead;
	if light-description-toggle is false, say "[printed name of the place]" instead;
	if the light level is murky:
		say "[printed name of the place], in the [random dark-noun]" instead;
	if the light level is dim:
		say "[printed name of the place], in dim light" instead;
	if the light level is bright:
		say "[printed name of the place], in the [random light-noun]" instead;
	say "[printed name of the place]" instead.

Rule for printing the name of a dark room:
	follow the new room-name rule for the location instead;

Rule for printing the description of a dark room:
	say "[dark-description of the location]"; [must explicitly define a room because otherwise I7 will try to use the nonexistent "outside" as the room referred to]

[With regards to location contents listing after a dark room's description:
Because a dark room is defined as one that does not contain any lit things, it is thus impossible to see anything in the room. Again, an exception might be made for familiar things the player has abandoned here]

[since Emma knows where she is even in the dark, we want the rooms she arrives in to be visited as normal]
The replacement arrival check rule is listed instead of the check new arrival rule in the carry out looking rules.
This is the replacement arrival check rule:
	if the location is a room, now the location is visited;
	if in darkness:
		now the darkness witnessed is true;
		
[Changes the "You also see..." message written during room description to be a little more flexible]
Rule for listing nondescript items while the light level is dim (this is the illumination rule):
	let foo be a random number from 1 to 2;
	if foo is:
		-- 1: say "The [random lit visible thing] [random light-verb] "; [The glowing blorb shines on a sprocket.]
		-- 2: say "The [color of random lit visible thing] [random light-noun] from [a random lit visible thing] [random light-verb] "; [The shifting light from the glowing blorb illuminates a sprocket.]
	list the contents of the location, as a sentence, listing marked items only;
	say ".";

Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "There isn't a [noun] in sight!" instead;

Book 3 - Scenery, Furniture, and Props

Part 1 - Platonic Solids

Chapter 1 - Doors

A door usually has bulk 20.

Chapter 2 - Containers

The container interior rule is listed before the room description body text rule in the carry out looking rules. 

This is the container interior rule:
	if the actor is the player and the player is in an enterable thing (called current cage), say the inside-description of the current cage.

A container has some text called the inside-description. The inside-description is usually "How'd you get in here?" 

Before entering an enterable thing (called the cage):
	if the cage is closed, try opening the cage;

Before exiting:
	if the actor is inside a container, try opening the container exited from;

Part 2 - New Kinds

Chapter 1 - Various Groups of Words

A light-noun is a kind of value. The light-nouns are lightness, glow, gleam, glimmer, lambency, and incandescence.
A light-verb is a kind of value. The light-verbs are shows, illuminates, limns, reveals, and shines on.
A dark-noun is a kind of value. The dark-nouns are darkness, gloom, and shadows.

[A flicker is a kind of value. The flickers are insubstantial, insufficient, faint, muted, poor, weak, wavering, dim, low, shadowy, wan, subdued, tenuous, shifting, dull, anemic, frail, ghostly, and flickering.]

Chapter 2 - Appliances

A lightsource is a kind of device. A lightsource is usually red, lit, and switched on.

Carry out switching on the lightsource (called the flash):
	now the flash is lit;

Carry out switching off the lightsource (called the flash):
	now the flash is unlit; 

Chapter 3 - Control Panels & Controls

A panel is a kind of supporter.
The description of a panel is "A cheap amber-monochrome touchscreen. [if active]The controls seem to pulse and waver a little bit as you watch. Blasted cheap gear[otherwise]The display is dark[end if]."
The dark-description of a panel is "A [printed name] glows faintly in the dark." 
A panel has some text called the readout. The readout is usually "Awaiting Input".

[button count is not capitalized]
Report examining a panel (called the board):
	say "[printed name in title case] Readout: '[readout]'[br]";
	if the number of controls incorporated by the board is at least 1:
		say "[Number of controls incorporated by the panel in words] rhombus-shaped buttons are outlined: [list of controls incorporated by the panel with indefinite articles].";
	otherwise:
		do nothing;
	
A panel can be active or inactive. A panel is usually active.

[DEVICE TYPES:
button - single outcome, responds to PUSH (single outcome)
toggle - two outcomes, works via ON/OFF states (two outcomes)
dial - selects a value from N to X (three or more outcomes)
]

A control is a kind of thing. A control is fixed in place.
A control can be flashing or steady. A control is usually steady. Understand the flashing property as describing a control. 

A pushbutton is a kind of control. The description is "A simple button."

The button pushing rule is listed instead of the can't push what's fixed in place rule in the check pushing rules.
This is the button pushing rule:
	if the noun is a pushbutton, continue the action;
	otherwise consider the can't push what's fixed in place rule.

Report pushing a pushbutton: beep instead.
	
A toggle is a kind of control. The description is "A small plastic switch."
A toggle can be switched on or switched off.

Check pushing a toggle (called the frobber):
	if the frobber is switched on, try switching off the frobber instead;
	otherwise try switching on the frobber instead;

A dial is a kind of control. The description is "A selector dial; a small screen beside it indicates it is set to [setting]."
A dial has an indexed text called the setting. The setting is usually "foo".

The new block setting rule is listed instead of the block setting it to rule in the check setting it to rules.

This is the new block setting rule:
	if the noun is not a dial, say "You can't set that to anything, much less [the topic understood]." instead;

Carry out setting a dial (called the frobber) to:
	now the setting of the frobber is the topic understood;

Report setting a dial (called the frobber) to:
	say "You set [the frobber] to '[the setting of the frobber]'."

Part 3 - The Player's Persocom

Chapter 1 - The Hardware

A computer called a persocom is in the backpack. The description is "It's a small personal computer, affectionately called a 'sidebrain' by most engineers, of the sort to be worn on the forearm. These are truly the modern workhorse aboard a spacecan: now that you have one again, you can access all of the ship systems and make changes, once you're connected in." The dark-description is "The [color of persocom] [random light-noun] cast by the persocom throw peculiarly [if switched off]in[end if]distinct shadows across the walls and ceiling."
Understand "sidebrain" or "computer" as the persocom.
The persocom is wearable, green, and infrared.
A selection device called persocom's touchpad is part of the persocom. A laptop battery compartment called persocom's battery port is part of the persocom. A rechargeable battery called the graphene cell is in the battery port. The charge of the graphene cell is 30. A PS-plug called the extension jack is part of the persocom. The type of the extension jack is "device". The persocom has a thing called the attached device. The persocom has a thing called the connected device. 

Carry out switching on the persocom:
	now the persocom is lit;
	
Carry out switching off the persocom:
	now the persocom is unlit; 

After plugging the extension jack into something (called the external system):
	now the persocom is linked to the external system;

After unplugging the extension jack:
	now the persocom is linked to nothing;

[represents the extension jack being connected to something]
Linking relates one thing (called the attached system) to one computer. The verb to link (he links, they link, he linked, it is linked, he is linking) implies the linking relation. The verb to be linked to implies the linking relation.

Chapter 2 - The Software

Section 1 - The OS

The persocom runs a multiple-choice program called the operating system. The software priority of the operating system is 1. The options table of the operating system is the Table of GUI Options.

Table of GUI Options
topic	title	effect
"view devices"	"View Available Devices"	list-open-cnxns rule
"connect"	"Connect to Device"	init-device-cnxn rule

The persocom operations rules are a rulebook.
The attack vector is a rule that varies.

To give focus to (warez - some software):
	repeat with bar running through software run by the persocom:
		now the software priority of bar is 5;
	now the software priority of the warez is 1;
	try examining the warez;

A persocom operations rule (this is the list-open-cnxns rule):
	say "Ext Cable: [if there is nothing linked to the persocom]--no connection--[otherwise][attached system][end if][br]";
	repeat with foo running through broadcasting things:
		if foo incorporates an access point (called the bar):
			say "Found: [bar] ([foo])...";
			now the attack vector is the icebreaker against bar;
			say "Attack vector: [attack vector]...";
					
A persocom operations rule (this is the init-device-cnxn rule):
	if the attached system is not nothing, say "Skipping the extension port until software prompts are written.";
	blank out the whole of the Table of Available Connections;
	repeat with foo running through broadcasting things:
		choose a blank row in the Table of Available Connections;
		now the title entry is the printed name of the node providing access to foo;
		let bar be the node providing access to foo;
		now the target entry is foo;
		now the effect entry is the icebreaker against bar;
	give focus to the wifi-connector;
		
A persocom operations rule (this is the cnxn-handshake rule):
	say "This is the cnxn-handshake rule."

The persocom runs an enumerated multiple-choice program called the wifi-connector. The options table of the wifi-connector is the Table of Available Connections.

Table of Available Connections
index (a number)	title (text)	effect (a rule)	target (object)
with 20 blank rows

Section 2 - Wifi Connectivity

[include access points as parts of things to give them connectivity]
An access point is a kind of device. An access point is scenery and switched on. 
To decide which access point is the node providing access to (gadget - a thing):
	say "Looking for access point...";
	if the gadget incorporates a live access point (called the beacon):
		say "Success: [the beacon].";
		decide on the beacon;

[include embedded code as parts of access points to give the persocom something to run when it connects]
Embedded code is a kind of software. Every access point incorporates some embedded code (called its payload).

Executing relates a access point to a rule. The verb to execute (he executes, they execute, he executed, it is executed, he is executing) implies the executing relation.

To decide which rule is the icebreaker against (gibson - an access point):
	say "Looking for attack vectors against [the gibson]...";
	if the gibson relates to a rule by the executing relation:
		decide on the rule to which the gibson relates by the executing relation;

[intended to represent a wireless data cnxn between the 'com and a target device]
Connecting relates one thing (called the connected system) to one computer. The verb to connect (he connects, they connect, he connected, it is connected, he is connecting) implies the connecting relation. The verb to be connected to implies the connecting relation.

Definition: an access point is live rather than dead if it is switched on.
Definition: a thing is broadcasting:
	if it incorporates a live access point:
		if it is immediate:
			yes;
		no;
	no;

[To interface the persocom with (the client - something):
	now the persocom is connected to the client;
	begin the transceiving activity with the the client;

Transceiving something is an activity.
The transceiving activity has a thing called the gadget connected to.
The transceiving activity has a thing called the gateway. 

Before transceiving something (called the client):
	now the gateway is the client;
	now the gadget connected to is the gadget corresponding to an archway of the client in the Table of DNS Information;

Rule for transceiving something (called the client): say "Now connected to [client]."]

Section 3 - Gadget Hacking

Incorporated by the medbay door is a device socket. An access point called medbay-door-west is part of the medbay door. Some embedded code called medbay-door-hack is part of the medbay door. Medbay-door-west is executing the medbay-door-hack rule.

This is the medbay-door-hack rule:
	say "The medbay-door-hack rule has been run successfully.";

Book 4 - Actors

Part 1 - The Body

Chapter 1 - Let's Get Physical

A person can be asleep or awake. A person is usually awake.

Definition: a person is naked rather than clothed if he is not wearing something.

A person can be dirty or clean. The player is dirty.

[this may need to be tweaked for exclusion later - should be easy enough to implement an object-based rulebook]
After an actor taking something wearable (called the beanie):
	if the actor is the player, try the player wearing the beanie.

Check an actor wearing something(this is the clean clothing rule):
	if the actor is dirty, say "You're too dirty to put that on. You'll need to get cleaned off first." instead;
	
The player has a number called the wound total. [used to count the number of scars the player walks out with]

The player has a number called the health index. [used to track the current total severity of all wounds, NTA]

[carrying capacity rules are built into each appropriate action and issues a library message, will need to override the msg in order to change it]
[The new can't carry too many things rule replaces the can't exceed carrying capacity rule.
This is the new can't carry too many things rule:
	if the number of things carried by the actor is at least the carrying capacity of the actor:
		if the right hand is injured or the left hand is injured:
			say "Your {{right hand}} is {{broken}}; you'll need to patch it up before you can use it effectively." instead;
		otherwise:
			say "You only have two hands! You'll have to drop some of the things you're carrying to do that." instead;]

A limb is a kind of thing. Some limbs part of the player are defined by the Table of Body Parts.

Table of Body Parts
limb	description
head	"OKEY"
neck	"OKEY"
face	"OKEY"
chest	"OKEY"
thorax	"OKEY"
abdomen	"OKEY"
pelvis	"OKEY"
left shoulder	"OKEY"
left arm	"OKEY"
left hand	"It's your left hand. [if the light level is murky]You flex it once or twice to make sure it's still there[otherwise]Missing fingertip on middle finger (bar fight), blank pinky fingerprint (close call with industrial acid), inoculation and transit scars on the back (expensive counterfeits)[end if]."
right shoulder	"OKEY"
right arm	"OKEY"
right hand	"It's your right hand. [if right hand is healthy]Nothing to see here[else]The only interesting things about it are the scars it's picked up[end if]."
left leg	"OKEY"
left knee	"OKEY"
left foot	"OKEY"
right leg	"OKEY"
right knee	"OKEY"
right foot	"OKEY"

After examining a limb (called the appendix):
	if the appendix is harmed by an injury (called the psychoknife):
		try examining the psychoknife;

Chapter 2 - Injuries and Attacking the Player

A modality is a kind of value. The modalities are laceration, contusion, puncture, heat-burn, frost-burn, rupture, contusion, acid-burn, alkali-burn, steam-burn, poison, radiation, and fracture.

A remedy is a kind of thing. The description is usually "A green box with a white + on the front." A remedy has a list of limbs called the applications. The applications are usually {right hand, left hand}. A remedy has a number called the usefulness. The usefulness is usually 1. A remedy has a list of modalities called the factors. The factors are usually {laceration, contusion, puncture, rupture}.

An injury is a kind of thing. The description of an injury is usually "You haz a sad :( ". An injury has a number called the severity. The severity is usually 0. [scale is 0 - OK to 6 - maximal (i.e. impossible to treat)]

An injury has a limb called the site.

An injury has a modality called the class.

Definition: an injury is active rather than inactive if it is harming something;
Definition: an injury is treated rather than untreated if a remedy is curing the injury.

Curing relates one remedy to one injury. The verb to cure (he cures, they cure, he cured, it is cured, he is curing) implies the curing relation. The verb to be treated by implies the reversed curing relation.

Harming relates various injuries to one limb. The verb to harm (he harms, they harm, he harmed, it is harmed, he is harming) implies the harming relation.

Definition: a limb is injured rather than healthy if it is harmed by an untreated injury.
Definition: a person is injured rather than healthy if she is incorporating an injured limb.

To attack with (mindbullets - an injury):
	let the strikezone be the site of the mindbullets;
	now the mindbullets are part of the strikezone;
	now the mindbullets are harming the strikezone;
	now the mindbullets are seen;
	now the mindbullets are familiar;
	if the mindbullets is:
		-- the jagged slash:
			decrement the carrying capacity of the player;

After examining an injury (called the psychoknife):
	if the psychoknife is untreated:
		say "The [printed name of psychoknife] oozes and suppurates. You should get that looked at.";
	if a remedy (called the blessing) is curing the psychoknife:
		try examining the blessing;

Part 2 - Old & New Verbage

Report touching yourself: try examining yourself instead.

To pay attention:
	let foo be a random number between 1 and 5;
	if foo is:
	-- 1: try listening;
	-- 2: try smelling;
	-- otherwise: say "[br]".

Chapter 1 - Vision

[does not take windows and open doors into account yet]
The new examine directions rule is listed instead of the examine directions rule in the carry out examining rules.
This is the new examine directions rule:
	if the noun is a direction (called thataway):
		let place be the room thataway from the location;
		if the place is nothing:
			try examining the-nothing instead;
		otherwise:
			say "You gaze [thataway]wards.[br]";
			say the description of the place;
		now examine text printed is true;

Chapter 2 - Hearing

Every thing has some text called the sound. The sound of a thing is usually "silence".
Every thing has some text called the sound-description. The sound-description is usually "This does not make noise."
Every room has some text called the sound. The sound of a room is usually "silence".
Every room has some text called the sound-description. The sound-description is usually "Total silence."

Definition: a thing is noisy rather than silent if the sound of it is not "silence".
Definition: a thing is clamorous if it is noisy and it is notable.

Definition: a room is noisy rather than silent:
	if it encloses a noisy thing, yes;
	if the sound of it is not "silence", yes;
	no.

Definition: a thing is audible:
	if it is silent, no;
	if it is clamorous:
		if it is nearby, yes;
	if it is immediate, yes;
	no.

Audibility relates a person (called the listener) to a thing (called the duck) when the duck is audible.

The verb to be able to hear (he is heard) implies the audibility relation.

The verb to hear (he hears, they hear, he heard, it is heard, he is hearing) implies the audibility relation.

The verb to holla (he hollas, they holla, he hollad, it hollad, he is hollin) implies the reversed audibility relation.

The block listening rule is not listed in any rulebook.

Understand the command "listen" as something new.
Understand "listen to [things]" as listening to.

Check listening to:
	if the noun is silent, say "You hear nothing from the [printed name]." instead;  

Report listening to:
	say "[sound-description of the noun][br]"; [included br because don't want to insist on punct. here]

Understand "listen" as listening ambient.
Listening ambient is an action applying to nothing.
The listening ambient action has a list of things called ducks.

Check listening ambient:
	add the list of things heard by the player to ducks;
	if ducks is empty, say "You hear only the silence of a scuttled ship." instead;

Report listening ambient:
	let report-list be a list of things;
	repeat with foo running through ducks: [sort the ducks by proximity to the player]
		if foo is nearby:
			add foo to report-list; [add it to the bottom of the queue]
		otherwise:
			add foo at entry 1 in the report-list; [add it to the top of the queue]
	repeat with bar running through report-list:
		if bar is nearby, say "Nearby, [sound-description of bar][br]";
		otherwise say "[sound-description of bar][br]";

Chapter 3 - Touching

[three rules already exist in SR: report touching yourself, report touching other people, and report touching things]

Chapter 4 - New Verbs

Section 1 - Diving

Understand "dive" or "dive in" or "jump in" as diving in.
Diving in is an action applying to nothing.

Before diving in:
	let puddle be the room down from the location;
	if the puddle is nothing:
		say "There's nothing to dive into here." instead;

Carry out diving in:
	move the player to the room down from the location;

Report diving in:
	let puddle be the room down from the location;
	if the puddle is in Dreamspace:
		if the location is the rocky shore:
			say "One breath, plus one held.[no line break][br]Even your bones feel like ice.[no line break][br]Darkness shrouds your thoughts.";
		otherwise:
			say "The light calls you down.[no line break][br]You kick your legs, jaw clenched.[no line break][br]Frost tightens your chest.";
	otherwise if the player is underwater:
		say "You kick your legs hard and dive down a few more feet.";
	otherwise:
		say "You set your feet, then take two steps and dive into the {liquid}.";
		
Section 2 - Healing

Healing it with is an action applying to one thing and one carried thing and requiring light.
Understand "heal [some injury] with [some remedy]" as healing it with.
Understand "use [some remedy] on [some injury]" as healing it with (with nouns reversed).
The healing it with action has an injury called the snakebite.
The healing it with action has a remedy called the snake oil.

Setting action variables for healing:
	now the snakebite is the noun;
	now the snake oil is the second noun;

Check healing (this is the can't use a bandaid on a gunshot rule):
	if the usefulness of the snake oil is less than the severity of the snakebite, say "You're going to have to find something stronger than that if you want to fix that [snakebite]." instead;
	
Check healing (this is the left-handed bandaid rule):
	if the site of the snakebite is not listed in the applications of the snake oil, say "You grimace: close, but not quite. This [snake oil] won't fit on your [site of snakebite]." instead; 

Check healing (this is the right tool for the job rule):
	if the class of the snakebite is not listed in the factors of the snake oil, say "Can't treat a [snakebite] with a [snake oil], unfortunately. Gotta find something that will work on a [class of snakebite]." instead;

Carry out healing:
	now the snake oil is curing the snakebite;
	if the snakebite is:
		-- the jagged slash:
			increment the carrying capacity of the player;
	if the snake oil is:
		-- the bandage:
			now the snake oil is part of the snakebite;
			now the applications of the snake oil is {};
			add the site of the snakebite to the applications of the snake oil;
			now the description of the snake oil is "A clean white bandage is wrapped around your [applications]."; 
	
Report healing:
	say "You use the [snake oil] to fix the [snakebite]." 

Part 2 - Player Details

The printed name of the player is "Emma". The player is female. The bulk of the player is 20. 
The carrying capacity of the player is 2. The bulk capacity of the player is 25.

Instead of examining yourself:
	let diagnostic be the list of untreated active injuries;
	say "You pause for a breath and look yourself over:[br][br]";
	if the diagnostic is empty:
		say "You're in good health. No problems here.";
	otherwise:
		repeat with foo running through the diagnostic:
			say the description of foo;
	say line break;

Volume 2 - The Starlight Dancer

The player is in the autodoc.[move the player back to the rocky shore before releasing]

Book 1 - Dreamtime

The Dreamspace is a region.
[override usual scope behaviour while we're here]
After deciding the scope of the player while the location is in Dreamspace:
	place the location in scope;
	place the stone in scope; [the glow from this is visible all the way up]
	
A rocky shore is a room. The rocky shore is in the Dreamspace. The printed name of the rocky shore is "[one of]jagged[or]craggy[or]gravelly[or]cracked[or]sharp[at random] rocks";
"Rocks gnaw your bare feet.[br]The darkness is a vast cloak.[br]Nothing lies behind.[br][br]Still water cools the air.[br]It seems to stretch forever.[br]No waves touch your feet."

Before taking something while the location is the rocky shore for the first time:
	say "You plunge a hand in.[no line break][br]It's like bare skin in deep space.[no line break][br]Sensation departs.";
	
At 1:00 AM: 
	say "[if the player is in the rocky shore]A shining stone falls.[otherwise]Above, a stone falls.[end if]The water glows with pale light.[no line break][br]Ripples lap the shore.";
	move the stone to the upper pool;

A thing called the-nothing is here. The printed name of the-nothing is "nothing". Understand "darkness" as the-nothing. Understand "nothing" as the-nothing. Does the player mean examining the-nothing: it is very likely.
The-nothing is scenery, infrared.
The description is "In nothing, stillness.[br]Fear and curiousity.[br]Turn lightward for now."

A backdrop called the water is in the rocky shore, the upper pool, and the lower pool.
The description is "[if the location is the rocky shore]You dip your fingers.[br]Deathly cold, then painful heat.[br]You flinch back, anxious.[otherwise]Blacker than midnight.[br]The chill reaches through your skin.[br]Your limbs feel distant.[end if][if the stone is in the lower pool][br][br][the initial appearance of the stone][end if]";
The water is infrared.

Down from the rocky shore is the upper pool. The upper pool is in the Dreamspace.
"The water [if the time of day is 1:01 AM]grows[otherwise]is[end if] still.[br]Shadows crowd in overhead.[br]The silence deafens."

Every turn while the location of the stone is below the location of the player:
	say the initial appearance of the stone;
	say line break;

Every turn while the stone is in the upper pool:
	move the stone to the lower pool;
	say "The pale gleam recedes.[no line break][br]Inky dark cloaks the water.[no line break][br]The waves settle down.";

Down from the upper pool is the lower pool. The lower pool is in the Dreamspace. "The bottom is smooth.[br]No signs of life scar the mud.[br]Your guts feel frostbit."

There is a stone in the lower pool. The stone is lit. "[if the location encloses the stone]Before you, a stone.[otherwise]Under you, a stone.[end if][br]It glows like a faint firefly.[br]Pale white, and falling." The description is "Ivory colored quartz.[br]Cloudy, like a summer day.[br]Warmer than skin heat."
The stone is infrared.

Before examining the stone:
	if the player is not holding the stone, say "Admired at range,[br]the stone's glow waxes and wanes[br]like a  tiny moon." instead;

Before taking the stone:
	if the stone is not touchable, say "Struggling brings ruin.[no line break][br]The depths are the only way.[no line break][br]Commit all, or none." instead;

Report taking the stone:
	say "You reach out, eager.[no line break][br]Chains of ice tug at your limbs.[no line break][br]Your chest burns furnace-hot.[no line break][br][br]A veil draws across.[no line break][br]Red on black, crimson silk red.[no line break][br]The bright sting of pain.[no line break][br][br]You gaze at your hand.[no line break][br]Streams of red hang like silk scarves.[no line break][br]The wound glows ruby.[no line break][br][br]";
	wait for any key;
	say "The red glow flickers.[no line break]" instead;

Book 2 - Deck A

Deck A is a region.

Part 1 - The Autodoc

The Autodoc is a room. "You're lying down inside a metal coffin that isn't much larger than you. It (you?) reeks of medical disinfectants; the fuzziness in your head feels like it's keeping away a headache from all the fumes."
The printed name of the autodoc is "Antiseptic Coffin". Understand "coffin" as the Autodoc. The dark-description of the Autodoc is "It's cold and damp and dark in here."
The Autodoc is in Deck A.
Index map with the Autodoc mapped south of the Medical Bay.

There is a panel called the control panel in the Autodoc. 
"[if active]A flashing red button on the control panel above you casts flickering shadows[otherwise]The control panel above you awaits input[end if]."
The description is "The edges of the [printed name] have some biogunk in them."
The dark-description is "An amber-colored [printed name] shines wan light onto your sternum."
The readout is "Confirm Amputation Surgery Cycle Has Completed". 
The control panel is lit.
[control panel active == autodoc is running]

[need to adapt the buttons to track their on-off status rather than intercepting their logic wholesale]
The cycle button is a flashing red toggle. The cycle button is part of the control panel. The cycle button is switched on.
The description of the cycle button is "It's red and flashing 'Confirm?' in big letters." 
Carry out switching on the cycle button:
	now the control panel is active;
	now the readout of the control panel is "Please Select A Diagnostic Routine (there's none to select)";
	now the cycle button is flashing;
	now the cycle button is red;
	now the description of the cycle button is "It's [color] and says 'Select Routine'."

Carry out switching off the cycle button:
	now the control panel is inactive;
	now the readout of the control panel is "Autodoc Inactive";
	now the cycle button is steady;
	now the cycle button is grey;
	now the description of the cycle button is "It's [first time]now[only] a blank [color] button.";
	now the unlock button is flashing;

Report switching off the cycle button:
	say "The [printed name] fades from red to green and blinks 'Cycle Complete' a couple times." instead;

The unlock button is a pushbutton. The unlock button is part of the control panel.
Check pushing the unlock button:
	if the control panel is active:
		say "ERROR: Completion of surgery cycle has not been confirmed." instead;
	if the autodoc door is unlocked:
		say "ERROR: Autodoc hatch is not sealed." instead;

Carry out pushing the unlock button:
	now the autodoc door is unlocked;
	now the exit button is flashing;

Report pushing the unlock button:
	say "The button flashes a couple times; there is a metallic [i]click[/i] as the locks disengage." instead;

The exit button is a pushbutton. The exit button is part of the control panel.
Check pushing the exit button:
	if the autodoc door is locked:
		if the control panel is active:
			say "ERROR: Completion of surgery cycle has not been confirmed." instead;
		otherwise:
			say "ERROR: [printed name of autodoc's hatch] is locked." instead;

Carry out pushing the exit button:
	now the autodoc door is open;
	now the exit button is steady;

Report pushing the exit button:
	say "A beat passes, and then the hatch seal on the [printed name] disengages with a whoosh of pressurized air. The stench of old blood quickly replaces the tang of disinfectants." instead;

A door called the autodoc door is outside of the Autodoc and inside of the Medical Bay. "[if player is in Autodoc]A small plastex [printed name of hatch window] is set into the hatch above you.[else]The dark hulk of the autodoc crouches in one corner." It is locked. The printed name of the Autodoc's hatch is "hatch". The description of the autodoc's hatch is "The door of the coffin. There is a tiny plastex window the size of a playing card directly in front of your head, and a control panel a few inches below that."

Before opening the autodoc door:
	say "You reach up and push the exit button.[command clarification break]"; 
	try pushing the exit button instead;

Report closing the autodoc door:
	say "There is a hiss of air as the hatch seals pressurize." instead;

Report going through the autodoc door to the Medical Bay during Autodoc Escape:
	say "You sit up, lift open the hatch with one shoulder, and roll over the lip of the autodoc. The fall to the ground is thankfully short.";

The hatch window is part of the autodoc door. The description of the hatch window is "The frosted plastex shows only flickers of dim light on the ceiling above." 

Part 2 - The Medical Bay

The Medical Bay is a room. The Medical Bay is in Deck A. The Medical Bay is dark.
"[first time]You make a [i]splash[/i] instead of a [i]thud[/i] when you land. As you raise your {{drug-addled}} head to look, you choke down the urge to vomit as you realize the syrupy black gunk coating your arms up to the bicep is half-dried blood. The puddle is almost ankle-deep and wall-to-wall.[br][br][only]
{{'Disarray' is putting it mildly:}} every single cabinet in the room is open and empty. Some of the doors have been torn off the hinges and lie mangled in a corner. The grey tile floor is littered with broken glass, bits of medical paraphernalia, and dried blood."

A container called a chemical shower is here. The shower is [transparent, ]openable, enterable, and closed.
"A green vinyl curtain is drawn across the entrance to a small chemical shower."
The description is "The humble chemical shower is equipped with a variety of {{anti-chemical chemicals}} and its own fluid reclamation system. [br][br]A green vinyl curtain[if the shower is open] hangs to one side.[else] is drawn across the entrance."
The inside-description is "The extruded fiberglass walls are only just wide enough apart to let you in. A spigot overhead must be where the {{soapy water}} comes out; a drain underfoot must be where it goes. [br][br]A green vinyl curtain[if the shower is open] hangs to one side.[else] is drawn across the entrance."
[the room description should appear slightly shrouded when the curtain is closed]

Does the player mean entering the shower: it is likely.

Check taking the shower:
	try pushing the shower cycle button instead;

Report opening the shower: say "The plastic rustles as you push the curtain aside." instead;

Report closing the shower: say "You tug the curtain across the entrance." instead; 

A vinyl curtain is part of the chemical shower. The curtain is green and scenery.
The description is "A sheet of emerald plastic hangs from a curtain rod."

A curtain rod is part of the vinyl curtain. The rod is grey and scenery.
The description is "A metal rod has been bolted into either side of the chemical shower, where it continues to hold the shower curtain in place."

A lightsource called a chemical lamp is inside the shower. The lamp is yellow and scenery.
The description is "A simple chemical light is glued to the roof of the shower. They say these are supposed to be good for a couple centuries; you suppose this one has at least another century and nine-tenths to go before it burns out."

Instead of switching off the chemical lamp: say "It can't be switched off."

A showerhead is inside the shower. The showerhead is scenery. The description is "A metal shower head. It hangs directly above, and appears to thread onto a pipe."

A drainspout is inside the shower. The drainspout is scenery. The description is "An eight-inch round metal grate has been set into the floor."

A pushbutton called the shower cycle button is inside the chemical shower. The printed name is "cycle button". "The only controls in here are a fist-sized button labeled 'PUSH' in big block letters." The description is "A single black rubberized button, large enough to hit blindly in a panic if need be.[first time][br]A lightning-flash of memory: eyes burning pain eating around eye sockets like the devil's fingers scooping the -[br]You stifle that thought even as remembering it triggers a quick squirt of adrenaline like a cold hand trailing down your spine.[only]"

Before pushing the shower cycle button:
	if the chemical shower is open:
		try closing the chemical shower;

Check pushing the shower cycle button:
	if Drain The Blood has not ended:
		say "You can practically feel that shower already, but the slick wall-to-wall scarlet on the floor stays your hand. No matter how clean you get, stepping back into that murk is going to make you just as dirty as before." instead;

Carry out pushing the shower cycle button:
	now the player is clean;

Report pushing the shower cycle button:
	say "You slap the cycle activation button. The warm water on your corpse-chilled flesh stings at first, but a moment or two later and it's the best thing you can remember feeling in a long time.[br]The water stops, and you realize you haven't actually scrubbed down. You hit the cycle button again (tamping down a brief pang of guilt - 'Water is liquid gold aboard a starship!') and use the little plastic scrubber to get all the nooks and crannies.[br][i]Much[/i], much better." instead;

A container called some lockers is here. The lockers are open and not openable.
"A bank of gear lockers along one wall have received a similar treatment as the cabinets."
The description is "The crew lockers are busted to hell, though they're usually empty anyway. They're only meant as temporary storage, until the assigned crewman gets back on their feet[first time].[br][br]The locker on the far end appears to be intact: the lock panel on its face glows red[only]."

After examining some lockers for the first time:
	now the personal locker is not scenery;
	now some lockers are scenery;

Instead of inserting something into some lockers: say "None of the [if personal locker is familiar]other [end if]lockers look like they will support weight."

Does the player mean doing something with some lockers: it is unlikely.

A container called the personal locker is here. The personal locker is locked and fixed in place. The color of the personal locker is red.
"One of the gear lockers is still intact; the controls glow [color of combo lock]."
The description is "The nameplate reads 'E. Lumien'. It looks like it's [if unlocked]un[end if]locked."

After examining the personal locker for the first time:
	now the initial appearance of the personal locker is "Your gear locker sits at the end of the row, controls glowing [color of personal locker]."

Understand "far/my locker" as the personal locker.

A dial called the combo lock is part of the personal locker. The combo lock is red.
The description is "The locker will open provided you enter the correct 4-digit PIN. The lock is currently [color of combo lock]: the locker is [if personal locker is unlocked]un[end if]locked."

After setting the combo lock to some text (called the foo):
	if foo is "4444", do nothing;
	otherwise say "The lock beeps and remains red.[if the mysterious corpse is familiar] That corpse over by the wall had scrawled '4444' before he perished..." instead;

After setting the combo lock to "4444":
	now the personal locker is unlocked;
	now the color of the personal locker is green;
	now the color of the combo lock is green;
	silently try opening the personal locker;
	say "The lock changes from red to green and the door [i]pops[/i] open, revealing ";
	list the contents of the personal locker, as a sentence;
	say ".";

After closing the personal locker:
	now the personal locker is locked;
	now the color of the personal locker is red;
	now the color of the combo lock is red;
	say "There is a [i]click[/i] as the lock engages. The readout blurs from green to red.";

A jumpsuit is inside the personal locker. The jumpsuit is wearable and indigo. "A clean and folded jumpsuit rests on the shelf of the locker." The description is "It's a standard crew shipsuit, colored indigo, with the Starlight Dancer's black-and-gold insignia on the left shoulder. No name on it; your personal jumpsuits are back in your cabin."

A remedy called a bandage is inside the personal locker. "A sterile adhesive bandage, still in its wrapper, lies on the shelf of the locker." The description is "An adhesive bandage. It's basically an extra-big bandaid; the long adhesive strips let you get it on practically anywhere you need it." 
The usefulness of the bandage is 1. The applications of the bandage are {right hand}. The factors of the bandage are {laceration}.

A player's holdall called the backpack is inside the personal locker. "A small and versatile-looking backpack rests in the back of the locker." The description is "It's a small gear bag, of the sort commonly used as technical carryalls aboard most starships. This one is made of industrial nylon, appears to be waterproof, and has multiple straps and pockets and such to accomodate a wide variety of tools and equipment."
The backpack is wearable. The bulk capacity is 50. The carrying capacity is 100.
Understand "gear bag" as the backpack. 

[see above for all of the details on the player's persocom, it starts play inside this bag]

A pile of mangled junk is here. The junk is fixed in place.
"A giant pile of debris lies more or less in the corner."
The description is "Most of it looks to be wreckage from whatever went berserk in here[first time]. Strangely, all of it's been piled up here in the corner[only]."
Understand "debris" as the junk.

A piece of scrap is in the pile of junk. "A wickedly-curved piece of flat scrap lies propped against some junk."
The description is "A piece of flat metal shaped something like a capital J. The curved end has a rather pointy tip."
The piece of scrap is unstashable.
	
Report the player taking the piece of scrap:
	say "You find and take a handy-looking bit of metal[if the drain is familiar]. This should be just the thing to unclog that drain with[end if]." instead;

Report the player dropping the piece of scrap when Drain The Blood has ended:
	say "You toss the foully-choked piece of junk aside. Won't need that again.";
	remove the piece of scrap from play;

After examining the pile of junk:
	if the drain is familiar and the pile of junk is occupied:
		try the player taking the piece of scrap;
		
A pool of blood is here. The blood is fixed in place.
"The floor is ankle-deep in blood. It gurgles and sloshes as you move about. You try not to move around too much."
The description is "The emergency lighting makes it look near-black, with a monochrome-red sheen almost like machine oil. You'd prefer the smell of machine oil over this organic reek, come to that."

After examining the pool of blood for the first time:
	say "You can't see a drain through the murky surface, but if you had to guess it'd be right about in the middle of the floor. You'll have to search for it a bit though.";

Instead of searching the blood:
	move the drain to the Medical Bay;
	now the drain is familiar;
	say "You take a breath and hold it before plunging both hands into the murk and feeling your way across the floor. The drain is (fortunately) right where you expected. However, your hand grazes something obscenely organic clogging the drainspout, slick and coarse and squelchy-wet. The sensation makes you recoil in disgust; you slip an inch or two on the tile but recover before falling in.";
	
There is a closed locked container called a drain. The drain is fixed in place.
"[if the pool of blood is not in the drain]A clogged drain lies under the rippling surface of the pool.[else]A steel mesh drain has been set into the middle of the tile floor."
The description is "[if the drain is locked]You gingerly reach out and touch the drain, trying not to brush up against that disgusting clog too much. [end if]The drain is about six inches across and made of punched steel; they're a standard fixture on all starships."
The matching key of the drain is the piece of scrap.

Understand "unclog [something] with [something]" as unlocking it with.

Does the player mean unlocking the drain with the piece of scrap: it is very likely.
Does the player mean unlocking the drain with right hand: it is likely.

Check unlocking the drain with something (called the drainsnake):
	if the drainsnake is not the piece of scrap:
		say "Even if you were willing to tear that clog out by hand - the mere thought sends a frisson of disgust up your spine - you doubt you could. You'll need some kind of a hook or tool to unclog the drain." instead;

After unlocking the drain with the piece of scrap:
	move the pool of blood to the drain;
	say "You use the hook-shaped scrap to tug the clog out, splashing more filth up your arms and chest. The pool of blood gurgles as it whirls down the drain.";
	try the player dropping the piece of scrap;

[perhaps fix the action-on-drain issue by putting it into scope when applicable? would probably suit the inform outlook better]
[when the blood is drained out, it's vented directly into space? since it's waste anyway? maybe into water reclamation (taking dropped things with it)?]

A mysterious corpse is here.
"Against the wall, tucked fetal into the corner, lies a corpse wearing a shipsuit. If it weren't for the shipsuit, you'd never know it was a corpse in the first place."
The description is "The body's been mutilated and has probably been in here a couple days, judging from the disgusting pallor. Next to the corpse's hand, '4444' has been scrawled in blood along the wall." 

A lightsource called an emergency lightstrip is here. It is red, infrared, scenery, lit, and switched on.
The description is "A series of cheap lights have been sunk into a chunk of red plastex about three feet long. The matte surface keeps the scarlet light from being harsh. Three of them are spaced across the ceiling."

A door called the medbay door is west of Hallway A and east of the Medical Bay. It is locked and unopenable.
The description is "The door out of the Medical Bay is coated with the same dried blood as everything else in the room. The lights on the control panel glow [color of medbay door panel]."

A panel called the medbay door panel is part of the medbay door. It is red. The description is "The medbay door panel glows [color of medbay door panel]. The door must be [if medbay door is unlocked]un[end if]locked."

Part 3 - Hallway A

Hallway A is a room. "Hallway!" Hallway A is in Deck A.

[Once Deck A is set up, use the neighboring relation to establish the correct adjacency of rooms for the listening logic, repeat for each deck]

The Autodoc abuts the Medical Bay. The Medical Bay abuts Hallway A.

Volume 3 - Action

Book 1 - Before

When play begins:
	set the status line;
	[Introductory text goes here]
	[say "At the time, I considered 'Chief Engineer' aboard the Starlight Dancer one of the highlights of my career. It was the first time anyone from the Europan Engineer's Fellowship had been chosen. To be perfectly technical, it wasn't the EEF's fault that Aurita did what she did. We signed waivers, we knew there was experimental tech aboard, the usual boilerplate for bleeding-edge research vessels. It was what we wanted: big toys in a new sandbox and no supervision.";
	wait for any key;
	say "[br]I guess we got a little big for our britches. If I never see the inside of a spacecan again it'll be too soon.";
	wait for any key;
	say "[br]You know the weirdest part for me was the dreams? A bunch of other vets say the same thing, that cryo does something to your subconscious. Of course the headshrinkers never find real proof of change; that green gel shit they pump into your lungs and into the spacecan 'has been proven to prevent tissue damage in all but extraordinarily high fractions of sublight speed', but that doesn't change your dreams back.";
	wait for any key;
	say "[br]Nothing does, so far as anyone knows. And these other jokers, they had [i]successful[/i] missions, or even just break-even missions. Their dreams are a little weird, otherwise pleasant or at worst harmless.";
	wait for any key;
	say "[br]I'm the only one with a void file, the only one who came back from the Starlight Dancer. My dreams are blackest cold, the chill the sinners lying under Cocytus must feel at night. I can feel the frost reach down my throat, right into the bottom of my lungs where the death rattle must be. The frost never quite melts back out afterward, and right there next to your guts for the rest of your life is a little puddle of ice water.";
	wait for any key;]

Book 2 - During

[any overarching every turn rules should go here]

Part 1 - Dreamtime

Dreamtime is a scene. Dreamtime begins when play begins. Dreamtime ends when the player is carrying the stone.

When Dreamtime ends:
	say "The smell of burning electronics hits your lizard hindbrain like a rivet gun and you awaken almost immediately, limbs flailing against the sides of the coffin. A badly-milled bolt opens a bloody streak on the back of your wrist, and several seconds pass before you realize you can't feel it because you're completely numb.[br]
	...[br]
	The smoke smell drifts by your nose again, a little stronger. You startle and bark your forehead on the plastex window above you. The pain keeps you awake this time.";
	wait for any key;
	move the player to the Autodoc;

Part 2 - Opening Moves

Autodoc Escape is a scene. Autodoc Escape begins when play begins[Dreamtime ends]. Autodoc Escape ends when the Medical Bay is visited. 

There is an injury called the jagged slash. The severity of the jagged slash is 1. The class of the jagged slash is laceration. The site of the jagged slash is the right hand. The description is "A jagged slash across the back of your right hand [if untreated]oozes a slow trickle of blood that refuses to stop[otherwise]is covered by a short length of gauze bandage, wrapped like a drunk prizefighter[end if]."

When Autodoc Escape begins:
	attack with the jagged slash;

Get My Gear Back is a scene. Get My Gear Back begins when Autodoc Escape ends. Get My Gear Back ends when the personal locker is open.

Drain The Blood is a scene. Drain The Blood begins when Autodoc Escape ends. Drain The Blood ends when the pool of blood is in the drain.

Every turn during Drain The Blood:
	if a random chance of 1 in 3 succeeds:
		say "[one of]Syrupy ichor gurgles and splashes partway up your calf as you move through the room.[or]
		You shiver and slap your forearms, trying to keep blood circulating through your hands.[or]
		A coil of stench unwinds into your nostrils: you gag and fight back the dry heaves.[or]
		A foot slips on something slick as you move through the room. You keep your footing, but only just.[then at random]";

Take A Shower is a scene. Take A Shower begins when Autodoc Escape ends. Take A Shower ends when the player is clean.

Exit The Medbay is a scene. Exit The Medbay begins when Autodoc Escape ends. Exit The Medbay ends when Hallway A is visited.

Book 3 - After

[nothing here yet obviously]

Volume 0 - Not For Release

Book 1 - Testing Commands

Understand "WIFI" as testing-wifi.
Testing-wifi is an action applying to nothing.
Report testing-wifi:
	repeat with foo running through the list of broadcasting things:
		say "[foo]: [list of things incorporated by foo] - [location of foo]."

Understand "WIFI [something]" as testing-wifi-target.
Testing-wifi-target is an action applying to one thing.
Report testing-wifi-target:
	if the noun incorporates an access point (called the beacon):
		now the attack vector is the icebreaker against the beacon;
		say "[noun]:[beacon] <- [attack vector].";
	otherwise:
		say "There is no access point attached to the [noun]!" 

Understand "WHEREAMI" as get-location.
Get-location is an action applying to nothing.
Report get-location:
	say "Current location: [location].";

Understand "LUMOS" as current-light-level.
Current-light-level is an action applying to nothing.
Report current-light-level:
	mention the light level;
	say "{{Light-bearing things: [list of lit things enclosed by the location]}}[br]";
	say "{{Player scope: [list of visible things]}}";

Understand "SOUNDCHECK [any thing]" as listen-testing.
Listen-testing is an action applying to one visible thing.
Report listen-testing:
	say "{{[printed name of noun]:[br]";
	say "{{Is it audible? [if the player can hear the noun]yes[otherwise]no[end if]}}[br]";
	say "{{[if noun is clamorous]Clamorous[else if noisy]Noisy[otherwise]Silent[end if]}}[br]";
	say "{{[location of noun]}}[br]";
	say "{{Heard things: [list of things heard by the player]}}[br]";
	say "{{Audible things: [list of audible things]}}[br]";

To mention the light level:
	say "{{The light level in the [location] qualifies for: [if location is bright]bright [end if][if location is dim]dim [end if][if location is dark]dark[end if]}}";
	say line break;

Book 2 - Testing Equipment

[A sunrod is a device carried by the player. "This is the normal description of the sunrod. [if switched on]It glows with a bright light.[otherwise]It is dark." The sunrod has dark-description "[if carried]The sunrod in your hand glows dimly. [otherwise]The sunrod glows faintly." The sunrod is bright and infrared.

Carry out switching on the sunrod:
	now the sunrod is lit;
	say "LIGHTS";

Carry out switching off the sunrod: 
	now the sunrod is unlit;
	say "DARKNESS";]

[A radio is a device. The radio is in the Medical Bay. "This is the init app of the radio. [if switched on]It emits a constant stream of static.[otherwise]It is silent.[end if]". The radio is switched on. The radio is notable. The sound of the radio is "white noise". The sound-description is "[The printed name] emits an unbroken stream of static."
Carry out switching on the radio:
	say "You turn the radio on and static fills the room.";
	now the radio is notable;
	now the sound of the radio is "white noise";

Carry out switching off the radio:
	say "You turn the radio off. Silence clears the room.";
	now the radio is mundane;
	now the sound of the radio is "silence";

An alarm clock is a device in the Autodoc. The alarm clock is switched on. The sound of the alarm clock is "beeping". The sound-description is "The alarm clock beeps incessantly."]

[**********************************]
[n _ _ t THE CODE GRAVEYARD t _nt ]
[

]