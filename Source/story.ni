"Silent Stars" by Zaq Grow

Use dynamic memory allocation of at least 16384.

Include Basic Screen Effects by Emily Short.
Include Bulk Limiter by Eric Eve.
Include Shipboard Directions by Mikael Segercrantz.
Include Epistemology by Eric Eve.

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

Part 3 - Status Line, Game HUD, Misc

To set the status line:
	now the right hand status line is "[time of day as 24h time]";

To beep:
	say "Beep!"

Book 2 - Let There Be Light

Part 1 - Units and Definitions

Every room has some text called the dark-description. The dark-description is usually "(dark desc is empty)[br][description][br]"

Every thing has some text called the dark-description. The dark-description is usually "(dark desc is empty)[br][description][br]"

A thing can be bright or dim. A thing is usually dim.
A thing can be diffuse or direct. A thing is usually diffuse.
A thing can be infrared. [this is a flag to allow unlit things to be visible in the dark regardless of actual light level]
Color is a kind of value. The colors are red, orange, yellow, green, blue, indigo, violet, grey, silver, pink, white, and black. A thing has color. A thing is usually silver. Understand the color property as describing a thing.

Definition: a thing is shining if it is lit and it is bright.
Definition: a thing is glowing if it is lit and it is dim.

Definition: A room is bright if it encloses a shining thing.
Definition: A room is dim:
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

