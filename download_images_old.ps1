# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "images/pets/fish"
New-Item -ItemType Directory -Force -Path "images/pets/bird"
New-Item -ItemType Directory -Force -Path "images/pets/reptile"
New-Item -ItemType Directory -Force -Path "images/pets/turtle"

# Fish images
$fishImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/8/84/Nemo.jpg"; name="clownfish.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/1/16/Goldfish_duo.jpg"; name="goldfish.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/6/62/Koi_carp.jpg"; name="koi.jpg"}
)

# Bird images
$birdImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="sparrow.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/9/9d/European_Goldfinch.jpg"; name="goldfinch.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/5/5c/Blue_Jay_by_Dan_Pancamo.jpg"; name="blue_jay.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/d/de/Ruby-throated_Hummingbird.jpg"; name="hummingbird.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/d/d2/Red_tailed_hawk_portrait.jpg"; name="hawk.jpg"}
)

# Reptile images
$reptileImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/9/96/Common_wall_lizard.jpg"; name="green_lizard.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/7/79/Gecko.jpg"; name="leopard_gecko.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/5/5c/Varanus_komodoensis1.jpg"; name="komodo_dragon.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/9/96/RedEaredSlider01.jpg"; name="red_eared_slider.jpg"}
)

# Turtle images
$turtleImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/c/ca/Caretta_caretta.jpg"; name="loggerhead.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/f/f1/Green_turtle.jpg"; name="green_sea_turtle.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/0/0c/Red_foot_tortoise.jpg"; name="red_footed_tortoise.jpg"}
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