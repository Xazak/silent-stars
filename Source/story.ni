"Silent Stars" by Zaq Grow

Use dynamic memory allocation of at least 16384.

Include Bulk Limiter by Eric Eve.
Include Shipboard Directions by Mikael Segercrantz.
Include Epistemology by Eric Eve.

[Ship is located in orbit around a star, orbit or star are dying and death is imminent
Escape via escape pod requires putting ship into spin to prevent shooting pod directly into the sun

The heavy emphasis on lighting conditions means that the player should not have a source of /bright/, constant light. The source itself should be technically infinite; that is, the player should be able to get more, but they should run out of their bright light source on a regular basis.

TODO:
--Moving from one dark room to another doesn't seem to update the "visited" status of the moved-to room until 1) the lights come up and 2) the player performs a look
--Message change: "It seems to be locked." when attempting to open a locked door
--Message change: "It is now pitch dark in here!" when a room moves from lit to dark
--Message change: "It is pitch dark, and you can't see a thing." when examining something in the dark(?)
--Need to write some rules handling light that is /too bright/ to see anything else in the room and probably some attendant blindness rules
--Come up with a better verb for "equilibrioception" and add it as a sense like smell
--The player should be able to use the RECALL (aka REMEMBER) command to remember where a given prop is located in the ship; if the player tries to recall something that has been destroyed or lost, that should be made clear also
--Currently, cannot refer to tenebrous objects by their tenebrous name ("shape", "thing", etc)
	--Cannot refer to the tenebrous thing revealed by a luminous thing either
--Dim item description could use lots more variation
--Look into grouping tenebrous objects together in dim rooms
	--Refer to Writing 17.13 for info on grouping objects together, should help solve issues w/ similar sized things listed separately
--Need to implement postures, see ex381: might be too heavyweight for what I want to do?
--Not sure how to get rid of the "On the (supporter)..." part of the message created when examining a supporter
--Shipboard directions can be assigned compass directions easily ("Understand "fore" as north." &c) but the map does not correctly draw these relationships. The easy way out would be to use compass directions long enough to get the game done and the map exported, and then search-replace all of the compass directions into shipboard ones while leaving the shipboard-compass direction assignment intact. I'd rather use the shipboard dirs from the start though.
--Refer to ex178 for random variations into text

Needed objects:
Doortypes: hatches, blast doors
Objects: bandage, styptic powder? antiseptic?	
]

Volume 1 - Setting Things Up

Book 1 - Abstractions, Generalizations, and Basic Physics

Part 1 - Space, Time, Physics

An area is a kind of room. An area is usually dark. An area has a text called a darkDescription. The darkDescription is usually "The [printed name] has no description in the dark."

The time of day is 1:14 AM.

