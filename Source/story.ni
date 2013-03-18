"Silent Stars" by Zaq Grow

Use dynamic memory allocation of at least 16384.

Include Bulk Limiter by Eric Eve.
Include Shipboard Directions by Mikael Segercrantz.
Include Epistemology by Eric Eve.

[TODO:
--Message addition: The lit status of the room and any overriding light sources in the room should be communicated to the player via a short message directly previous to the room description and after the heading (if possible). Ex: "The sunrod in your hand does a good job of lighting up the shadows. /n/nThe Medical Bay is..."
--Message change: "It seems to be locked." when attempting to open a locked door
--Message change: "It is now pitch dark in here!" when a room moves from lit to dark
--Message change: "It is pitch dark, and you can't see a thing." when examining something in the dark(?)
--Come up with a better verb for "equilibrioception" and add it as a sense like smell
--The player should be able to use the RECALL (aka REMEMBER) command to remember where a given prop is located in the ship; if the player tries to recall something that has been destroyed or lost, that should be made clear also
--Dim item description could use lots more variation
--Need to implement postures, see ex381: might be too heavyweight for what I want to do?
--Not sure how to get rid of the "On the (supporter)..." part of the message created when examining a supporter
--Shipboard directions can be assigned compass directions easily ("Understand "fore" as north." &c) but the map does not correctly draw these relationships. The easy way out would be to use compass directions long enough to get the game done and the map exported, and then search-replace all of the compass directions into shipboard ones while leaving the shipboard-compass direction assignment intact. I'd rather use the shipboard dirs from the start though.
--Refer to ex178 for random variations into text
--Problems involving hypothermia require a way to measure the ambient temp and the player temp
--Problems involving radiation sickness require similar ways

Needed objects:
Doortypes: hatches, blast doors
Objects: bandage, styptic powder? antiseptic?
]

Volume 1 - Setting Things Up

Book 1 - Abstractions, Generalizations, and Basic Physics

Part 1 - Redefining Standard Rules and Style

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

The time of day is 01:14 AM.
[invoke during game text using "[time of day as 24h time]"]
To say (relevant time - a time) as 24h time:
	let H be the hours part of relevant time;
	let M be the minutes part of relevant time;
	say "[if H is less than 10]0[end if][H]:[if M is less than 10]0[end if][M]".

