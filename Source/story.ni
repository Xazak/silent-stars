"Silent Stars" by Zaq Grow

Use dynamic memory allocation of at least 16384.

Include Basic Screen Effects by Emily Short.
Include Glulx Text Effects by Emily Short.
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

[these are Glulx text styles, invoke them with "say first/second custom style". Only two are allowed]
Table of User Styles (continued)
style name	justification	obliquity	indentation	first-line indentation	boldness	fixed width	relative size	glulx color
special-style-1	right-justified	no-obliquity	0	0	regular-weight	fixed-width-font	0	g-black
special-style-2	right-justified	no-obliquity	0	0	regular-weight	proportional-font	0	g-black

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

To square (echs - a number):
	let wye be echs * echs;
	now echs is wye;

To cube (echs - a number):
	let wye be echs * echs * echs;
	now echs is wye;
	
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

Definition: a direction (called thataway) is viable if the room thataway from the location is a room.
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

[To set the status line:
	now the right hand status line is "[time of day as 24h time]";]

Definition: a person is augmented rather than mundane if she is wearing the persocom.

Rule for constructing the status line while the player is mundane:
	fill status bar with Table of Mundane Status;
	rule succeeds.
	
Table of Mundane Status
left	central	right
" [location]"	"[ambient light of location]"	""
" Status: [health of the player]"	""	""
" "	""	""

Rule for constructing the status line while the player is augmented:
	fill status bar with Table of Augmented Status;
	rule succeeds.

[Table of Augmented Status
left	central	right
" |[top rose]|"	"[location of player]"	"{shadows}"
" |[middle rose]|"	"Status: Healthy"	"[time of day as 24h time]"
" |[bottom rose]|"	">>..."	""]

Table of Augmented Status
left	central	right
" [location]"	"[ambient light of location]"	"[first custom style]|[top rose]|[roman type]"
" Status: [health of the player]"	"[time of day as 24h time]"	"[first custom style]|[middle rose]|[roman type]"
" >>[program output of persocom]"	""	"[first custom style]|[bottom rose]|[roman type]"

To say rose (way - a direction):
	let place be the room way from the location;
	if the place is a room, say "[way abbreviation]"; otherwise say "[way spacing]";

To say (way - a direction) abbreviation:
	choose row with a chosen way of way in the Table of Various Directions;
	say abbrev entry;
	
To say (way - a direction) spacing:
	choose row with a chosen way of way in the Table of Various Directions;
	say spacing entry;

Table of Various Directions
chosen way	abbrev	spacing
northwest	"NW-"	" . "
north	"-N-"	" . "
northeast	"-NE"	" . "
east	"--E"	" . "
west	"W--"	" . "
southeast	"-SE"	" . "
south	"-S-"	" . "
southwest	"SW-"	" . "
inside	"-I-"	" . "
outside	"-O-"	" . "
up	"^U^"	" . "
down	"vDv"	" . "

[Table of Various Directions
chosen way	abbrev	spacing
northwest	"NW-"	"123"
north	"-N-"	"456"
northeast	"-NE"	"789"
east	"--E"	"789"
west	"W--"	"123"
southeast	"-SE"	"789"
south	"-S-"	"456"
southwest	"SW-"	"123"
inside	"-I-"	"456"
outside	"-O-"	"456"
up	"^U^"	"0-="
down	"vDv"	"0-="]
	
To say top rose:
	say "[rose northwest][rose north][rose northeast]|[rose up]".

To say middle rose: 
	if inside is viable and outside is viable:
		say "[rose west]I/O[rose east]|---";
	else if outside is viable:
		say "[rose west][rose outside][rose east]|---";
	otherwise:
		say "[rose west][rose inside][rose east]|---";

To say bottom rose:
	say "[rose southwest][rose south][rose southeast]|[rose down]".

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
	say bold type;
	if the printing the announcement of light activity is going on, say "printing announcement of light" instead;
	if light-description-toggle is false, say "[printed name of the place]" instead;
	if the light level is murky:
		say "[printed name of the place], in the [random dark-noun]" instead;
	if the light level is dim:
		say "[printed name of the place], in dim light" instead;
	if the light level is bright:
		say "[printed name of the place], in the [random light-noun]" instead;
	say "[printed name of the place]" instead;
	say roman type;

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
		-- 2: say "The [color of random lit visible thing] [random light-noun] from [the random lit visible thing] [random light-verb] "; [The shifting light from the glowing blorb illuminates a sprocket.]
	list the contents of the location, as a sentence, listing marked items only;
	say ".";

[Rule for printing a parser error when the latest parser error is the can't see any such thing error:
	say "There isn't a [topic understood] in sight!" instead;]

To say ambient light of (place - a room):
	if the light level is murky:
		say a random dark-noun;
	else if the light level is dim:
		say "dim";
	else if the light level is bright:
		say a random light-noun;

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
[could change "flicker" to "dim-adj" and use it in conjunction with light-noun for dimness levels?]

Chapter 2 - Appliances

[this is only for light sources that can be manipulated! static light-bearing things should be just things]
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