Definition: a number is round if the remainder after dividing it by 10 is 0.
Definition: a supporter is occupied if something is on it.
Definition: a container is occupied if something is in it. [added for completion's sake, dunno if I need it]

A thing can be notable or mundane. A thing is usually mundane.
A thing can be examined or unexamined. A thing is usually unexamined. 
After examining something: now the noun is examined; continue the action.

Definition: a thing is miniscule if its bulk is 0.
Definition: a thing is tiny if its bulk is 1.
Definition: a thing is small if its bulk is at least 2 and its bulk is at most 4.
Definition: a thing is midsized if its bulk is at least 5 and its bulk is at most 8.
Definition: a thing is large if its bulk is at least 9.
A person usually has bulk 20.

Radioactivity is a kind of value. 1rad specifies a radioactivity. [radiation emission value of objects/background]
Radiation level is a kind of value. 1rem specifies a radiation level. [amount of radiation present in Zek's body]

[Temperature is a kind of value. 10C specifies a temperature. Every person has a temperature. A person usually has temperature 37C. Everything has a temperature. A thing usually has temperature room temp. Every area has a temperature called the room temp. An area usually has a temperature 

Definition: a person is hypothermic rather than warm if his temperature is at most 35C.
]
[invoke during game text using "[time of day as 24h time]"]
To say (relevant time - a time) as 24h time:
	let H be the hours part of relevant time;
	let M be the minutes part of relevant time;
	say "[H]:[if M is less than 10]0[end if][M]".

To beep:
	say "Beep!"

Part 2 - Redefining Standard Rules

Printing the room-heading of something is an activity.

Rule for printing the room-heading of a room (called the place):
	say "TEST: [place].";
	follow the new room-name rule;

This is the complex room heading rule:
	say bold type;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		if handling the printing the name of a dark room activity,
			issue miscellaneous library message number 71;
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		carry out the printing the room-heading activity with the location;
	otherwise:
		say "[The visibility ceiling] otherwise"; [this probably should too]
	say roman type;
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
		issue library message looking action number 8 for the intermediate level;
		let the intermediate level be the visibility-holder of the intermediate level;
	say line break;
	say run paragraph on with special look spacing;

The complex room heading rule is listed instead of the room description heading rule in the carry out looking rules.

Part 3 - Status Line, Game HUD

To set the status line:
	now the right hand status line is "[time of day as 24h time]";
	
Book 2 - Let There Be Light

Part 1 - Units and Definitions

A candlepower is a kind of value. 10cp specifies a candlepower. Everything has a candlepower. A thing usually has candlepower 0cp. A candlepower times a candlepower specifies a candlepower.

Definition: a candlepower is round if the remainder after dividing it by 10cp is 0cp.
Definition: a thing (called the target) is luminous: [does it shed light?]
	if the target is a person, no;
	if the candlepower of the target is at least 1cp, yes;
	no.
Definition: a thing (called the target) is tenebrous: [opposite of luminous]
	if the target is a person, no;
	if the candlepower of the target is at most 0cp, yes;
	no.
Definition: a thing (called the target) is glowing rather than shadowy: [is it luminous AND /currently/ in the dark?]
	if the target is tenebrous, no;
	if the location of the target is dark, yes;
	no.

Every thing has some text called the glowingDescription. The glowingDescription of a thing is usually "The glowy [printed name] has no description in the dark."

Brightness is a kind of value. Every area has a brightness. The brightnesses are defined by the Table of Brightnesses.

Table of Brightnesses
brightness	candlepower	roomlight
blinding	100cp	"lighted"
bright	80cp	"lighted"
good	50cp	"lighted"
twilit	20cp	"dark"
gloomy	10cp	"dark"
black	0cp	"dark"

An area is usually black.

A flicker is a kind of value. The flickers are insubstantial, insufficient, faint, muted, poor, weak, wavering, dim, [low, shadowy, ]wan, subdued, tenuous, shifting, dull, anemic, frail, ghostly, and flickering.

Part 2 - Activities, Interrupts, and Rules

Chapter 1 - Activities

To set the light level:
	let arealight be 0cp;
	repeat with portal running through the open doors in the location: [connected to???]
		if the area on the other side of the portal is lighted:
			increase arealight by 25cp;
	repeat with luminant running through luminous things in the location:
	[say "In room - [luminant]: [candlepower of luminant]."; [NFR]]
		increase arealight by arealight plus candlepower of luminant;
		[say "[arealight]."; [NFR]]
	[if arealight is not round, say "Not round!"; [NFR]]
	repeat with luminant running through luminous things enclosed by the player:
		if the luminant is not inside a transparent container:
			[say "In player - [luminant]: [candlepower of luminant]."; [NFR]]
			now arealight is arealight plus candlepower of luminant;
			[say "[arealight]."; [NFR]]
	[Make the arealight a round number and cap it if it's too high or low]
	if arealight is not round, now arealight is arealight - (remainder after dividing arealight by 10cp);
	if arealight is greater than 100cp, now arealight is 100cp;
	if arealight is less than 0cp, now arealight is 0cp;
	[say "room total: [arealight]."; [NFR]]
	if there is no brightness corresponding to a candlepower of arealight in the Table of Brightnesses:
		[say "No matching brightness found!"; [NFR]]
		repeat with counter running from arealight to 100cp:
			decrease arealight by 10cp;
			[say "Decreased by 10cp: [arealight][line break]"; [NFR]]
			if there is a brightness corresponding to a candlepower of arealight in the Table of Brightnesses, break;
	now brightness of location is brightness corresponding to a candlepower of arealight in the Table of Brightnesses;
	[say "Brightness found and set: [brightness of location]"; [NFR]]
	if the location is dark:
		if the roomlight of the brightness of the location is "lighted":
			now the location is lighted;
	otherwise:
		if the roomlight of the brightness of the location is "dark":
			now the location is dark.
		
To say the dim item description:
	say "The [random flicker] [random glow] from the [random luminous thing in the location] [random shine] [list of tenebrous small things in the location] and [list of tenebrous large things in the location]."

Chapter 2 - Interrupts and Reactions

Before printing the name of something while listing contents:
	if the holder of the noun contains exactly 1 thing, say "single ".

Before printing the name of a luminous thing while taking inventory in the dark:
	say "glowing ".

After deciding the scope of the player while in darkness: 
	repeat with luminant running through the luminous things:
		place the luminant in scope.

After printing the description of a dark room:
	repeat with luminant running through the luminous things:
		if candlepower of luminant is at most 1cp:
			do nothing;
		otherwise:
			say "[glowingDescription of luminant][line break]";
		now the luminant is seen;
		now the luminant is not marked for listing;
	if there are no tenebrous things contained by the location, stop;
	repeat with tenebrant running through the tenebrous things:
		now the tenebrant is marked for listing;
	say "The [random flicker] [random glow] from the [random luminous thing in the location] [random shine] ";
	list the contents of the location, as a sentence, listing marked items only;
	say "."
	
Chapter 3 - Rules

Visibility rule when in darkness (this is the luminous exception rule):
	if the noun is luminous, there is sufficient light;
	there is insufficient light.

The luminous exception rule is listed instead of the can't act in the dark rule in the visibility rules.

[The MC knows the layout of the ship by heart, even in the dark, so we never want to see "Darkness" as a room name and we want a general indication of the overall light level after the room name (for now)]

Rule for printing the name of a room (called the place) (this is the new room-name rule):
	let foo be false; [add a flag here so we can trap only specific events to append this text]
	[if the constructing the status line activity is going on, let foo be true;]
	if the printing the room-heading activity is going on, let foo be true;
	[if consulting the room description heading rule, let foo be true;] [need to add an activity to the room heading rules]
	if foo is true:
		say "[printed name], in [brightness of place] [if place is lighted]light[otherwise]darkness[end if]";
	else:
		say "[printed name]";

[		if brightness of location is:
		-- blinding: say "[printed name], in blinding light!";
		-- bright: say "[printed name], in bright light";
		-- good: say "[printed name], in good light";
		-- twilit: say "[printed name], in twilight";
		-- gloomy: say "[printed name], in near darkness";
		-- black: say "[printed name], in total darkness";
		-- otherwise: say "[printed name], in a darkness not covered here"; [should never be reached]]		
			
Rule for printing the name of a dark room:
	follow the new room-name rule;

Rule for printing the description of a dark room: 
	say "[darkDescription of location][line break]";
	pay attention.

[cf examples 60 and 330 for possible alternatives to this rule]
Rule for printing a number of something tenebrous (called the tenebrant) when the player is in a dark room:
	if the listing group size is 1, say "a single [printed name of tenebrant]"; [doesn't work, Inform probably doesn't think of one thing as a group of one]
	if the listing group size is 2, say "a couple [printed plural name of tenebrant]";
	if the listing group size is at least 3 and the listing group size is at most 5, say "a few [printed plural name of tenebrant]";
	if the listing group size is at least 6 and the listing group size is at most 8, say "several [printed plural name of tenebrant]";
	if the listing group size is at least 9, say "many [printed plural name of tenebrant]".

[maybe switch this to a property called tenebrousName on the object itself? having the same names follow each object makes sense in-world, could use the text substitution rules to allow flexible-static name assignation; would "understand tenebrousName as referring to the noun" work?]
[disabled because it's a total pain when testing other things]
[Rule for printing the name of something tenebrous (called the tenebrant) when the player is in a dark room:
	if the bulk of the tenebrant is at most 4, say "[one of]shape[or]thing[or]object[at random]";
	if the bulk of the tenebrant is at least 5, say "[one of]hulk[or]form[or]shape[at random]";]

Book 3 - Scenery, Furniture, and Props

Part 1 - Transitional Things

A hatch is a kind of door. A hatch is usually unlocked and closed. A hatch has bulk 20.
Before going through a closed hatch (called the blocking hatch):
	silently try opening the blocking hatch;
	if the blocking hatch is closed:
		stop the action.

[After going through a hatch, set the light level. - might be redundant with the Every Turn rule below, testing required]

Part 2 - Kinds of Objects

A light is a kind of device. A light is fixed in place and switched on. A light has a candlepower of 15cp. A light is usually familiar.
A glow is a kind of value. Every light has a glow. The glows are gleam, glimmer, lambency, and incandescence.
A shine is a kind of value. Every light has a shine. The shines are shows, illuminates, limns, and shines on.

An emergency lightstrip is a kind of light. "A long strip of small red lights sunk into a chunk of tempered plastic. Infamously underpowered, but some light's better than no light." The glowingDescription of the emergency lightstrip is "The red emergency lights cast unsettling shadows across the room."
An emergency lightstrip has a candlepower 30cp. 

A panel is a kind of supporter. The description of a panel is "A cheap amber-monochrome touchscreen[if active]. The controls seem to pulse and waver a little bit as you watch. Blasted cheap gear[otherwise]. The display is dark[end if]." The glowingDescription of a panel is "A control panel glows faintly in the dark." 
A panel can be active or inactive. A panel is usually active. A panel has a candlepower 10cp.

Rule for listing contents of a panel:
	say "[Number of buttons on the panel in words] rhombus-shaped buttons are outlined: [list of buttons on the panel with indefinite articles]";

A button is a kind of device. "A simple button." It is fixed in place and switched off. It has a candlepower 1cp. 

Instead of pushing a button (called the frobber):
	if the frobber is switched on:
		now the frobber is switched off;
		beep;
		say "[printed name of frobber] is now off.";
	otherwise:
		now the frobber is switched on;
		beep;
		say "[printed name of frobber] is now on."

Book 4 - Actors

Part 1 - Bodily Functions

To pay attention:
	let foo be a random number between 1 and 5;
	if foo is:
	-- 1: try listening;
	-- 2: try smelling;
	-- otherwise: say "[line break]".
	[say "Sensing value: [foo][line break]"; [NFR]]

[Listening and smelling are handled the same way:
1) If the player doesn't listen to anything specific, the ambient sound/odour rule supplies the location as the default noun for the verb
2) Assuming no other rules are hooked into the process order, the block listening/smelling rule (which is set to fail by default) fires and supplies the default message "You hear/smell nothing unexpected."

NEW PROCESSING:
1) If the player supplies a noun, listen or smell it as per default
2) If no noun is supplied, I7 checks the surroundings for any NOTABLE sounds/smells ("stimuli")
	--Sounds that are "noisy" should be audible from the next room over /at least/; maybe sounds have a decibel level that determines how far away it can be heard? On the flip side of that, have certain sounds that are /only/ audible if the player issues a LISTEN command?
	--Smells do not travel between rooms unless A) it's a strong smell and B) there is an open connection between the location of the smell and the location of the player (certain rooms have air vents that allow this to be circumvented?)
