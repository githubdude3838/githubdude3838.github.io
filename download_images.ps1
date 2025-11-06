# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "images/pets/fish"
New-Item -ItemType Directory -Force -Path "images/pets/bird"
New-Item -ItemType Directory -Force -Path "images/pets/reptile"
New-Item -ItemType Directory -Force -Path "images/pets/turtle"

# Fish images
$fishImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="clownfish.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="goldfish.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="koi.jpg"}
)

# Bird images
$birdImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="sparrow.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="goldfinch.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="blue_jay.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="hummingbird.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="hawk.jpg"}
)

# Reptile images
$reptileImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="green_lizard.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="leopard_gecko.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="komodo_dragon.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="red_eared_slider.jpg"}
)

# Turtle images
$turtleImages = @(
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="loggerhead.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="green_sea_turtle.jpg"},
    @{url="https://upload.wikimedia.org/wikipedia/commons/3/32/House_sparrow04.jpg"; name="red_footed_tortoise.jpg"}
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