A computer called the persocom is in the backpack. The description is "It's a small personal computer, affectionately called a 'sidebrain' by most engineers, of the sort to be worn on the forearm. These are truly the modern workhorse aboard a spacecan: now that you have one again, you can access all of the ship systems and make changes, once you're connected in." The dark-description is "The [color of persocom] [random light-noun] cast by the persocom throw peculiarly [if switched off]in[end if]distinct shadows across the walls and ceiling."
Understand "sidebrain" as the persocom.
The persocom is wearable, green, and infrared.
A selection device called persocom's touchpad is part of the persocom. 
A laptop battery compartment called persocom's battery port is part of the persocom. A rechargeable battery called the graphene cell is in the battery port. The charge of the graphene cell is 30. 
A PS-plug called the device extension jack is part of the persocom. The type of the extension jack is "device". 
Cnxn-type is a kind of value. The cnxn-types are dormant, wired and wireless. 
The persocom has a cnxn-type called the active pipeline. The active pipeline is dormant.
The persocom has some text called the program output. The program output is usually "--  PERSOCOM INACTIVE  --".
The persocom has some text called the hostname. The hostname is usually "FAWN".

Before examining the persocom:
	if the persocom is switched on, try the player examining the persocom's screen instead.

Carry out switching on the persocom:
	now the persocom is lit;	
	
Carry out switching off the persocom:
	now the persocom is unlit; 

Carry out an actor plugging something (called the hacktool) into something (called the external system) (this is the set-connection-relation rule):
	now the the external system is connected to the hacktool;
	[set the active pipeline;] [this will be a phrase that will take the place of all existing "set the active-cnxn..." statements]
	choose row with a title of "Access Cnxn" in the Table of GUI Options;
	now the display entry is true;
	refresh the GUI;

Report an actor plugging something (called the hacktool) into something (called the external system):
	say "The [hacktool] is now connected to [external system].";
	now the program output of the persocom is "[cnxn-gadget] connected to [hostname] via extension jack.";

Carry out unplugging something (called the hacktool):
	now nothing is connected to the hacktool;
	refresh the GUI;

Report unplugging something (called the hacktool):
	say "The [hacktool] is now disconnected.";
	now the program output of the persocom is "Extension jack disconnected.";

[include device sockets in things to provide cable-only access via persocom]
A device socket is a kind of PS-socket. The type of a device socket is usually "device". 

[represents the extension jack being plugged into something]
Connecting relates one thing to one computer. The verb to connect (he connects, they connect, he connected, it is connected, he is connecting) implies the connecting relation. The verb to be connected to implies the connecting relation.

To decide which thing is the cnxn-gadget:
	if something (called the item) is connected to the persocom, decide on the item.

To decide which thing is the payload:
	if something (called the item) is compiling something (called the gibson), decide on the gibson.

A persocom operations rule (this is the access-connected-program rule):
	if the cnxn-gadget is compiling something (called the gibson):
		say "Accessing [the gibson]...";
		now the program output of the persocom is "Accessing [the payload]...";
		[now the active-cnxn is wired;]
		give focus to the gibson;
	
Chapter 2 - The Software

Section 1 - The OS

Some software has some text called the activation message. The activation message is usually "The [printed name] expands into the main display area."

Understand the command "ps" and "persocom" as "type". [Default synonyms for "type": enter, key, input, select]

[*** THE BIOS ***] 

The persocom runs some software called the bios. The software priority of the bios is 1. The description of the bios is "MITARI-HYLAND FIRMOS v309.72.16a4(3030-01-28)[br]Hardware Test OK, Symbory Abstracts Initialized...". The bios can be processing or resting. The bios is resting.

An input handling rule for the bios(this is the ignore all input while booting rule):
	if the bios is processing:
		say "The persocom beeps; you cannot interrupt it while it's booting up.";
		rule fails;
	rule succeeds.

Table of Boot Messages
index	message
1	"Cy-neur Interlace Self-Test: VALID"
2	"Input Holostracts: INITIALIZED"
3	"PersOSys Operation Layer: STARTING"

Persocom Boot Process is a scene. Persocom Boot Process begins when the persocom is switched on. Persocom Boot Process ends when the bios is resting.

When Persocom Boot Process begins:
	give focus to the bios, quietly;
	now the bios is processing;
	now the description of the bios is the message corresponding to an index of 1 in the Table of Boot Messages;
	now the program output of the persocom is the description of the bios;

Every turn during Persocom Boot Process:
	if the time since Persocom Boot Process began is:
	-- 1 minute:
		now the description of the bios is the message corresponding to an index of 2 in the Table of Boot Messages; 
	-- 2 minutes:
		now the description of the bios is the message corresponding to an index of 3 in the Table of Boot Messages;
	-- 3 minutes:
		now the bios is resting;
		give focus to the operating system;
	now the program output of the persocom is the description of the bios;

When Persocom Boot Process ends:
	now the program output of the persocom is "Awaiting input.";
	now the description of the bios is "MITARI-HYLAND FIRMOS v309.72.16a4(3030-01-28)".

[*** THE OS ***] 

The persocom runs a multiple-choice program called the operating system. The software priority of the operating system is 2. The options table of the operating system is the Table of GUI Options.
The description of the operating system is "*************************[br]--PersOSys v17revA//1.2--[br]
Issue the help command - 'persocom help' - for basic help at any time[if persocom is connected to something].[br][cnxn-gadget] is connected via extension jack[end if][if persocom is linked to something].[br][link-gadget] is connected via wireless link[end if].[br][br][options-list of the operating system]".

The activation message of the operating system is "The persocom emits a quiet chime, and the main screen of the OS appears."

To say options-list of the operating system:
	say "The following commands are available on this terminal:[paragraph break]"; 
	repeat through the options table of the operating system:
		if display entry is true:
			say "[title entry][br]";
	say "[run paragraph on]".