3) If ANY are found, ALL of them are reported to the player
4) If NONE are found, I7 supplies a semi-generic "You smell..." message
	--Not sure yet whether generic sounds should be on a per-room basis (maybe just for notable rooms?) or whether there should be an overall (per-region?) generic sounds table

Priority list:
prominent audible things
ambient audible things
silence
] 

[*** Listening]
Everything has some text called the sound. The sound is usually "silence".
Definition: a thing is audible rather than silent if the sound of it is not "silence".
Definition: a thing is prominent if it is audible and it is notable.
Definition: a thing is ambient if it is audible and it is mundane.

Definition: an area is noisy if it encloses a prominent thing.
Definition: an area is peaceful if it encloses an ambient thing and it does not enclose a prominent thing.
Definition: an area (called the place) is silent:
	if the place encloses a prominent thing, no;
	if the place encloses an ambient thing, no;
	yes;

[Definition: a region (called the zone) is noisy rather than quiet:
	if the zone encloses a noisy area (called the place):
		if the place is the location, no;
		yes;
	no.]

[remove the original listening logic entirely]
The block listening rule is not listed in any rulebook.

To tune in:
	say "this is the tune in phrase.";
	let places be a list of areas; [all areas in the region]
	let houseparty be a list of areas; [all NOISY areas in the region]
	repeat with bar running through the list of areas contained by the map region of the location:
		add bar to places;
	say "added all areas in region to list places";
	repeat with target running through places:
		if target is noisy, add target to houseparty;
	say "[houseparty]";