[Zeke knows where is in the ship by memory anyway, so don't bother obscuring the names of rooms]
Rule for printing the name of a room (called the place) (this is the new room-name rule):
	[only certain actions and activities should get the full light treatment, everything else just gets the room]
	let light-description-toggle be false;
	if the current action is looking, now light-description-toggle is true;
	[if the player is in Dreamspace, now light-description-toggle is false;]
	if the printing the announcement of light activity is going on, say "..." instead; [if the look action was automatically generated, we're going to skip announcing the name of the room again for now; would be a good place to insert a message later]
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

A panel is a kind of supporter.
The description of a panel is "A cheap amber-monochrome touchscreen. [if active]The controls seem to pulse and waver a little bit as you watch. Blasted cheap gear[otherwise]The display is dark[end if]."
The dark-description of a panel is "A [printed name] glows faintly in the dark." 
A panel has some text called the readout. The readout is usually "Awaiting Input".

[button count is not capitalized]
Report examining a panel (called the board):
	say "[printed name in title case] Readout: '[readout]'[br]";
	say "[Number of controls incorporated by the panel in words] rhombus-shaped buttons are outlined: [list of controls incorporated by the panel with indefinite articles].";
	
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
A dial has some text called the setting. The setting is usually "foo".

[Carry out setting a dial (called the frobber) to something:
	now the setting of the frobber is the second noun;]

Book 4 - Actors

Part 1 - New Actions

To pay attention:
	let foo be a random number between 1 and 5;
	if foo is:
	-- 1: try listening;
	-- 2: try smelling;
	-- otherwise: say "[br]".

A person can be asleep or awake. A person is usually awake.

A person can be wounded or healthy. A person is usually healthy. 

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

[Define where to find the sounds of something and how to tell how loud certain kinds are]
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

[remove the default rules so as to add our own]
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

Chapter 3 - Watersports

Understand "dive" or "dive in" or "jump in" as diving in.
Diving in is an action applying to nothing.

Before diving in:
	let puddle be the room down from the location;
	if the puddle is nothing:
		say "There's nothing to dive into here." instead;
	otherwise if the puddle is in Dreamspace:
		if the location is the rocky shore:
			say "One breath, plus one held.[no line break][br]Even your bones feel like ice.[no line break][br]Darkness shrouds your thoughts.";
		otherwise:
			say "The light calls you down.[no line break][br]You kick your legs, jaw clenched.[no line break][br]Frost tightens your chest.";
	otherwise if the player is underwater:
		say "You kick your legs hard and dive down a few more feet.";
	otherwise:
		say "You set your feet, then take two steps and dive into the {liquid}.";
		
Carry out diving in:
	move the player to the room down from the location;

Part 2 - The Player

The printed name of the player is "Erika".

A left hand is part of the player. The description of the left hand is "It's your left hand. [if the light level is murky]You flex it once or twice to make sure it's still there[otherwise]Missing fingertip on middle finger (bar fight), blank pinky fingerprint (close call with industrial acid), inoculation and transit scars on the back (expensive counterfeits)[end if]." It is familiar and seen.

A right hand is part of the player. The description of the right hand is "The bolt on the [if Medical Bay is visited]autodoc[otherwise]coffin wall[end if] tore a jagged scratch across the back of your right hand. It doesn't seem to affect your ability to use the hand, which is good, but it hurts like [i]crazy[/i] and refuses to stop trickling blood, which is bad. !!{if bandaged}A thick white bandage is wound around your hand like a prizefighter's wrist wrap. The gauze pad on the back !!has bled through/has not bled through/etc." It is familiar and seen.

Book 5 - The Starlight Dancer

The player is in the autodoc. [move the player back to the rocky shore before compiling]

Part 0 - Dreamtime

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

There is a stone here. The stone is lit. "[if the location encloses the stone]Before you, a stone.[otherwise]Under you, a stone.[end if][br]It glows like a faint firefly.[br]Pale white, and falling." The description is "Ivory colored quartz.[br]Cloudy, like a summer day.[br]Warmer than skin heat."
The stone is infrared.

Before examining the stone:
	if the player is not holding the stone, say "Admired at range,[br]the stone's glow waxes and wanes[br]like a  tiny moon." instead;

Before taking the stone:
	if the stone is not touchable, say "Struggling brings ruin.[no line break][br]The depths are the only way.[no line break][br]Commit all, or none." instead;

Report taking the stone:
	say "You reach out, eager.[no line break][br]Chains of ice tug at your limbs.[no line break][br]Your chest burns furnace-hot.[no line break][br][br]A veil draws across.[no line break][br]Red on black, crimson silk red.[no line break][br]The bright sting of pain.[no line break][br][br]You gaze at your hand.[no line break][br]Streams of red hang like silk scarves.[no line break][br]The wound glows ruby.[no line break][br][br]";
	wait for any key;
	say "The red glow flickers.[no line break]" instead;

Part 1 - Deck A

Deck A is a region.

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
	if the autodoc's hatch is unlocked:
		say "ERROR: Autodoc hatch is not sealed." instead;

Carry out pushing the unlock button:
	now the autodoc's hatch is unlocked;
	now the exit button is flashing;

Report pushing the unlock button:
	say "The button flashes a couple times; there is a metallic [i]click[/i] as the locks disengage." instead;

The exit button is a pushbutton. The exit button is part of the control panel.
Check pushing the exit button:
	if the autodoc's hatch is locked:
		if the control panel is active:
			say "ERROR: Completion of surgery cycle has not been confirmed." instead;
		otherwise:
			say "ERROR: [printed name of autodoc's hatch] is locked." instead;

Carry out pushing the exit button:
	now the autodoc's hatch is open;
	now the exit button is steady;

Report pushing the exit button:
	say "A beat passes, and then the gasket on the [printed name] disengages with a whoosh of pressurized air. The stench of old blood quickly replaces the tang of disinfectants." instead;

The Autodoc's hatch is a hatch. It is outside of the Autodoc and inside of the Medical Bay. "[if player is in Autodoc]A small plastex [printed name of hatch window] is set into the hatch above you.[else]A dark plastex porthole is set into the hatch of the autodoc." It is locked. The printed name of the Autodoc's hatch is "hatch". The description of the autodoc's hatch is "The door of the coffin. There is a tiny plastex window the size of a playing card directly in front of your head, and a control panel a few inches below that."

Instead of opening the autodoc's hatch:
	say "You reach up and push the exit button to disengage the hatch seals.[command clarification break]"; 
	try pushing the exit button;

Report closing the autodoc's hatch:
	say "There is a hiss of air as the hatch seals pressurize." instead;

Report going through the autodoc's hatch to the Medical Bay during Autodoc Escape:
	say "You sit up, shouldering open the hatch, and roll over the lip of the autodoc. The fall to the ground is short.";

The hatch window is part of the Autodoc's hatch. The description of the hatch window is "The frosted plastex shows only flickers of dim light on the ceiling above." 

[*** The Medical Bay]
The Medical Bay is a room. The Medical Bay is in Deck A. The Medical Bay is dark.
"'Disarray' is maybe putting it mildly: every single cabinet in the room is open and empty; some of the doors have been torn off the hinges and lie mangled in a corner. The grey tile floor is littered with broken glass, bits of medical paraphernalia, and dried blood." 
The dark-description is "."

[notable furniture:
-- a set of lockers, one of which contains the player's needed gear and is locked
-- a giant puddle of blood on the floor
-- a corpse bearing strange wounds
-- emergency lighting, which casts bloodred shadows
]
[The first time the player enters the bay: "When you lift your head to look around, a bright flash of panic runs through your skull: your right arm is scarlet red from fingertips to elbow. The autodoc's drug-induced haze parts, and as you lift your arm, you realize there is a [i]massive[/i] pool of blood on the floor.";]

The Medical hatch is a hatch. It is west of Hallway A and east of the Medical Bay. 

There is a widget in the Medical Bay.

[*** Deck A Hallway]
Hallway A is a room. "Hallway!" Hallway A is in Deck A.

[Once Deck A is set up, use the neighboring relation to establish the correct adjacency of rooms for the listening logic, repeat for each deck]

The Autodoc abuts the Medical Bay. The Medical Bay abuts Hallway A.

Volume 2 - Beginning Play

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
	wait for any key;
	say "[br]It hurts like [i]crazy.[/i]";]

Volume 3 - Scenes and Stage Movement

[any overarching every turn rules should go here]

Dreamtime is a scene. Dreamtime begins when play begins. Dreamtime ends when the player is carrying the stone.

When Dreamtime ends:
	say "The smell of burning electronics hits your lizard hindbrain like a rivet gun and you awaken almost immediately, limbs flailing against the sides of the coffin. A badly-milled bolt opens a bloody streak on the back of your wrist, and several seconds pass before you realize you can't feel it because you're completely numb.[br]
	...[br]
	The smoke smell drifts by your nose again, a little stronger. You startle and bark your forehead on the plastex window above you. The pain keeps you awake this time.";
	wait for any key;
	move the player to the Autodoc;

Autodoc Escape is a scene. Autodoc Escape begins when play begins[Dreamtime ends]. Autodoc Escape ends when the Medical Bay is visited.

[When Autodoc Escape begins:
	now the player is concussed;]

Volume 0 - Not For Release

Book 1 - Testing Commands

Understand "LUMOS" as current-light-level.
Current-light-level is an action applying to nothing.
Report current-light-level:
	mention the light level;
	say "{{Light-bearing things: [list of lit things enclosed by the location]}}[br]";

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

A sunrod is a device carried by the player. "This is the normal description of the sunrod. [if switched on]It glows with a bright light.[otherwise]It is dark." The sunrod has dark-description "[if carried]The sunrod in your hand glows dimly. [otherwise]The sunrod glows faintly." The sunrod is bright.
Carry out switching on the sunrod:
	now the sunrod is lit;
	say "LIGHTS";

Carry out switching off the sunrod: 
	now the sunrod is unlit;
	say "DARKNESS";

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
[_ _ t THE CODE GRAVEYARD t _t ]
[

]
