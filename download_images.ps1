# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "images/pets/fish"
New-Item -ItemType Directory -Force -Path "images/pets/bird"
New-Item -ItemType Directory -Force -Path "images/pets/reptile"
New-Item -ItemType Directory -Force -Path "images/pets/turtle"

# Fish images
$fishImages = @(
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Clownfish_(Amphiprion_ocellaris).jpg"; name="clownfish.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Goldfish3.jpg"; name="goldfish.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Koi_in_a_Pond.jpg"; name="koi.jpg"}
)

# Bird images
$birdImages = @(
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/House_sparrow04.jpg"; name="sparrow.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/European_goldfinch_-_Carduelis_carduelis.jpg"; name="goldfinch.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Blue_jay_3.jpg"; name="blue_jay.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Anna's_hummingbird,_Santa_Monica.jpg"; name="hummingbird.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Red-tailed_Hawk_(Buteo_jamaicensis).jpg"; name="hawk.jpg"}
)

# Reptile images
$reptileImages = @(
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Green_lizard_(Lacerta_viridis).jpg"; name="green_lizard.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Leopard_gecko_(Eublepharis_macularius).jpg"; name="leopard_gecko.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Komodo_dragon_01.jpg"; name="komodo_dragon.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Red-eared_slider_(Trachemys_scripta_elegans).jpg"; name="red_eared_slider.jpg"}
)

# Turtle images
$turtleImages = @(
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Loggerhead_sea_turtle.jpg"; name="loggerhead.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Green_sea_turtle_cropped.jpg"; name="green_sea_turtle.jpg"},
    @{url="https://commons.wikimedia.org/wiki/Special:FilePath/Red-footed_Tortoise_(Chelonoidis_carbonarius).jpg"; name="red_footed_tortoise.jpg"}
)

# Function to download images
function Download-Images {
    param (
        [array]$images,
        [string]$category
    )
    
    foreach ($img in $images) {
        $outPath = "images/pets/$category/$($img.name)"
        Write-Host "Downloading $($img.url) to $outPath"
        try {
            Invoke-WebRequest -Uri $img.url -OutFile $outPath
            Write-Host "Successfully downloaded $($img.name)"
        }
        catch {
            Write-Host "Failed to download $($img.url): $_"
        }
    }
}

# Download all images
Write-Host "Downloading fish images..."
Download-Images -images $fishImages -category "fish"

Write-Host "`nDownloading bird images..."
Download-Images -images $birdImages -category "bird"

Write-Host "`nDownloading reptile images..."
Download-Images -images $reptileImages -category "reptile"

Write-Host "`nDownloading turtle images..."
Download-Images -images $turtleImages -category "turtle"

Write-Host "`nAll downloads complete!"