Check listening:
	if the location is not noisy:
		if the location is not peaceful:
			tune in;
			say "You hear only the dead silence of a scuttled ship." instead;
		continue the action;
	continue the action;

[	say "[the location] - [if noisy]noisy[else if peaceful]peaceful[else if silent]silent[end if][line break]"; [NFR]
	if the location is silent:
		say "You hear only the dead silence of a scuttled ship." instead;
	continue the action;]
	
[	if the map region of the location is noisy:
		say "The region is noisy!"; [just kidding: decide which region to check, decide which rooms, decide which items, play those sounds]]
	
[Carry out listening:
	let ducks be the list of audible things in the location;]

Report listening:
	repeat with duck running through the audible things enclosed by the location:
		say "You hear [the sound of the duck], coming from the [printed name of the duck].";

Listening is sense behavior.

[*** Smelling]

Smelling is sense behavior.

[*** Body Temperature]
A person can be hypothermic, overheated, or warm. A person is usually warm. A person can be concussed or sober. A person is usually sober.

[To check the temperature of something:
	if the noun is a person:
		
	otherwise:
		say "Invalid temperature check target!";
]	

Part 2 - The Player

The printed name of the player is "Zek Lumien".

A left hand is part of the player. The description of the left hand is "It's your left hand. [if brightness of location is black]You flex it once or twice to make sure it's still there[otherwise]Missing fingertip on middle finger (bar fight), blank pinky fingerprint (close call with industrial acid), inoculation and transit scars on the back (expensive counterfeits)[end if]." It is familiar and seen.

