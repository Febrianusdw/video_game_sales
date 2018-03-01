
library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram

dashboardPage(
  skin = "blue",
  dashboardHeader(
    title="Video Games Sales",
    
    tags$li(a(href = 'https://www.kaggle.com/',
              img(src = 'kaggle.png',
                  title = "Data Source", height = "20px"),
              style = "padding-top:14px; padding-bottom:10px;"),
            class = "dropdown"),
    
    tags$li(a(href = 'https://www.linkedin.com/in/febrianus-dwiyantoro-wibisono/',
              icon("linkedin"),
                  title = "About Author", height = "20px"),
            class = "dropdown"),
    
  
    dropdownMenu(type="message", 
                 messageItem(
                   from="Author", 
                   message="Enjoy the program!",
                   time=substr(Sys.time(),1,10)
                 ),
                 
                 messageItem(
                   from="Disclaimer", 
                   message="All data are obtained from third party",
                   icon=icon("exclamation-circle"),
                   time = "2018-02-26"
                 )
                 )
  ),
  
  dashboardSidebar(
    sidebarMenu(
      id="sidebar",
      menuItem("Overview", tabName = "overview", icon=icon("laptop")),
      menuItem("Rating History", tabName = "rating", icon=icon("star"))
    )
  ),
  
  dashboardBody(
      tabItem("overview",
              fluidRow(
                infoBoxOutput("avgsales"),
                infoBoxOutput("toppub")
              )),

    fluidRow(
      box(
        title = "Video Games Publisher",
        background = "black",
        width=4,
        selectInput("input.pub", label = "Publisher Name:",
                    choices = c("1st Playable Productions",	"4J Studios",	"505 Games",	"Acclaim Entertainment",	"Acclaim Studios Cheltenham",	"Activision",	"Agenda",	"Angel Studios",	"Arena Entertainment",	"Argonaut Games",	"Artoon",	"Atari",	"Bethesda Softworks",	"Bethesda Softworks",	"Big Blue Box",	"BioWare",	"Black Box",	"Black Rock Studio",	"Bluepoint Games",	"Bullfrog Productions",	"Bungie",	"Capcom",	"CAProduction",	"Cat Daddy Games",	"CD Projekt Red Studio",	"Certain Affinity",	"Clap Hanz",	"Codemasters",	"Core Design Ltd.",	"Criterion Games",	"Cyan Worlds",	"DC Studios",	"Dice, Danger Close",	"Digital Eclipse",	"Dimps Corporation",	"Dimps Corporation, Sonic Team",	"Disney Interactive Studios",	"Double Helix Games",	"Dreamworks Interactive",	"EA Black Box",	"EA DICE, Danger Close",	"EA Games",	"EA LA",	"EA Redwood Shores",	"EA Sports, EA Vancouver",	"Edge of Reality",	"Eidos Interactive",	"Electronic Arts",	"Enix Corporation",	"Ensemble Studios",	"Eurocom Entertainment Software",	"Evolution Studios",	"Fox Interactive",	"Fox Interactive",	"From Software",	"Game Arts",	"Gearbox Software",	"Genius Sonority Inc.",	"GT Interactive",	"Guerrilla",	"HAL Labs",	"Harmonix Music Systems",	"Hasbro Interactive",	"Headstrong Games",	"High Moon Studios",	"Hudson",	"Hudson Soft",	"Indies Zero",	"Insomniac Games",	"Intelligent Systems",	"Io Interactive",	"Irrational Games, 2K Marin",	"Junction Point",	"JVC",	"KCET",	"Kojima Productions",	"Kojima Productions, Moby Dick Studio",	"Konami Computer Entertainment Hawaii",	"Konami Digital Entertainment",	"Level 5",	"Lionhead Studios",	"LucasArts",	"LucasArts",	"LucasArts, BioWare",	"Luxoflux, Inc.",	"Majesco Entertainment",	"Majesco Games, Majesco",	"Mass Media",	"Massive Entertainment",	"Media Molecule",	"Microsoft Game Studios",	"Midway",	"Midway Games",	"Monolith Productions",	"MTV Games",	"N/A",	"Namco Bandai Games",	"Namco Bandai Games",	"Naughty Dog, SCE/WWS",	"Nd Cube",	"NetherRealm Studios",	"Neversoft Entertainment, BudCat",	"Next Level Games",	"Nintendo",	"Nintendo EAD Tokyo",	"Nintendo, Namco Bandai Games",	"NuFX",	"Obsidian Entertainment",	"Office Create",	"OfficeCreate",	"Palcom",	"Pandemic Studios",	"Pipeworks Software, Inc.",	"Quantic Dream",	"Rainbow Studios",	"Rare Ltd.",	"Raven Software",	"Ready at Dawn",	"Red Orb",	"RedOctane",	"Reflections Interactive",	"Respawn Entertainment",	"Retro Studios",	"Retro Studios, Entertainment Analysis & Development Division",	"Rockstar Toronto",	"SCE Santa Monica",	"SCE/WWS, Media Molecule",	"SCEA, Zindagi Games",	"SCEE, Zoe Mode",	"Sega",	"Shiny Entertainment",	"Sledgehammer Games",	"Slightly Mad Studios",	"Sonic Team",	"Sony Computer Entertainment",	"Sony Computer Entertainment Europe",	"Spark Unlimited",	"Spike, Namco Bandai Games",	"Splash Damage, The Coalition",	"Square Enix",	"SquareSoft",	"Stormfront Studios",	"Sucker Punch",	"Sumo Digital",	"syn Sophia",	"Taito Corporation",	"Take-Two Interactive",	"Team Bondi",	"Team Fusion",	"Team Soho",	"The Sims Studio",	"THQ",	"THQ",	"TOSE",	"Toys for Bob",	"TT Fusion",	"Ubisoft",	"Ubisoft Paris",	"Ubisoft Paris, Ubisoft Montpellier",	"Ubisoft Quebec",	"Ubisoft Shanghai",	"Ubisoft, Ubisoft Montreal",	"Universal Interactive",	"Valve Software",	"Virgin Interactive",	"Virtual Toys",	"Vivendi Games",	"Volition Inc.",	"Warner Bros. Interactive Entertainment",	"Warner Bros. Interactive Entertainment, NetherRealm Studios",	"Yuke's",	"Zipper Interactive"
                    ),
                    selected = "Square Enix")
      ),
      
      box(
        title="Average Sales", solidHeader=T,
        collapsible = T,
        width=12,
        plotOutput("plot1", height = 300)
      )
      


      )
    
  )
)

