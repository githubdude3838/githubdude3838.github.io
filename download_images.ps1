# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "images/pets/fish"
New-Item -ItemType Directory -Force -Path "images/pets/bird"
New-Item -ItemType Directory -Force -Path "images/pets/reptile"
New-Item -ItemType Directory -Force -Path "images/pets/turtle"

# Fish images
$fishImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/3d/Amphiprion_ocellaris_%28Clown_anemonefish%29_by_Nick_Hobgood.jpg"; name="clownfish.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/2/2f/Orange_fantail_goldfish.jpg"; name="goldfish.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/f/f5/Cyprinus_carpio_koi_01.jpg"; name="koi.jpg"}
)

# Bird images
$birdImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="sparrow.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/f/f3/Carduelis_carduelis_-_European_goldfinch_04.jpg"; name="goldfinch.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/d/df/Blue_jay_%28Cyanocitta_cristata%29_in_flight.jpg"; name="blue_jay.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/d/d6/Anna%27s_Hummingbird.jpg"; name="hummingbird.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/5/54/Red-tailed_hawk_in_flight.jpg"; name="hawk.jpg"}
)

# Reptile images
$reptileImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/1/18/Lacerta_viridis_%28Sand_Lizard%29_-_green_variant.jpg"; name="green_lizard.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/9/97/Leopard_gecko_on_hand.jpg"; name="leopard_gecko.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/8/85/Varanus_komodoensis1.jpg"; name="komodo_dragon.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/37/Female_red_eared_slider.jpg"; name="red_eared_slider.jpg"}
)

# Turtle images
$turtleImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/1/1f/Loggerhead_sea_turtle_%28Caretta_caretta%29.jpg"; name="loggerhead.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/5/5c/Green_turtle_swimming_over_coral_reefs_in_Kona.jpg"; name="green_sea_turtle.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/38/Red-footed_tortoise_%28Chelonoidis_carbonaria%29_head.jpg"; name="red_footed_tortoise.jpg"}
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