A right hand is part of the player. The description of the right hand is "The bolt on the [if Medical Bay is visited]autodoc[otherwise]coffin wall[end if] tore a jagged scratch across the back of your right hand. It doesn't seem to affect your ability to use the hand, which is good, but it hurts like [italic type]crazy[roman type] and refuses to stop trickling blood, which is bad. !!{if bandaged}A thick white bandage is wound around your hand like a prizefighter's wrist wrap. The gauze pad on the back !!has bled through/has not bled through/etc." It is familiar and seen.

Book 5 - The Starlight Dancer

Part 1 - Deck A

Deck A is a region.

[*** The Autodoc (Starting Area)]
The Autodoc is an area. "You're lying down inside a metal coffin that isn't much larger than you. It (you?) reeks of medical disinfectants; the fuzziness in your head feels like it's keeping away a headache from all the fumes." 
The player is here. [The player is lying down.] The Autodoc is in Deck A.
[The printed name of the autodoc is "An antiseptic coffin".] Understand "coffin" as the Autodoc. The darkDescription of the Autodoc is "It's cold and damp and dark in here."
The Autodoc is lighted. [if you change the start area, change this statement as well accordingly!]
Index map with the Autodoc mapped south of the Medical Bay.

[Before trying to stand up inside the autodoc:
	say "The plastex window is merely four inches above your face; you have just enough room to confirm that there's no more clearance anywhere else.";
	stop the action;]

There is a panel called the control panel in the Autodoc. "A control panel, complete with colored buttons, is." The description is "The edges of the control panel have some biogunk in them." The glowingDescription is "An amber-colored control panel shines wan light onto your sternum."
The control panel has candlepower 50cp.

The cycle button is a button. The cycle button is part of the control panel.
The description of the cycle button is "It's red, and it says 'Surgery Complete?' in blinking letters." 
Instead of pushing the cycle button:
	now the control panel is inactive;
	now the description of the cycle button is "It's green and says 'Select Program'.";
	say "The button changes to green and blinks 'Completed' a couple times.";

The unlock button is a button. The unlock button is part of the control panel.
Instead of pushing the unlock button:
	if the control panel is inactive:
		now the autodoc's hatch is unlocked;
		say "The 'Unlock Hatch' button changes to green.";
	otherwise:
		say "ERROR: Completion of surgery cycle has not been confirmed.";

The exit button is a button. The exit button is part of the control panel.
Instead of pushing the exit button:
	if the autodoc's hatch is locked:
		if the control panel is active:
			say "ERROR: Completion of surgery cycle has not been confirmed.";
		otherwise:
			say "ERROR: Autodoc hatch is locked.";
	otherwise:
		try opening the autodoc's hatch;