Table of GUI Options
topic	title	effect	display
"wifi"	"WiFi"	init-wifi-assoc rule	true
"disconnect"	"Disconnect"	disconnect-wifi-assoc rule	false
"access device"	"Access Device"	access-active-gadget rule	false
"settings"	"Settings"	change-settings rule	true
"help"	"Help"	get-persocom-help rule	true

The persocom operations rules are a rulebook.
The attack vector is a rule that varies.

To give focus to (warez - some software), quietly:
	repeat with bar running through software run by the persocom:
		now the software priority of bar is 5;
	now the software priority of the warez is 1;
	if not quietly:
		say the activation message of the warez;
		try examining the warez;

To refresh the GUI:
	if something (called foo) is connected to the persocom:
		say "Looking for available controls via extension jack...";
		if foo incorporates some software (called bar):
			now the persocom is running bar;
	if something (called qaz) is linked to the persocom:
		say "Looking for available controls via wireless...";
		if qaz incorporates some software (called unf):
			now the persocom is running unf;
	repeat through the options table of the operating system:
		if title entry is:
		-- "WiFi":
			if something is linked to the persocom, now display entry is false; [always show unless something is linked]
		-- "Disconnect":
			if nothing is linked to the persocom, now display entry is false; [always hide unless something is linked]
		-- "Access Device":
			if something is connected to the persocom, now display entry is true;
			if something is linked to the persocom, now display entry is true;
			if nothing is connected to the persocom and nothing is linked to the persocom, now the display entry is false;
		-- "Settings":
			now display entry is true; [always show]
		-- "Help":
			now display entry is true; [always show]

A persocom operations rule (this is the init-wifi-assoc rule):
	if the cnxn-gadget is not nothing, say "Access the extension jack using the Extension command.";
	blank out the whole of the Table of Available Connections;
	repeat with target running through broadcasting things:
		choose a blank row in the Table of Available Connections;
		let the gateway be the node providing access to the target;
		now the title entry is the printed name of the gateway;
		now the effect entry is the icebreaker against the gateway;
	give focus to the wifi-connector; [see Section 2]
		
This is the disconnect-wifi-assoc rule: do nothing.
This is the access-active-gadget rule: do nothing.
This is the change-settings rule: do nothing.

A persocom operations rule (this is the get-persocom-help rule):
	say "To issue a command to the persocom, type 'PERSOCOM <command>', minus the quotes. You may also use 'PS', 'ENTER', 'TYPE', 'KEY', 'SELECT', or 'INPUT' instead of 'PERSOCOM'. The extension jack can be PLUGGED into any compatible socket.";
	refresh the GUI;
	say options-list of the operating system;

[superceded by init-wifi-assoc]
[A persocom operations rule (this is the list-open-cnxns rule):
	say "Ext Cable: [if there is nothing connected to the persocom]--no connection--[otherwise]a thing is connected[end if][br]";
	repeat with target running through broadcasting things:
		if the target incorporates an access point (called the gateway):
			say "Found: [gateway] ([target])...";
			now the attack vector is the icebreaker against the gateway;
			say "Attack vector: [attack vector]...";]
					
Section 2 - Wifi Connectivity

The persocom runs an enumerated multiple-choice program called the wifi-connector. The options table of the wifi-connector is the Table of Available Connections.

Table of Available Connections
index (a number)	title (text)	effect (a rule)
with 20 blank rows

[include access points as parts of things to give them wireless connectivity]
An access point is a kind of device. An access point is scenery and switched on. 
To decide which access point is the node providing access to (gadget - a thing):
	say "Looking for access point...";
	if the gadget incorporates a live access point (called the gateway):
		say "Success: [the gateway].";
		decide on the gateway;

[the rule being executed by an access point is what provides the framework lifting to connect the persocom wirelessly with the target device; every access point must be executing its own unique rule]
Executing relates a thing to a rule. The verb to execute (he executes, they execute, he executed, it is executed, he is executing) implies the executing relation.

To decide which rule is the icebreaker against (gateway - an access point):
	say "Looking for attack vectors against [the gateway]...";
	if the gateway relates to a rule by the executing relation:
		decide on the rule to which the gateway relates by the executing relation;

Definition: an access point is live rather than dead:
	if it relates to a rule by the executing relation:
		if it is switched on:
			yes;
		no;
	no;

Definition: a thing is broadcasting:
	if it incorporates a live access point:
		if it is immediate:
			yes;
		no;
	no;