Definition: a number is round if the remainder after dividing it by 10 is 0.
Definition: a supporter is occupied if something is on it.
Definition: a container is occupied if something is in it. [added for completion's sake, dunno if I need it]

A thing can be notable or mundane. A thing is usually mundane.
A thing can be examined or unexamined. A thing is usually unexamined. 

Definition: a thing is miniscule if its bulk is 0.
Definition: a thing is tiny if its bulk is 1.
Definition: a thing is small if its bulk is at least 2 and its bulk is at most 4.
Definition: a thing is midsized if its bulk is at least 5 and its bulk is at most 8.
Definition: a thing is large if its bulk is at least 9.
A person usually has bulk 20.

A room is usually dark.

Part 3 - Status Line, Game HUD, Misc

To set the status line:
	now the right hand status line is "[time of day as 24h time]";

To beep:
	say "Beep!"

Book 2 - Let There Be Light

Part 1 - Units and Definitions

Every room has some text called the dark-description. The dark-description is usually "The [printed name] has no description in the dark."

Every thing has some text called the dark-description. The dark-description is usually "The [printed name] has no description in the dark."

[these don't account for shining things being inside opaque containers right now]
To decide if the light level is bright:
	if the location encloses a shining thing, yes;
	no.
	
To decide if the light level is dim:
	if the location encloses a glowing thing:
		if the location encloses a shining thing, no;
		yes;
	if the location is lighted, yes;
	no.

To decide if the light level is dark:
	if the location is dark, yes;
	no.

Definition: A room is bright if it encloses a shining thing.
Definition: A room is dim:
	if it encloses a glowing thing:
		if it encloses a shining thing, no;
		yes;
	if it is lighted, yes.

A thing can be bright or dim. A thing is usually dim.
A thing can be diffuse or direct. A thing is usually diffuse.

Definition: a thing is shining if it is lit and it is bright.
Definition: a thing is glowing if it is lit and it is dim.

Understand the lit property as describing a thing. Understand "luminous" as lit. Understand "tenebrous" as unlit.

Part 2 - New Rules

The can't act in the dark rule is not listed in any rulebook.
The first visibility rule:
	consider the new-visibility rulebook instead.
	
The new-visibility rules is a rulebook. The new-visibility rules have outcomes there is sufficient light (failure), there is mediocre light (failure), and there is insufficient light (success).

A new-visibility rule (this is the visibility level rule):
	if the light level is bright:
		there is sufficient light; [being in a bright room always passes all vis checks]
	otherwise if the actor is carrying a bright direct thing:
		there is sufficient light; [so does having a flashlight in hand]
	otherwise if the actor is carrying a dim direct thing:
		there is mediocre light; [but if the flashlight is getting weak...(note that this is technically the same as sufficient light, and so it needs to be trapped appropriately to be made use of]
	otherwise if the light level is dim:
		if the noun is familiar, there is sufficient light; [if the player has examined it before, they are presumed to be familiar enough to recall/use it in dim light]
		otherwise there is mediocre light;
	otherwise:
		there is insufficient light. [if none of the above is true, assume the player is in the dark]

[The shining-glowing exception causes a dark room to become lit if the room contains lit things, so by definition a dark room is one that does not contain any lit things, and thus nothing should be in scope. An exception might be made for familiar things the player has dropped; need to do more work]
[After deciding the scope of the player while in darkness:
	if the light level is dim:
		place the location in scope;
	if the light level is dark:
		repeat with item running through lit things enclosed by the location:
			if item is not inside an opaque container, place item in scope;]

[After adjusting the light in the room, check to see how powerful those lit items are and whether the lighted status of the room needs to be adjusted to match]
The shining-glowing exception rule is listed after the adjust light rule in the turn sequence rulebook.
This is the shining-glowing exception rule:
	if the location is dark:
		if the light level is bright or the light level is dim:
			now the location is lighted.
	
Part 3 - New Activities

[Zeke knows where is in the ship by memory anyway, so don't bother obscuring the names of rooms]
Rule for printing the name of a room (this is the new room-name rule):
	[only certain actions and activities should get the full light treatment, everything else just gets the room]
	let light-description-toggle be false;
	if the current action is looking, now light-description-toggle is true;
	if light-description-toggle is false, say "[printed name of the location]" instead;
	if the light level is dark:
		say "[printed name of the location], in the [random dark-noun]" instead;
	if the light level is dim:
		say "[printed name of the location], in dim light" instead;
	if the light level is bright:
		say "[printed name of the location], in the [random light-noun]" instead;
	say "[printed name of the location]" instead.

Rule for printing the name of a dark room:
	follow the new room-name rule instead;

Rule for printing the description of a dark room:
	say "[dark-description of the location]";
[With regards to location contents listing after a dark room's description:
Because a dark room is defined as one that does not contain any lit things, it is thus impossible to see anything in the room. Again, an exception might be made for familiar things the player has abandoned here]

[since Zeke knows where he is even in the dark, we want the rooms he arrives in to be visited as normal]
The replacement arrival check rule is listed instead of the check new arrival rule in the carry out looking rules.
This is the replacement arrival check rule:
	if the location is a room, now the location is visited;
	if in darkness:
		now the darkness witnessed is true;
		
[Changes the "You also see..." message written during room description to be a little more flexible]
Rule for listing nondescript items while the light level is dim:
	if the location does not enclose a lit thing:
		say "The ambient [random light-noun] [random light-verb] ";
	else:
		let foo be a random number from 1 to 2;
		if foo is:
			-- 1: say "The [random lit thing] [random light-verb] "; [The glowing blorb shines on a sprocket.]
			-- 2: say "The [random light-noun] from [a random lit thing] [random light-verb] "; [The shifting light from the glowing blorb illuminates a sprocket.]
	list the contents of the location, as a sentence, listing marked items only;
	say ".";

Book 3 - Scenery, Furniture, and Props

Part 1 - Transitional Things

A hatch is a kind of door. A hatch is usually unlocked and closed. A hatch has bulk 20.
Before going through a closed hatch (called the blocking hatch):
	silently try opening the blocking hatch;
	if the blocking hatch is closed:
		stop the action.

Part 2 - Kinds of Objects

A light-noun is a kind of value. The light-nouns are lightness, glow, gleam, glimmer, lambency, and incandescence.
A light-verb is a kind of value. The light-verbs are shows, illuminates, limns, reveals, and shines on.
A dark-noun is a kind of value. The dark-nouns are darkness, gloom, and shadows.

[A flicker is a kind of value. The flickers are insubstantial, insufficient, faint, muted, poor, weak, wavering, dim, low, shadowy, wan, subdued, tenuous, shifting, dull, anemic, frail, ghostly, and flickering.]

A panel is a kind of supporter. The description of a panel is "A cheap amber-monochrome touchscreen[if active]. The controls seem to pulse and waver a little bit as you watch. Blasted cheap gear[otherwise]. The display is dark[end if]." The dark-description of a panel is "A control panel glows faintly in the dark." 
A panel can be active or inactive. A panel is usually active.

Rule for listing contents of a panel:
	say "[Number of buttons on the panel in words] rhombus-shaped buttons are outlined: [list of buttons on the panel with indefinite articles]";

A button is a kind of device. "A simple button." It is fixed in place and switched off.

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

Chapter 1 - Listening

[Define where to find the sounds of something and how to tell if something is silent or not]
Every thing has some text called the sound. The sound of a thing is usually "silence".
Every thing has some text called the sound-description. The sound-description is usually "This does not make noise."
Every room has some text called the sound. The sound of a room is usually "silence".
Every room has some text called the sound-description. The sound-description is usually "Total silence."

Definition: a thing is noisy rather than silent if the sound of it is not "silence".
Definition: a room is noisy rather than silent if the sound of it is not "silence".

To decide if the noise level is high:
	do nothing;

[remove the default rules so as to add our own]
The block listening rule is not listed in any rulebook.
[The new ambient sound rule is listed instead of the ambient sound rule in the supplying a missing noun rulebook.] [does this need to be here in order to usurp the previous rule?]

Rule for supplying a missing noun while an actor listening (this is the new ambient sound rule):
	follow the unfocused listening rules.
	
The unfocused listening rules is a rulebook.

Part 2 - The Player

The printed name of the player is "Zek Lumien".

A left hand is part of the player. The description of the left hand is "It's your left hand. {if brightness of location is black}You flex it once or twice to make sure it's still there{otherwise}Missing fingertip on middle finger (bar fight), blank pinky fingerprint (close call with industrial acid), inoculation and transit scars on the back (expensive counterfeits){end if}." It is familiar and seen.

A right hand is part of the player. The description of the right hand is "The bolt on the [if Medical Bay is visited]autodoc[otherwise]coffin wall[end if] tore a jagged scratch across the back of your right hand. It doesn't seem to affect your ability to use the hand, which is good, but it hurts like [italic type]crazy[roman type] and refuses to stop trickling blood, which is bad. !!{if bandaged}A thick white bandage is wound around your hand like a prizefighter's wrist wrap. The gauze pad on the back !!has bled through/has not bled through/etc." It is familiar and seen.

Book 5 - The Starlight Dancer

Part 1 - Deck A

Deck A is a region.

[*** The Autodoc (Starting Area)]
The Autodoc is a room. "You're lying down inside a metal coffin that isn't much larger than you. It (you?) reeks of medical disinfectants; the fuzziness in your head feels like it's keeping away a headache from all the fumes." 
The player is here. The Autodoc is in Deck A.
The printed name of the autodoc is "Antiseptic Coffin". Understand "coffin" as the Autodoc. The dark-description of the Autodoc is "It's cold and damp and dark in here."
Index map with the Autodoc mapped south of the Medical Bay.

There is a panel called the control panel in the Autodoc. "The control panel above you shows a blinking red button." The description is "The edges of the control panel have some biogunk in them." The dark-description is "An amber-colored control panel shines wan light onto your sternum."
The control panel is lit.

[need to adapt the buttons to track their on-off status rather than intercepting their logic wholesale]
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

The Autodoc's hatch is a hatch. It is outside of the Autodoc and inside of the Medical Bay. "[if player is in Autodoc]A small plastex window is set into the hatch above you.[else]A dark plastex porthole is set into the hatch of the autodoc." It is locked. The printed name of the Autodoc's hatch is "hatch". The description of the autodoc's hatch is "The door of the coffin. There is a tiny plastex window the size of a playing card directly in front of your head, and a control panel a few inches below that."

Before opening the Autodoc's hatch:
	if the Autodoc's hatch is locked:
		say "The control panel flashes red and beeps. It seems the hatch is locked shut.";
		stop the action;
	otherwise:
		say "A beat passes, and then the gasket on the autodoc's hatch disengages with a whoosh of pressurized air. The stench of old blood quickly replaces the tang of disinfectants."	

The hatch window is part of the Autodoc's hatch. The description of the hatch window is "The frosted plastex shows only flickers of dim light on the ceiling above." 

[*** The Medical Bay]
The Medical Bay is a room. "The Medical Bay: filled with all the pointy and invasive tools of the trade." The Medical Bay is in Deck A. The Medical Bay is dark.

The Medical hatch is a hatch. It is west of Hallway A and east of the Medical Bay. 

There is a widget in the Medical Bay.

[*** Deck A Hallway]
Hallway A is a room. "Hallway!" Hallway A is in Deck A.

Volume 2 - Beginning Play

When play begins:
	set the status line;
	say "The smell of burning electronics hits your lizard hindbrain like a rivet gun and you awaken almost immediately, limbs flailing against the sides of the coffin. A badly-milled bolt opens a bloody streak on the back of your wrist, and several seconds pass before you realize you can't feel it because you're completely numb.[line break]
	...[line break]
	The smoke smell drifts by your nose again, a little stronger. You startle and bark your forehead on the plastex window above you. The pain keeps you awake this time.";
	
Volume 3 - During Play

Autodoc Escape is a scene. Autodoc Escape begins when play begins. Autodoc Escape ends when the Medical Bay is visited.

Volume 0 - Not For Release

Understand "LAMBENCY" as current-light-level.
Current-light-level is an action applying to nothing.
Carry out current-light-level:
	say "[The location] is [if the location is bright]bright.[else if the location is dim]dim.[else]dark.";

A sunrod is a device carried by the player. "This is the normal description of the sunrod. [if switched on]It glows with a bright light.[otherwise]It is dark." The sunrod has dark-description "[if carried]The sunrod in your hand glows dimly. [otherwise]The sunrod glows faintly." The sunrod is bright.
Carry out switching on the sunrod:
	now the sunrod is lit;
	say "LIGHTS";

Carry out switching off the sunrod: 
	now the sunrod is unlit;
	say "DARKNESS";

[A radio is a device carried by the player. "This is the init app of the radio. [if switched on]It emits a constant stream of static.[otherwise]It is silent.[end if]". The radio is switched on. The radio is notable. The sound of the radio is "white noise".
Carry out switching on the radio:
	say "You turn the radio on and static fills the room.";
	now the radio is notable;
	now the sound of the radio is "white noise";

Carry out switching off the radio:
	say "You turn the radio off. Silence clears the room.";
	now the radio is mundane;
	now the sound of the radio is "silence";
]
[**********************************]
[_ _ t THE CODE GRAVEYARD t _t ]
[

]