The Autodoc's hatch is a hatch. It is outside of the Autodoc and inside of the Medical Bay. "A rectangular porthole made from plastex is set into the hatch above." It is locked. The printed name of the Autodoc's hatch is "hatch". The description of the autodoc's hatch is "The door of the coffin. There is a tiny plastex window the size of a playing card directly in front of your head, and a control panel a few inches below that."
[Before listing nondescript items of the autodoc:
	if the autodoc's hatch is marked for listing:
		now the autodoc's hatch is unmarked for listing.]

Before opening the Autodoc's hatch:
	if the Autodoc's hatch is locked:
		say "The control panel flashes red and beeps. It seems the hatch is locked shut.";
		stop the action;
	otherwise:
		say "A beat passes, and then the gasket on the autodoc's hatch disengages with a whoosh of pressurized air. The stench of old blood quickly replaces the tang of disinfectants."	

The hatch window is part of the Autodoc's hatch. The description of the hatch window is "The frosted plastex shows only flickers of dim light on the ceiling above." 

[*** The Medical Bay]
The Medical Bay is an area. "The Medical Bay: filled with all the pointy and invasive tools of the trade." The Medical Bay is in Deck A.

The Medical hatch is a hatch. It is west of Hallway A and east of the Medical Bay. 

[*** Deck A Hallway]
Hallway A is an area. "Hallway!" Hallway A is in Deck A.

Volume 2 - Beginning Play

When play begins:
	set the status line;
	set the light level;
	say "The smell of burning electronics hits your lizard hindbrain like a rivet gun and you awaken almost immediately, limbs flailing against the sides of the coffin. A badly-milled bolt opens a bloody streak on the back of your wrist, and several seconds pass before you realize you can't feel it because you're completely numb.[line break]
	...[line break]
	The smoke smell drifts by your nose again, a little stronger. You startle and bark your forehead on the plastex window above you. The pain keeps you awake this time.".
	
Every turn:
	set the light level;

Volume 3 - During Play

Autodoc Escape is a scene. Autodoc Escape begins when play begins. Autodoc Escape ends when the Medical Bay is visited.

Volume 0 - Not For Release

Understand "WHEREAMI" as wherethefuckami.
Wherethefuckami is an action applying to nothing.

Report wherethefuckami:
	say "You are here: [location]."

Understand "LUMOS [something] [some candlepower]" as changecandlepower.
Changecandlepower is an action applying to one thing and one candlepower.

Carry out changecandlepower:
	now the candlepower of the noun is the candlepower understood;
	set the light level.
	
Report changecandlepower:
	say "[the printed name of the noun]: [the candlepower of the noun]".

Understand "LAMBENCY" as performlighttesting.
Performlighttesting is an action applying to nothing.
Report performlighttesting:
	say "[location] - [candlepower of brightness of location], [brightness of location], [if location is dark]dark[else]lit[end if]";

Understand "HAMA" as luminousdoodads.
luminousdoodads is an action applying to nothing.
Report luminousdoodads:
	say "Current light level of [printed name of location]: [brightness of location].";
	repeat with luminant running through the luminous things[ in the location - doesn't list stuff on player if uncommented]:
		say "[printed name of luminant] - [location of luminant], [if luminant is visible]visible[otherwise]invisible[end if], [if luminant is seen]seen[otherwise]unseen[end if][line break]".
	
Understand "MUDO" as tenebrousdoodads.
tenebrousdoodads is an action applying to nothing.
Report tenebrousdoodads:
	say "Current light level of [printed name of location]: [brightness of location].";
	repeat with tenebrant running through the tenebrous things[ in the location - doesn't list stuff on player if uncommented]:
		say "[printed name of tenebrant] - [location of tenebrant][line break]".

A sunrod is a device carried by the player. The candlepower of the sunrod is 1cp."This is the normal description of the sunrod.[if switched on]It glows with a bright light.[otherwise]It is dark.[end if]". The sunrod has glowingDescription "[if carried]The sunrod in your hand glows dimly. [otherwise]The sunrod glows faintly.[end if]".
Carry out switching on the sunrod:
	say "LIGHTS";
	now the candlepower of the sunrod is 50cp.

Carry out switching off the sunrod: 
	say "DARKNESS";
	now the candlepower of the sunrod is 1cp.

A radio is a device carried by the player. "This is the init app of the radio. [if switched on]It emits a constant stream of static.[otherwise]It is silent.[end if]". The radio is switched on. The radio is notable. The sound of the radio is "white noise".
Carry out switching on the radio:
	say "You turn the radio on and static fills the room.";
	now the radio is notable;
	now the sound of the radio is "white noise";

Carry out switching off the radio:
	say "You turn the radio off. Silence clears the room.";
	now the radio is mundane;
	now the sound of the radio is "silence";

[**********************************]
[_ _ t THE CODE GRAVEYARD t _t ][
]