[intended to represent a wireless data cnxn between the 'com and a target access point]
Linking relates one thing to one computer. The verb to link (he links, they link, he linked, it is linked, he is linking) implies the linking relation. The verb to be linked to implies the linking relation.

Associating with something is an activity.
Rule for associating with something (called the target):
	now the target is linked to the persocom;
	choose row with a title of "Access Link" in the Table of GUI Options;
	now the display entry is true;
	choose row with a title of "Disconnect" in the Table of GUI Options;	
	now the display entry is true;
	refresh the GUI;
	say "Wireless link established with [target].";

To decide which thing is the link-gadget:
	if something (called the item) is linked to the persocom, decide on the item.

A persocom operations rule (this is the access-linked-program rule):
	if the link-gadget is compiling something (called the gibson):
		say "Accessing [the gibson]...";
		[now the active-cnxn is wireless;]
		give focus to the gibson;

A persocom operations rule (this is the disconnect-wireless-link rule):
	say "Disconnecting wireless link...";
	now the persocom is linked to nothing;
	refresh the GUI;

Section 3 - Remote Computer Control

Compiling relates one thing to one software. The verb to compile (he compiles, they compile, he compiled, it is compiled, he is compiling) implies the compiling relation.

To decide which thing is the hacked-luser:
	[if the active-cnxn is wireless, decide on the link-gadget;]
	decide on the cnxn-gadget;

[Definition: a software is binary if the compiler of it is not the persocom.]

[move this stuff down later]
Incorporated by the medbay door is a device socket. An access point called medbay-door-west is part of the medbay door. Medbay-door-west is executing the medbay-door-hack rule.

This is the medbay-door-hack rule:
	carry out the associating with activity with the medbay door;
	refresh the GUI;
	give focus to the operating system;

A multiple-choice program called the medbay-door-hack program is part of the medbay door. The medbay-door-hack program is compiled by the medbay door.

The options table of the medbay-door-hack program is the Table of DoorHack Options.

Table of DoorHack Options
topic	title	effect
"open"	"OPEN"	open-door rule
"close"	"CLOSE"	close-door rule
"exit"	"EXIT"	exit-program rule

This is the open-door rule:
	now the hacked-luser is open;
	say "The [hacked-luser] slides open reluctantly.";
	
This is the close-door rule:
	now the hacked-luser is closed;
	say "The [hacked-luser] slides closed.";
	
This is the exit-program rule:
	give focus to the operating system;

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

The player has a number called the health index. [used to track the current total severity of all wounds]

To calculate the player's health index:
	let diagnostic be the list of injured limbs;
	let status be a list of numbers;
	if the diagnostic is empty:
		now the health index of the player is 0;
	otherwise:
		repeat with foo running through the diagnostic:
			add the injury-level of foo to status;
		sort status in reverse order;
		let criticality be 0;
		repeat with bar running through status:
			if bar is 6:
				let criticality be 75; [might be worth making a subcondition?]
			otherwise:
				square bar;
				let criticality be criticality plus bar;
		now the health index of the player is criticality;

To say health of the player:
	calculate the player's health index;
	let h-index be the health index of the player;
	if the h-index is greater than zero and the h-index is less than 10, now the h-index is 10;
	let foo be the remainder after dividing the h-index by 10;
	if foo is greater than zero, now the h-index is the h-index minus foo;
	now the h-index is the h-index divided by 10;
	say the status corresponding to an index of the h-index in the Table of Triage Status;
	
Table of Triage Status
index	status
0	"healthy"
1	"minor"
2	"moderate"
3	"serious"
4	"severe"
5	"critical"
6	"maximal"
7	"dead"

[carrying capacity rules are built into each appropriate action and issues a library message, will need to override the msg in order to change it]
[The new can't carry too many things rule replaces the can't exceed carrying capacity rule.
This is the new can't carry too many things rule:
	if the number of things carried by the actor is at least the carrying capacity of the actor:
		if the right hand is injured or the left hand is injured:
			say "Your {{right hand}} is {{broken}}; you'll need to patch it up before you can use it effectively." instead;
		otherwise:
			say "You only have two hands! You'll have to drop some of the things you're carrying to do that." instead;]

A limb is a kind of thing. Some limbs part of the player are defined by the Table of Body Parts.
A limb has a number called the injury-level. The injury-level is usually 0.

Table of Body Parts
limb	description
head	"OKEY"
neck	"OKEY"
face	"OKEY"
chest	"OKEY"
thorax	"OKEY"
abdomen	"OKEY"
pelvis	"OKEY"
left arm	"OKEY"
left hand	"It's your left hand. [if the light level is murky]You flex it once or twice to make sure it's still there[otherwise]Missing fingertip on middle finger (bar fight), blank pinky fingerprint (close call with industrial acid), inoculation and transit scars on the back (expensive counterfeits)[end if]."
right arm	"OKEY"
right hand	"It's your right hand. [if right hand is healthy]Nothing to see here[else]The only interesting things about it are the scars it's picked up[end if]."
left leg	"OKEY"
left foot	"OKEY"
right leg	"OKEY"
right foot	"OKEY"

After examining a limb (called the appendix)(this is the mention injuries with limbs rule):
	if the appendix is harmed by an injury (called the psychoknife):
		try examining the psychoknife;

Chapter 2 - Injuries and Attacking the Player

A modality is a kind of value. The modalities are laceration, contusion, puncture, heat-burn, frost-burn, rupture, contusion, acid-burn, alkali-burn, steam-burn, poison, radiation, and fracture.

A remedy is a kind of thing. The description is usually "A green box with a white + on the front." A remedy has a list of limbs called the applications. The applications are usually {right hand, left hand}. A remedy has a number called the usefulness. The usefulness is usually 1. A remedy has a list of modalities called the factors. The factors are usually {laceration, contusion, puncture, rupture}.

An injury is a kind of thing. The description of an injury is usually "You haz a sad :( ". An injury has a number called the severity. The severity is usually 1. [scale is 0 - harmless to 6 - maximal (i.e. impossible to treat)]

An injury has a limb called the site.

An injury has a modality called the class.

Definition: an injury is active rather than inactive if it is harming something;
Definition: an injury is treated rather than untreated if a remedy is curing the injury.

Curing relates one remedy to one injury. The verb to cure (he cures, they cure, he cured, it is cured, he is curing) implies the curing relation. The verb to be treated by implies the reversed curing relation.

Harming relates various injuries to one limb. The verb to harm (he harms, they harm, he harmed, it is harmed, he is harming) implies the harming relation.

Definition: a limb is injured rather than healthy if it is harmed by an untreated injury.
Definition: a person is injured rather than healthy if she is incorporating an injured limb.

To attack with (psychoknife - an injury):
	let the strikezone be the site of the psychoknife; [the attacker picks a target]
	now the psychoknife is part of the strikezone; [the attacker is attached to the target]
	now the psychoknife is harming the strikezone; [the injury relation is created]
	now the psychoknife is seen;
	now the psychoknife is familiar;
	increment the wound total of the player; [healed or not, it's going to leave a scar]
	increase the injury-level of the strikezone by the severity of the psychoknife; [update the limb's condition]
	calculate the player's health index; [update the player's physical condition]
	[wound-specific effects go here, add a new case for each unique wound]
	if the psychoknife is:
		-- the jagged slash:
			decrement the carrying capacity of the player;

After examining an injury (called the psychoknife)(this is the examine bandages rule):
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

Part 3 - Player Details

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

Part 4 - The Localized Matter Rehabilitator

A robot is a kind of person. A robot called the lemur is in the Medical Bay. The printed name of the lemur is "localized matter rehabilitator". Understand "LMR" as the lemur. The description is "The localized matter rehabilitator is dinged up and battle-scarred; that is, what you can see when those godawful floodlights aren't pointed your way."

[Every turn when the player can see the lemur:
	say "The [printed name of lemur] [one of]scurries over to a bit of debris, chittering and scraping[or]emits a near-supersonic [i]chirrup[/i] and cocks its head to one side, holding very still[or]races around in a circle, its floodlit-eyes strobing across the room[as decreasingly likely outcomes]."]

The lemur can be wandering, inquiring, or cleaning. The lemur is wandering.
The lemur has a list of rooms called the cleaned places. The lemur has a room called the destination. The lemur has a room called the next step. The destination of the lemur is Astrogation.

Every turn when the lemur is wandering:
	if a random chance of 1 in 3 succeeds:
		if the player can see the lemur, say "The [lemur] freezes in place and twitches an audio sensor for a few moments."; [it bugs out every so often instead of moving on]
	otherwise:
		say "Lemur advancing to [destination of the lemur]."; [NFR]
		if the location of the lemur is the destination of the lemur:
			say "Lemur choosing new location."; [NFR]
			choose a new maintenance zone;
		otherwise:
			try the lemur advancing;

To choose a new maintenance zone:
	let foo be the list of rooms regionally in the map region of the location of the lemur;
	remove the cleaned places from foo;
	let bar be a random number between 1 and the number of entries in foo;
	let target be entry bar of foo;
	now the destination of the lemur is target;
	say "The [lemur] is headed for [destination of the lemur]." [NFR]
	
Advancing is an action applying to nothing. [the lemur decides which direction to head and then takes it]

Carry out the lemur advancing:
	let the right direction be the best route from the location of the lemur to the destination of the lemur, using even locked doors;
	now the next step of the lemur is the room the right direction from the location of the lemur;
	say "The [lemur] moves [right direction] towards the [next step of the lemur]."; [NFR]
	try the lemur going the right direction;
	
	
Carry out advancing:
	say "Maybe not this time. --Ghetvark";

Report the lemur advancing:
	
	

Unsuccessful attempt by the lemur going:
	if the reason the action failed is the check someone else keylessly unlocking rule:
		if the noun is a direction, let the current direction be the noun;
		let the barrier be the door the current direction from the location of the lemur;
		say "The [lemur] emits a short trill; when [the barrier] remains shut, the [lemur] lets out a frustrated warble and starts wandering in circles.";
	otherwise:
		say "The [lemur] walks in circles, all of its sensor stalks twitching."; 

Report the lemur trying opening a door (called the barrier):
	if the barrier is open, say "The lemur emits a short trill; [the barrier] slides open in response.";
	otherwise say "The lemur emits a short trill; when [the barrier] remains shut, the lemur lets out a frustrated warble and starts wandering in circles."
	
Persuasion rule for asking people to try going: persuasion succeeds.

[First carry out going rule: now the former location is the location.
Advancing is an action applying to one visible thing (called the target).

Check someone advancing:
	if the actor is the player, say "That doesn't really work yet. --Ghetvark" instead;

Carry out someone advancing:
	say wander-dest; [NFR]
	now the wander-dest is the next target for maintenance;
	let way be the best route from the location to the wander-dest, using doors;
	say "Heading [way].";
	if way is a direction, try the lemur going way;

To decide which room is the next target for maintenance:
	let sector be the map region of the location of the lemur;
	let zones be the list of rooms regionally in the map region of the location of the lemur;
	remove the cleaned places from zones;
	let foo be a random number from 1 to the number of entries in zones;
	let target be entry foo of zones;
	say "New wander-dest: [target].";[NFR]
	decide on target;
		 
Report advancing:
	say "[The actor] hurries towards the [wander-dest].";

To advance the lemur:
	if the location of the lemur is the wander-dest:
		if the wander-dest is listed in the cleaned zones:
			try the lemur going to the nearest hallway;

To decide which room is the nearest hallway:
	if the lemur is in Deck A, decide on Hallway A;
	else if the lemur is in Deck B, decide on Hallway B; 
	else if the lemur is in Deck C, decide on Hallway C;
	else if the lemur is in Deck D, decide on Hallway D;]
	
Volume 2 - The Starlight Dancer

[Nationalism relates a room (called the zone) to a region (called the sector) when the zone is in the sector. The verb to be included in implies the nationalism relation.]

The player is in the autodoc.[move the player back to the rocky shore before releasing]

Deck A is a region. The autodoc is in Deck A. The Medical Bay is in Deck A. Hallway A is in Deck A.
South of Hallway A is Astrogation. 

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

Part 1 - The Autodoc

The Autodoc is a room. "You're lying down inside a metal coffin that isn't much larger than you. It (you?) reeks of medical disinfectants; the fuzziness in your head feels like it's keeping away a headache from all the fumes."
The printed name of the autodoc is "Antiseptic Coffin". Understand "coffin" as the Autodoc. The dark-description of the Autodoc is "It's cold and damp and dark in here."
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
			say "ERROR: Autodoc door is locked." instead;

Carry out pushing the exit button:
	now the autodoc door is open;
	now the exit button is steady;

Report pushing the exit button:
	say "A beat passes, and then the hatch seal on the [printed name] disengages with a whoosh of pressurized air. The stench of old blood quickly replaces the tang of disinfectants." instead;

A door called the autodoc door is outside of the Autodoc and inside of the Medical Bay. "[if player is in Autodoc]A small plastex window the size of a playing card is directly in front of you, and a control panel a few inches below that.[else]The dark hulk of the autodoc crouches in one corner." 
[The description of the autodoc door is "[if player is in Autodoc]Aside from the window and control panel, the autodoc - door included - is made of the same stuff as the ship hull. One of the controls should unseal the door though.[else]The low bulky machine takes up an entire corner of the room. This machine alone cost as much as a troop transport fresh out the factory, and the only people who get their hands on them these days the spacers, the ones who might have no other choice." ]
To say the description of the autodoc door:
	if the player is in the autodoc:
		say "Aside from the window and control panel, the autodoc - door included - is made of the same stuff as the ship hull. [if autodoc door is open]The left edge of the hatch is cracked open an inch or three.[else]One of the controls should unseal the door though.";
	otherwise:
		say "The low bulky machine takes up an entire corner of the room. This machine alone cost as much as a troop transport fresh out the factory, and the only people who get their hands on them these days the spacers, the ones who might have no other choice. [if autodoc door is open]Wan light from the autodoc control panel leaks out from the open hatch.[else]The only light from the sealed hatch is from the little window on top.";
	
The autodoc door is locked.

Before opening the autodoc door:
	say "You reach up and push the exit button.[command clarification break]"; 
	try pushing the exit button instead;

Report closing the autodoc door:
	say "There is a hiss of air as the hatch seals pressurize." instead;

Report going through the autodoc door to the Medical Bay during Autodoc Escape:
	say "You sit up, lift open the hatch with one shoulder, and roll over the lip of the autodoc. The fall to the ground is thankfully short.[br][br]You make a [i]splash[/i] instead of a [i]thud[/i] when you land. As you raise your addled head to look, you choke down the urge to vomit as you realize the syrupy black gunk coating your arms up to the bicep is half-dried blood. The puddle is almost ankle-deep and wall-to-wall.";

The hatch window is part of the autodoc door. The description of the hatch window is "The frosted plastex shows only flickers of dim light on the ceiling above." 

Instead of searching the hatch window: try examining the hatch window instead.

Part 2 - The Medical Bay

The Medical Bay is a room.
"The Medical Bay is a wreck: most of the cabinets have been torn off their hinges and twisted medical debris litters the room[if Drain the Blood has ended]. The grey tile floor is littered with broken glass, bits of medical paraphernalia, and dried blood[end if]."

The floor crap is scenery in the Medical Bay. The description is "Anything of value was removed from this room when it was ransacked by whatever tore the room apart. Aside from the autodoc and your gear locker, that is."

Understand "floor/glass/paraphernalia/dried blood" as the floor crap. 

A container called a chemical shower is here. The shower is [transparent, ]openable, enterable, and closed.
"A green vinyl curtain [if open]hangs to one side of[else]is drawn across[end if] the entrance to a small chemical shower."
The description is "The humble chemical shower is equipped with a variety of {{anti-chemical chemicals}} and its own fluid reclamation system. [br][br]A green vinyl curtain[if the shower is open] hangs to one side.[else] is drawn across the entrance."
The inside-description is "The extruded fiberglass walls are only just wide enough apart to let you in. A spigot overhead must be where the {{soapy water}} comes out; a simple hole underfoot must be where it goes. [br][br]A green vinyl curtain[if the shower is open] hangs to one side.[else] is drawn across the entrance."
[the room description should appear slightly shrouded when the curtain is closed]

Does the player mean entering the shower: it is likely.

Check taking the shower:
	try pushing the shower cycle button instead;

Report opening the shower: say "The plastic rustles as you push the curtain aside." instead;

Report closing the shower: say "You tug the curtain across the entrance." instead; 

A vinyl curtain is part of the chemical shower. The curtain is green and scenery.
The description is "A sheet of emerald plastic hangs from a curtain rod."

Does the player mean taking the vinyl curtain: it is likely.

Check opening the curtain: try opening the shower instead.

Check closing the curtain: try closing the shower instead.

Check taking the vinyl curtain: say "What are you going to do with that much plastic sheeting and no[if clothed]t enough[end if] pockets? Best to leave it where it is for now." instead.

A curtain rod is part of the vinyl curtain. The rod is grey and scenery.
The description is "A metal rod has been bolted into either side of the chemical shower, where it continues to hold the shower curtain in place."

Does the player mean opening the curtain rod: it is very unlikely.
Does the player mean closing the curtain rod: it is very unlikely.

Check taking the curtain rod: say "It's bolted to either side of the chemical shower. Need to find a wrench." instead.

A chemical lamp is inside the shower. The lamp is yellow, lit, and scenery.
The description is "A simple chemical light is glued to the roof of the shower. They say these are supposed to be good for a couple centuries; you suppose this one has at least another century and nine-tenths to go before it burns out."

Instead of switching off the chemical lamp: say "It can't be switched off."

A showerhead is inside the shower. The showerhead is scenery. The description is "A metal shower head. It hangs directly above, and appears to thread onto a pipe."

A simple hole is inside the shower. The simple hole is scenery. The description is "This is where the shower drains into, a one-inch hole cut into the plastic underfoot."
Does the player mean doing something with the simple hole: it is unlikely.

A pushbutton called the shower cycle button is inside the chemical shower. The printed name is "cycle button". "The only controls in here are a fist-sized button labeled 'PUSH' in big block letters." The description is "A single black rubberized button, large enough to hit blindly in a panic if need be.[first time][br]A lightning-flash of memory: eyes burning pain eating around eye sockets like the devil's fingers scooping the -[br]You stifle that thought even as remembering it triggers a quick squirt of adrenaline like a cold hand trailing down your spine.[only]"

Check pushing the shower cycle button:
	if Drain The Blood has not ended:
		say "You can practically feel that shower already, but the slick wall-to-wall scarlet on the floor stays your hand. No matter how clean you get, stepping back into that murk is going to make you just as dirty as before." instead;
	if the player is not inside the chemical shower:
		say "Shouldn't waste water by running the shower without anyone inside." instead;	

Before pushing the shower cycle button:
	if the chemical shower is open:
		try closing the chemical shower;

Carry out pushing the shower cycle button:
	now the player is clean;

Report pushing the shower cycle button:
	say "You slap the cycle activation button. The warm water on your corpse-chilled flesh stings at first, but a moment or two later and it's the best thing you can remember feeling in a long time.[br]The water stops, and you realize you haven't actually scrubbed down. You hit the cycle button again (tamping down a brief pang of guilt - 'Water is liquid gold aboard a starship!') and use the little plastic scrubber to get all the nooks and crannies.[br][i]Much[/i], much better." instead;

A container called some lockers is here. The lockers are scenery, open and not openable.
The description is "The crew lockers are busted to hell, though they're usually empty anyway. They're only meant as temporary storage, until the assigned crewman gets back on their feet."

Instead of inserting something into some lockers: say "None of the [if personal locker is familiar]other [end if]lockers look like they will support weight."

Does the player mean doing something with some lockers: it is unlikely.

A container called the personal locker is here. The personal locker is locked and fixed in place. The color of the personal locker is red.
"A bank of gear lockers along one wall have received a similar treatment as the cabinets. [if personal locker is familiar]Your [else]One [end if]gear locker is still intact; the controls glow [color of combo lock]."
The description is "The nameplate reads 'E. Lumien'. It's [if unlocked]un[end if]locked."

After examining the personal locker for the first time:
	now the initial appearance of the personal locker is "Your gear locker sits at the end of the row, controls glowing [color of combo lock]."

Understand "far/my gear locker" as the personal locker.

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

Understand "crew shipsuit" as the jumpsuit.

A remedy called a bandage is inside the personal locker. "A sterile adhesive bandage, still in its wrapper, lies on the shelf of the locker." The description is "An adhesive bandage. It's basically an extra-big bandaid; the long adhesive strips let you get it on practically anywhere you need it." 
The usefulness of the bandage is 1. The applications of the bandage are {right hand}. The factors of the bandage are {laceration}.

A player's holdall called the backpack is inside the personal locker. "A small and versatile-looking backpack rests in the back of the locker." The description is "It's a small gear bag, of the sort commonly used as technical carryalls aboard most starships. This one is made of industrial nylon, appears to be waterproof, and has multiple straps and pockets and such to accomodate a wide variety of tools and equipment."
The backpack is wearable. The bulk capacity is 50. The carrying capacity is 100.
Understand "gear bag" as the backpack. Understand "back pack" as the backpack.

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

After examining the pile of junk:
	if the drain is familiar and the pile of junk is occupied:
		try the player taking the piece of scrap;
		
A container called a pool of blood is here. The blood is fixed in place and closed.
"The floor is ankle-deep in blood. It gurgles and sloshes as you move about. [if the drain is seen][initial appearance of the drain][end if]".
The description is "The emergency lighting makes it look near-black, with a monochrome-red sheen almost like machine oil. You'd prefer the smell of machine oil over this organic reek, come to that."

After examining the pool of blood while the drain is unseen:
	say "You can't see a drain through the murky surface, but if you had to guess it'd be right about in the middle of the floor. You'll have to search for it a bit though.";

Before searching the pool of blood: now the pool of blood is open.

Carry out searching the pool of blood: now the drain is seen.

Report searching the pool of blood:
	say "You take a breath and hold it before plunging both hands into the murk and feeling your way across the floor. The drain is (fortunately) right where you expected. However, your hand grazes something obscenely organic clogging the drainspout, slick and coarse and squelchy-wet. The sensation makes you recoil in disgust; you slip an inch or two on the tile but recover before falling in." instead;

Before dropping something (called the potato) while Drain The Blood has not ended:
	if the personal locker is open:
		try silently inserting the potato into the personal locker;
		say "You carefully store the [potato] in the open locker." instead;
	otherwise:
		if the personal locker is familiar:
			say "If you drop anything on the floor in here it's going to get really disgusting really fast. You should keep your things in a locker until you clean things up in here." instead;
		otherwise:
			say "Bad idea to drop that in here until you get the blood cleaned up." instead; 
	
[Instead of searching the blood:
	move the drain to the Medical Bay;
	now the drain is familiar;
	say "You take a breath and hold it before plunging both hands into the murk and feeling your way across the floor. The drain is (fortunately) right where you expected. However, your hand grazes something obscenely organic clogging the drainspout, slick and coarse and squelchy-wet. The sensation makes you recoil in disgust; you slip an inch or two on the tile but recover before falling in.";]
	
A closed locked container called a drain is inside the pool of blood. The drain is fixed in place.
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
	move the drain to the Medical Bay;
	move the pool of blood to the drain;
	say "You use the hook-shaped scrap to tug the clog out, splashing more filth up your arms and chest. The pool of blood gurgles as it whirls down the drain.";
	say "You toss the foully-choked piece of junk aside. Won't need that again.";
	remove the piece of scrap from play;

[perhaps fix the action-on-drain issue by putting it into scope when applicable? would probably suit the inform outlook better]
[when the blood is drained out, it's vented directly into space? since it's waste anyway? maybe into water reclamation (taking dropped things with it)?]

A mysterious corpse is here. The corpse is fixed in place.
"Against the wall, tucked fetal into the corner, lies a corpse wearing a shipsuit. If it weren't for the shipsuit, you'd never know it was a corpse in the first place."
The description is "The body's been mutilated and has probably been in here a couple days, judging from the disgusting pallor. Next to the corpse's hand, '4444' has been scrawled in blood along the wall." 

Instead of doing anything except examining with the corpse:
	say "Just being ankle deep in this disgusting gore [if Drain the Blood has ended]was [else]is [end if]enough; there's no way you're going to add to your troubles. Best leave the dead alone." instead;

An emergency lightstrip is here. It is red, lit, and scenery.
The description is "A series of cheap lights have been sunk into a chunk of red plastex about three feet long. The matte surface keeps the scarlet light from being harsh. Three of them are spaced across the ceiling."

A door called the medbay door is west of Hallway A and east of the Medical Bay. It is locked and unopenable.
The description is "The door out of the Medical Bay is coated with the same dried blood as everything else in the room. The lights on the control panel glow [color of medbay door panel]."

A panel called the medbay door panel is part of the medbay door. It is red. The description is "The medbay door panel glows [color of medbay door panel]. The door must be [if medbay door is unlocked]un[end if]locked."

Part 3 - Hallway A

Hallway A is a room. "Hallway!"

[Once Deck A is set up, use the neighboring relation to establish the correct adjacency of rooms for the listening logic, repeat for each deck]

The Autodoc abuts the Medical Bay. The Medical Bay abuts Hallway A.

Volume 3 - Action

Book 1 - Before

When play begins:
      change left hand status line to ""; change right hand status line to "";
	[[Introductory text goes here]
	say "At the time, I considered 'Chief Engineer' aboard the Starlight Dancer one of the highlights of my career. It was the first time anyone from the Europan Engineer's Fellowship had been chosen. To be perfectly technical, it wasn't the EEF's fault that Aurita did what she did. We signed waivers, we knew there was experimental tech aboard, the usual boilerplate for bleeding-edge research vessels. It was what we wanted: big toys in a new sandbox and no supervision.";
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

Get My Gear Back is a scene. Get My Gear Back begins when Autodoc Escape ends. Get My Gear Back ends when the player is wearing a jumpsuit.

Drain The Blood is a scene. Drain The Blood begins when Autodoc Escape ends. Drain The Blood ends when the pool of blood is in the drain.

Every turn during Drain The Blood (this is the disgusting ichor rule):
	if the location is the Medical Bay:
		if a random chance of 1 in 4 succeeds:
			say "[one of]Syrupy ichor gurgles and splashes partway up your calf as you move through the room.[or]
			You shiver and slap your forearms, trying to keep blood circulating through your hands.[or]
			A coil of stench unwinds into your nostrils: you gag and fight back the dry heaves.[or]
			A foot slips on something slick as you move through the room. You keep your footing, but only just.[then at random]";

Take A Shower is a scene. Take A Shower begins when Autodoc Escape ends. Take A Shower ends when the player is clean.

Fix Jagged Slash is a scene. Fix Jagged Slash begins when the jagged slash is part of the player. Fix Jagged Slash ends when the jagged slash is treated.

Exit The Medbay is a scene. Exit The Medbay begins when Autodoc Escape ends. Exit The Medbay ends when Hallway A is visited.

When Exit The Medbay ends:
	end the story finally saying "Here's the end of what I have so far!";

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
	consider the illumination rule;

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
[	try switching off the persocom;
	blank out the whole of the Table of GUI Options;
	choose a blank row in the Table of GUI Options;
	now the topic entry is "view devices";
	now the title entry is "View Available Devices";
	now the effect entry is the list-open-cnxns rule;
	choose a blank row in the Table of GUI Options;
	now the topic entry is "link";
	now the title entry is "Link to Device";
	now the effect entry is the init-device-cnxn rule;
	if something (called foo) is connected to the persocom:
		say "Looking for available controls via extension jack...";
		if foo incorporates some software (called the banana):
			say "Found: [banana][br]";
			now the persocom is running the banana;
			choose a blank row in the Table of GUI Options;
			now the topic entry is "connected device";
			now the title entry is the printed name of the banana;
			say the title entry;
			now the effect entry is the cnxn-handshake rule;
			say the effect entry;
[	if something is linked to the persocom:
		activate the linked payload;]
	try switching on the persocom;]

]