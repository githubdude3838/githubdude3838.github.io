# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "images/pets/fish"
New-Item -ItemType Directory -Force -Path "images/pets/bird"
New-Item -ItemType Directory -Force -Path "images/pets/reptile"
New-Item -ItemType Directory -Force -Path "images/pets/turtle"

# Fish images
$fishImages = @(
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/fish1.jpg"; name="clownfish.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/fish2.jpg"; name="goldfish.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/fish3.jpg"; name="koi.jpg"}
)

# Bird images
$birdImages = @(
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/bird1.jpg"; name="sparrow.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/bird2.jpg"; name="goldfinch.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/bird3.jpg"; name="blue_jay.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/bird4.jpg"; name="hummingbird.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/bird5.jpg"; name="hawk.jpg"}
)

# Reptile images
$reptileImages = @(
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/reptile1.jpg"; name="green_lizard.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/reptile2.jpg"; name="leopard_gecko.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/reptile3.jpg"; name="komodo_dragon.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/reptile4.jpg"; name="red_eared_slider.jpg"}
)

# Turtle images
$turtleImages = @(
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/turtle1.jpg"; name="loggerhead.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/turtle2.jpg"; name="green_sea_turtle.jpg"},
    @{url="https://raw.githubusercontent.com/githubdude3838/animalimages/main/turtle3.jpg"; name="red_footed_tortoise.jpg"}
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
            $errorMsg = $_.Exception.Message
            Write-Host "Failed to download $($img.url) : $errorMsg"
        }
    }
}

# Download all images
Write-Host "Downloading fish images..."
Download-Images -images $fishImages -category "fish"

Write-Host "Downloading bird images..."
Download-Images -images $birdImages -category "bird"

Write-Host "Downloading reptile images..."
Download-Images -images $reptileImages -category "reptile"

Write-Host "Downloading turtle images..."
Download-Images -images $turtleImages -category "turtle"

Write-Host "All downloads complete!"