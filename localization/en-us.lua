return {
    descriptions = {
        Draft_Mode = {
            mode_draft_casl_none = {
                name = "Standard Deck",
                text = { "No drafting." }
            },
            mode_draft_draft = {
                name = "Draft",
                text = {
                    "Start run with no deck",
                    "and {C:attention}#1# {C:packet}Draft Tags{}",
                },
            },
            mode_draft_sealed = {
                name = "Sealed",
                text = {
                    "Start run with no deck",
                    "and {C:attention}#1# {C:parcel}Sealed Tag{}",
                },
            },
        },
        Back = {
            b_draft_draftdeck = {
                name = "Draft Deck",
                text = {
                    "Start run with no deck",
                    "and {C:attention}#1# {C:packet,T:tag_draft_drafttag}Draft Tags{}",
                },
            },
            b_draft_sealeddeck = {
                name = "Sealed Deck",
                text = {
                    "Start run with no deck",
                    "and {C:attention}#1# {C:parcel,T:tag_draft_sealedtag}Sealed Tag{}",
                },
            },
            b_draft_clipperdeck = {
                name = "Rending Deck",
                text = {
                    "Start run with {C:attention}#1#",
                    "{C:packet,T:tag_draft_clippertag}Cleaving Tags{}",
                },
            },
            b_draft_evolvingdeck = {
                name = "Evolving Deck",
                text = {
                    "Start run with no deck",
                    "and {C:attention}#1# {C:parcel,T:tag_draft_slimsealedtag}Slim Sealed Tag{}",
                    "After defeating each","{C:attention}Boss Blind{}, gain a {C:packet,T:tag_draft_drafttag}Draft Tag{}"
                },
            },
        },
        Joker = {
            
        },
        Enhanced = {
            
        },
        Tarot = {
            
        },
        Spectral = {
            c_draft_boon = {
                name = "Boon",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "with random {C:attention}Editions{}",
                    "and random {C:attention}Seals{}"
                },
            },
            c_draft_godsend = {
                name = "Godsend",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} cards",
                    "with random {C:attention}Editions{}",
                    "{C:green}X#3#{} other cards"
                },
            },
            c_draft_atroposshears = {
                name = "Atropos's Shears",
                text = {
                    "Destroy {C:red}all{}",
                    "{C:attention}selected{} cards"
                },
            }
        },
        Packet = {
            c_draft_revolution = {
                name = "Revolution",
                text = {
                    "{C:money}#1#{}",
                    "Destroy {C:attention}#2#{} random {C:attention}face{}",
                    "cards in your deck",
                    "{C:green}X#3#{} random cards"
                },
            },
            c_draft_tradesecrets = {
                name = "Trade Secrets",
                text = {
                    "{C:money}#1#{}",
                    "Destroy {C:attention}#2#{} random cards",
                    "in your deck",
                    "{C:green}X#3#{} random cards"
                },
            },
            c_draft_turkey = {
                name = "Turkey",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of {C:attention}one{} rank"
                },
            },
            c_draft_abandonallhope = {
                name = "Abandon All Hope",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} of each",
                    "{C:attention}non-face{} rank"
                },
            },
            c_draft_thewholeshebang = {
                name = "The Whole Shebang",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} of {C:attention}each{} card"
                },
            },
            c_draft_skipcoupon = {
                name = "Skip Coupon",
                text = {
                    "{C:money}#1#{}",
                    --"{C:green}X#2#{} random cards"
                },
            },
            c_draft_slimpickings = {
                name = "Slim Pickings",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards"
                },
            },
            c_draft_capitalinvestment = {
                name = "Capital Investment",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards"
                },
            },
            c_draft_loan = {
                name = "Loan",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random",
                    "cards"
                },
            },
            c_draft_olreliable = {
                name = "Ol' Reliable",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards"
                },
            },
            c_draft_heavyheart = {
                name = "Heavy Heart",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:heart}Hearts{}"
                },
            },
            c_draft_diamondsareforever = {
                name = "Diamonds are Forever",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:diamond}Diamonds{}"
                },
            },
            c_draft_hittheclub = {
                name = "Hit the Club",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:club}Clubs{}"
                },
            },
            c_draft_beinclover = {
                name = "Be in Clover",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:clover}Clovers{}"
                },
            },
            c_draft_fleuronfighters = {
                name = "Fleuron Fighters",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:bunc_fleurons}Fleurons{}"
                },
            },
            c_draft_halberdsninek = {
                name = "Halberds 9000",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:bunc_halberds}Halberds{}"
                },
            },
            c_draft_inspades = {
                name = "In Spades",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:spade}Spades{}"
                },
            },
            c_draft_suitup = {
                name = "Suit Up",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of {C:attention}one{} suit"
                },
            },
            c_draft_bandwagon = {
                name = "Bandwagon",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of your {C:attention}most",
                    "{C:attention}abundant{} suit"
                },
            },
            c_draft_roadnottaken = {
                name = "Road Not Taken",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "{C:red}not{} of your {C:attention}most",
                    "{C:attention}abundant{} suit"
                },
            },
            c_draft_perfectcurve = {
                name = "Perfect Curve",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}Ace{}",
                    "{C:green}X#2#{} random {C:attention}2{}",
                    "{C:green}X#2#{} random {C:attention}3{}",
                    "{C:green}X#2#{} random {C:attention}5{}",
                    "{C:green}X#2#{} random {C:attention}8{}",
                },
            },
            c_draft_notaddingup = {
                name = "Not Adding Up",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}4{}",
                    "{C:green}X#2#{} random {C:attention}6{}",
                    "{C:green}X#2#{} random {C:attention}7{}",
                    "{C:green}X#2#{} random {C:attention}9{}",
                    "{C:green}X#2#{} random {C:attention}10{}",
                },
            },
            c_draft_copycat = {
                name = "Copycat",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of your {C:attention}most",
                    "{C:attention}abundant{} rank"
                },
            },
            c_draft_alternative = {
                name = "Alternative",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "{C:red}not{} of your {C:attention}most",
                    "{C:attention}abundant{} rank"
                },
            },
            c_draft_stairwaytoheaven = {
                name = "Stairway to Heaven",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "that form a {C:attention}Straight{}"
                },
            },
            c_draft_lovetriangle = {
                name = "Love Triangle",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} of",
                    "each {C:attention}face{} card"
                },
            },
            c_draft_straightaway = {
                name = "Straight Away",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "that form a {C:attention}Straight{}"
                },
            },
            c_draft_plunger = {
                name = "Plunger",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "that form a",
                    "{C:attention}Straight Flush{}"
                },
            },
            c_draft_faceoff = {
                name = "Face-Off",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random",
                    "{C:attention}face{} cards"
                },
            },
            c_draft_oddoneout = {
                name = "Odd One Out",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of {C:attention}odd{} rank"
                },
            },
            c_draft_eventheodds = {
                name = "Even the Odds",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of {C:attention}even{} rank"
                },
            },
            c_draft_hackerman = {
                name = "Hackerman",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of rank {C:attention}2{}, {C:attention}3{}, {C:attention}4{}, or {C:attention}5{}"
                },
            },
            c_draft_pocketaces = {
                name = "Pocket Aces",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}Aces{}"
                },
            },
            c_draft_middleoftheroad = {
                name = "Middle of the Road",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of rank {C:attention}6{}, {C:attention}7{}, {C:attention}8{}, {C:attention}9{}, or {C:attention}10{}"
                },
            },
            c_draft_steelworker = {
                name = "Steelworker",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} {C:attention}Steel{} cards"
                },
            },
            c_draft_totallybaked = {
                name = "Totally Baked",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} {C:attention}Stone{} cards"
                },
            },
            c_draft_bonusround = {
                name = "Bonus Round",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} {C:attention}Bonus{} cards"
                },
            },
            c_draft_multiplexer = {
                name = "Multiplexer",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} {C:attention}Mult{} cards"
                },
            },
            c_draft_wildchild = {
                name = "Wild Child",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} {C:attention}Wild{} cards"
                },
            },
            c_draft_fragile = {
                name = "Fragile",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} {C:attention}Glass{} cards"
                },
            },
            c_draft_devilsnumber = {
                name = "Devil's Number",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}Gold 6{}",
                    "{C:green}X#3#{} random {C:attention}6{}s"
                },
            },
            c_draft_gamblersdream = {
                name = "Gambler's Dream",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}Lucky 7{}s"
                },
            },
            c_draft_spectralforce = {
                name = "Spectral Force",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:spectral}Spectral{} card"
                },
            },
            c_draft_tarotreading = {
                name = "Tarot Reading",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:tarot}Tarot{} card"
                },
            },
            c_draft_codemonkey = {
                name = "Code Monkey",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:cry_code}Code{} card"
                },
            },
            c_draft_thegathering = {
                name = "The Gathering",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:magic}Magic{} card"
                },
            },
            c_draft_polytheism = {
                name = "Polytheism",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:bunco_virtual_dark}Polymino{} card"
                },
            },
            c_draft_keepemcoming = {
                name = "Keep 'Em Coming",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:packet}Draft Tag{}"
                },
            },
            c_draft_planetaryalignment = {
                name = "Planetary Alignment",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:planet}Minior Tag{}"
                },
            },
            c_draft_justriffin = {
                name = "Just Riffin'",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:blue}Common{} {C:attention}Joker{}"
                },
            },
            c_draft_menatwork = {
                name = "Men At Work",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "Create a {C:attention}Blueprint{}"
                },
            },
            c_draft_myprecious = {
                name = "My Precious",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "{C:green}X#3#{} random card",
                    "with a random {C:attention}Edition{}"
                },
            },
            c_draft_sealthedeal = {
                name = "Seal the Deal",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "{C:green}X#3#{} random card",
                    "with a random {C:attention}Seal{}"
                },
            },
            c_draft_chosenone = {
                name = "Chosen One",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random card",
                    "with a random {C:attention}Edition{}",
                    "and a random {C:attention}Seal{}"
                },
            },
            c_draft_wheelofdestiny = {
                name = "Wheel of Destiny",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}#2# in #3#{} chance for",
                    "{C:green}X#4#{} random card",
                    "with a random {C:attention}Edition{}",
                    "and a random {C:attention}Seal{}",
                    "Otherwise, {C:green}X#5#{} random cards"
                },
            },
            c_draft_anythinggoes = {
                name = "Anything Goes",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}Enhanced{} cards"
                },
            },
            c_draft_bridgethegap = {
                name = "Bridge the Gap",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random {C:attention}linked{} cards"
                },
            },
            c_draft_rainbow = {
                name = "Rainbow",
                text = {
                    "{C:money}#1#{}",
                    "{C:green}X#2#{} random cards",
                    "of {C:attention}different{} suits"
                },
            },
        },
        Parcel = {
            c_draft_thedarkside = {
                name = "The Dark Side",
                text = {
                    --"{C:money}#1#{}",
                    "{C:green}X#2#{} {C:club}Clubs{}",
                    "{C:green}X#3#{} {C:spade}Spades{}",
                },
            },
            c_draft_betterredthandead = {
                name = "Better Red Than Dead",
                text = {
                    "{C:green}X#2#{} {C:heart}Hearts{}",
                    "{C:green}X#3#{} {C:diamond}Diamonds{}"
                },
            },
            c_draft_checkered = {
                name = "Checkered",
                text = {
                    "{C:green}X#2#{} {C:heart}Hearts{}",
                    "{C:green}X#3#{} {C:spade}Spades{}"
                },
            },
            c_draft_chessboard = {
                name = "Chessboard",
                text = {
                    "{C:green}X#2#{} {C:diamond}Diamonds{}",
                    "{C:green}X#3#{} {C:clubs}Clubs{}"
                },
            },
            c_draft_bloodandiron = {
                name = "Blood and Iron",
                text = {
                    "{C:green}X#2#{} {C:heart}Hearts{}",
                    "{C:green}X#3#{} {C:club}Clubs{}"
                },
            },
            c_draft_digginanddrillin = {
                name = "Diggin' and Drillin'",
                text = {
                    "{C:green}X#2#{} {C:diamond}Diamonds{}",
                    "{C:green}X#3#{} {C:spade}Spades{}"
                },
            },
            c_draft_facethemusic = {
                name = "Face the Music",
                text = {
                    "{C:green}X#2#{} {C:attention}face{} cards",
                    "{C:green}X#3#{} cards with",
                    "{C:red}no{} {C:attention}Aces{}"
                },
            },
            c_draft_havealltheaces = {
                name = "Have All the Aces",
                text = {
                    "{C:green}X#2#{} {C:attention}Aces{}",
                    "{C:green}X#3#{} other cards"
                },
            },
            c_draft_highvaluegoods = {
                name = "High Value Goods",
                text = {
                    "{C:green}X#2#{} {C:attention}Edition{} cards",
                    "{C:green}X#3#{} other cards"
                },
            },
            c_draft_hackstarterpack = {
                name = "Hack Starter Pack",
                text = {
                    "{C:green}X#2#{} cards of",
                    "rank {C:attention}2{}, {C:attention}3{}, {C:attention}4{}, or {C:attention}5{} ",
                    "{C:green}X#3#{} other cards",
                    "Create a {C:attention}Hack{}"
                },
            },
            c_draft_thefutureismeow = {
                name = "The Future is Meow",
                text = {
                    "{C:green}X#2#{} {C:attention}lucky 7{}s",
                    "{C:green}X#3#{} other cards",
                    "Create a {C:attention}Lucky Cat{}"
                },
            },
            c_draft_psychichex = {
                name = "Psychic Hex",
                text = {
                    "{C:green}X#2#{} {C:attention}Enhanced 6{}s",
                    "{C:green}X#3#{} other cards",
                    "Create a {C:attention}Sixth Sense{}"
                },
            },
            c_draft_whoyougonnacall = {
                name = "Who You Gonna Call",
                text = {
                    "{C:green}X#2#{} {C:attention}4{}s and {C:attention}10{}s",
                    "{C:green}X#3#{} other cards",
                    "Create a {C:attention}Walkie Talkie{}"
                },
            },
            c_draft_stowaway = {
                name = "Stowaway",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create a {C:attention}Riff-Raff{}"
                },
            },
            c_draft_illicitshipment = {
                name = "Illicit Shipment",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create a {C:attention}Gros Michel{}"
                },
            },
            c_draft_exoticshipment = {
                name = "Exotic Shipment",
                text = {
                    "{C:green}X#2#{} {C:bunco_exotic}Exotic{} cards",
                    "{C:green}X#2#{} other cards"
                },
            },
            c_draft_polymerchains = {
                name = "Polymer Chains",
                text = {
                    "{C:green}X#2#{}  cards",
                    "Create an {C:bunco_virtual_dark}Arcade Tag{}"
                },
            },
            c_draft_allalone = {
                name = "All Alone",
                text = {
                    "{C:green}X#2#{} cards with",
                    "{C:red}no{} {C:attention}face{} cards"
                },
            },
            c_draft_investinyourself = {
                name = "Invest in Yourself",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create an {C:green}Investment Tag{}"
                },
            },
            c_draft_overdraft = {
                name = "Overdraft",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create an {C:packet}Draft Tag{}"
                },
            },
            c_draft_yourreadingis = {
                name = "Your Reading Is...",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create a {C:tarot}Charm Tag{}"
                },
            },
            c_draft_spectralprocession = {
                name = "Spectral Procession",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create a {C:spectral}Ethereal Tag{}"
                },
            },
            c_draft_aimforthestars = {
                name = "Aim for the Stars",
                text = {
                    "{C:green}X#2#{} cards",
                    "Create a {C:planet}Meteor Tag{}"
                },
            },
        },
        Clipper = {
            c_draft_safetyscissors = {
                name = "Safety Scissors",
                text = {
                    --"{C:money}#1#{}",
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} cards"
                },
            },
            c_draft_chainsaw = {
                name = "Chainsaw",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}random{} cards"
                },
            },
            c_draft_pizzacutter = {
                name = "Pizza Cutter",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}random{} {C:red}non{}-{C:attention}face{} cards"
                },
            },
            c_draft_sword = {
                name = "Sword",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}random{} {C:attention}face{} cards"
                },
            },
            c_draft_sharktooth = {
                name = "Shark Tooth",
                text = {
                    "Destroy {C:red}X#2#-#3#{}",
                    "{C:attention}random{} cards"
                },
            },
            c_draft_cleaver = {
                name = "Cleaver",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} cards of",
                    "rank {C:attention}#3#{} or less"
                },
            },
            c_draft_embroideryscissors = {
                name = "Embroidery Scissors",
                text = {
                    "Destroy {C:red}X#2#{} {C:attention}selected{} cards",
                    "and {C:red}X#3#{} {C:attention}random{} card"
                },
            },
            c_draft_butterknife = {
                name = "Butter Knife",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} card",
                    "and {C:red}X#3#{}",
                    "{C:attention}random{} cards"
                },
            },
            c_draft_club = {
                name = "Club",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} {C:club}Clubs{}"
                },
            },
            c_draft_spade = {
                name = "Spade",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} {C:spade}Spades{}"
                },
            },
            c_draft_diamondcutter = {
                name = "Diamond Cutter",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} {C:diamond}Diamonds{}"
                },
            },
            c_draft_scalpel = {
                name = "Scalpel",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} {C:heart}Hearts{}"
                },
            },
            c_draft_axe = {
                name = "Axe",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} {C:attention}face{} cards"
                },
            },
            c_draft_guillotine = {
                name = "Guillotine",
                text = {
                    "Destroy {C:red}all{}",
                    "{C:attention}face{} cards"
                },
            },
            c_draft_scythe = {
                name = "Scythe",
                text = {
                    "Destroy {C:red}all{}",
                    "cards of rank {C:attention}#2#{}",
                    "or less"
                },
            },
            c_draft_lasercutter = {
                name = "Laser Cutter",
                text = {
                    "Destroy {C:red}X#2#{}",
                    "{C:attention}selected{} cards of",
                    "equal rank"
                },
            },
        },
        Tag = {
            tag_draft_drafttag = {
                name = "Draft Tag",
                text = {
                    "Immediately open a",
                    "{C:packet}Draft Crate{}",
                },
            },
            tag_draft_megadrafttag = {
                name = "Mega Draft Tag",
                text = {
                    "Immediately open a",
                    "{C:packet}Mega Draft Crate{}",
                },
            },
            tag_draft_miniortag = {
                name = "Minior Tag",
                text = {
                    "Gives a free",
                    "{C:planet}Celestial Pack{}",
                },
            },
            tag_draft_sealedtag = {
                name = "Sealed Tag",
                text = {
                    "Immediately open a",
                    "{C:parcel}Sealed Crate{}",
                },
            },
            tag_draft_slimsealedtag = {
                name = "Slim Sealed Tag",
                text = {
                    "Immediately open a",
                    "{C:parcel}Slim Sealed Crate{}",
                },
            },
            tag_draft_clippertag = {
                name = "Cleaving Tag",
                text = {
                    "Immediately open a",
                    "{C:packet}Cleaving Crate{}",
                },
            },
        },
        Sleeve = {
			sleeve_draft_draftsleeve = {
				name = "Draft Sleeve",
				text = {
                    "Start run with no deck",
                    "and {C:attention}#1#{} {C:packet,T:tag_draft_drafttag}Draft Tags{}"
				},
			},
			sleeve_draft_draftsleeve_alt = {
				name = "Draft Sleeve",
				text = {
                    "Start run with",
                    "{C:attention}#1#{} {C:packet,T:tag_draft_megadrafttag}Mega Draft Tags{}",
                    "too"
				},
			},
			sleeve_draft_sealedsleeve = {
				name = "Sealed Sleeve",
				text = {
                    "Start run with no deck",
                    "and {C:attention}#1#{} {C:parcel,T:tag_draft_sealedtag}Sealed Tags{}"
				},
			},
			sleeve_draft_sealedsleeve_alt = {
				name = "Sealed Sleeve",
				text = {
                    "Start run with",
                    "{C:attention}#1#{} {C:parcel,T:tag_draft_slimsealedtag}Slim Sealed Tag{}",
                    "too"
				},
			},
            sleeve_draft_clippersleeve = {
				name = "Rending Sleeve",
				text = {
                    "Start run with {C:attention}#1#{} {C:clipper,T:tag_draft_clippertag}Cleaving Tags{}"
				},
			},
			sleeve_draft_evolvingsleeve = {
				name = "Evolving Sleeve",
				text = {
                    "Start run with no deck",
                    "and {C:attention}#1# {C:parcel,T:tag_draft_slimsealedtag}Slim Sealed Tag{}",
                    "After defeating each","{C:attention}Boss Blind{}, gain a {C:packet,T:tag_draft_drafttag}Draft Tag{}"
				},
			},
			sleeve_draft_evolvingsleeve_alt = {
				name = "Evolving Sleeve",
				text = {
                    "After defeating each","{C:attention}Boss Blind{}, gain a {C:packet,T:tag_draft_drafttag}Draft Tag{}"
				},
			},
        },
        Other = {
            p_draft_pack = {
                name = "Draft Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:packet}Packets{}"
                }
            },
            p_draft_pack_1 = {
                name = "Draft Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:packet}Packets{}"
                }
            },
            p_draft_mega_draft_pack_1 = {
                name = "Mega Draft Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:packet}Packets{}"
                }
            },
            p_draft_sealed_pack = {
                name = "Sealed Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:parcel}Parcels{}"
                }
            },
            p_draft_sealed_pack_1 = {
                name = "Sealed Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:parcel}Parcels{}"
                }
            },
            p_draft_slim_sealed_pack_1 = {
                name = "Slim Sealed Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:parcel}Parcels{}"
                }
            },
            p_draft_clipper_pack = {
                name = "Cleaving Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:clipper}Clippers{}"
                }
            },
            p_draft_clipper_pack_1 = {
                name = "Cleaving Crate",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:clipper}Clippers{}"
                }
            },
        }
    },
    misc = {
        suits_singular = {
            
        },
        suits_plural = {

        },
        dictionary = {
            k_draft_draft_pack = "Draft Crate",
            k_draft_sealed_pack = "Sealed Crate",
            k_draft_clipper_pack = "Cleaving Crate",
            k_mtj = "MTJ",
            k_cryptid = "Cryptid",
            k_bunco = "Bunco",
            k_multisuitmods = "Suit Mods",
            mode_not_found_error = "Mode could not be found! Did you remove its mod?",
            
            neutral_packet_collation = "Neutral Packet Collation",
            neutral_packet_collation_desc = {
                "Draft Crates will always contain",
                "at least one neutral Packet"
            },
            include_in_run = "Include in Run",
            include_in_run_desc = {
                "Draft and Cleaving Crates will",
                "appear in runs"
            },
            soul_cards = "Soul Cards",
            soul_cards_desc = {
                "Include Soul cards for",
                "Packets, Parcels and Clippers",
                "(Requires restart)"
            },
        },
        labels = {

        },
        v_dictionary = {

        }
    }
}
